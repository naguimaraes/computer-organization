#!/bin/env python3
from pathlib import Path
import shutil
import subprocess as sp
from argparse import ArgumentParser

parse = ArgumentParser()
parse.add_argument('--gem5', type=str, required=False, default="./gem5")
parse.add_argument('--algorithms', type=str, nargs='+', required=False, default=['kruskal', 'primality', 'sha256'])
parse.add_argument('--configs', type=str, nargs='+', required=False, default=['smaller', 'bigger', 'biggest'])
parse.add_argument('--base', type=str, required=False, default='base')
args = parse.parse_args()
gem5_cmd = args.gem5
algorithms = args.algorithms
config_names = args.configs
base_config_name = args.base

files = []
for path in Path('orgb_configs').rglob('*.py'):
    for name in config_names:
        if path.name.startswith(name):
            files.append(path)

base_cpu = Path(f'orgb_configs/systems/cpus/{base_config_name}.py')
base_cache = Path(f'orgb_configs/systems/caches/{base_config_name}.py')
replacement_cpu = Path('orgb_configs/systems/cpus/MyO3CPU.py')
replacement_cache = Path('orgb_configs/systems/caches/basic_caches.py')
m5_data = Path('m5out/stats.txt')

def run_benchmark(config_file: Path):
    for alg in algorithms:
        base_cmd = [gem5_cmd, 'orgb_configs/simulate.py', 'run-benchmark', '-c']
        sp.run([*base_cmd, f'orgb_progs/{alg}'], check=True)
        if 'base' in config_file.name:
            config_type = 'base'
            config_mode = '.'
        else:
            config_type = config_file.parts[3] if len(config_file.parts) > 3 else '.'
            config_mode = config_file.parts[4].replace('.py', '') if len(config_file.parts) > 4 else '.'
        folder = Path('data') / config_type / config_mode
        folder.mkdir(parents=True, exist_ok=True)
        data_file = folder / f'{alg}.txt'
        shutil.move(m5_data, data_file)

# Run the benchmark with the base configuration
shutil.copyfile(base_cpu, replacement_cpu)
shutil.copyfile(base_cache, replacement_cache)
run_benchmark(base_cpu)

for file in files:
    if 'cpus' in file.parts:
        # Copy the new configuration file to the correct location
        shutil.copyfile(file, replacement_cpu)
        # Run the benchmark
        run_benchmark(file)
        # Copy the base configuration file back
        shutil.copyfile(base_cpu, replacement_cpu)
    elif 'caches' in file.parts:
        # Copy the new configuration file to the correct location
        shutil.copyfile(file, replacement_cache)
        # Run the benchmark
        run_benchmark(file)
        # Copy the base configuration file back
        shutil.copyfile(base_cache, replacement_cache)
