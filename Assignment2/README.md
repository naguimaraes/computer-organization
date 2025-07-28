# Assignment 2 - CPU Performance Analysis with gem5 Simulator

## Overview

This assignment focuses on analyzing the impact of different CPU configurations on algorithm performance using the gem5 simulator. The main objective is to understand how variations in functional unit latencies affect the execution time of different types of algorithms, particularly those that are multiplication-intensive and square root-intensive.

## Assignment Objectives

The assignment explores how different latency configurations for multiplication and square root operations impact performance across various benchmark algorithms. Three different CPU configurations are tested:

1. **Smaller latency**: Lower latency for multiplication and square root operations
2. **Bigger latency**: Medium latency for multiplication and square root operations  
3. **Biggest latency**: Higher latency for multiplication and square root operations

## Benchmark Algorithms

The following benchmark programs are used to evaluate CPU performance:

### 1. Kruskal's Algorithm (`kruskal.c`)

Implements Kruskal's minimum spanning tree algorithm. This algorithm involves:

- Graph processing with edge sorting
- Union-find data structure operations
- Moderate computational complexity

### 2. Primality Test (`primality.c`)

Implements a prime number checking algorithm that:

- Tests numbers for primality using trial division
- Uses square root operations for optimization
- Heavy on square root calculations

### 3. SHA-256 Hash (`sha256.c`)

Implements the SHA-256 cryptographic hash function:

- Bitwise operations and logical functions
- Multiple rounds of computation
- Intensive arithmetic operations

## Implementation Structure

### CPU Configurations (`orgb_configs/systems/cpus/`)

- **`MyO3CPU.py`**: Base CPU configuration with default latencies
- **`mult/`**: Directory containing multiplication latency variations
  - `smaller.py`: Lower multiplication latency configuration
  - `bigger.py`: Medium multiplication latency configuration
  - `biggest.py`: Higher multiplication latency configuration
- **`sqrt/`**: Directory containing square root latency variations
  - `smaller.py`: Lower square root latency configuration
  - `bigger.py`: Medium square root latency configuration
  - `biggest.py`: Higher square root latency configuration

### Cache Configurations (`orgb_configs/systems/caches/`)

- **`basic_caches.py`**: Basic cache configuration
- **`l1/`**: L1 cache configuration variants

### Benchmark Programs (`orgb_progs/`)

- **`kruskal.c`**: Kruskal's minimum spanning tree algorithm
- **`primality.c`**: Prime number checking algorithm
- **`sha256.c`**: SHA-256 cryptographic hash implementation
- **`generate_matrix.c`**: Matrix generation utility
- **`generate_string.c`**: String generation utility
- **`hello.c`**: Simple hello world program for testing

### Simulation Control

- **`simulate.py`**: Main simulation script for gem5
- **`puppet.py`**: Automation script to run all configurations and benchmarks
- **`systems/system_manager.py`**: System configuration management

### Results (`m5out/`)

The results directory contains subdirectories for each configuration:

- **`base/`**: Baseline configuration results
- **`l1/`**: L1 cache configuration results
- **`mult/`**: Multiplication latency configuration results
- **`sqrt/`**: Square root latency configuration results

Each subdirectory contains `.txt` files with detailed gem5 simulation statistics for each benchmark algorithm.

## Automation Script

The `puppet.py` script automates the execution of all benchmark algorithms across different CPU configurations:

```bash
python3 puppet.py --algorithms kruskal primality sha256 --configs smaller bigger biggest --base base
```

This script:

- Automatically copies the appropriate CPU configuration files
- Runs each benchmark algorithm with each configuration
- Collects and organizes the results in the `m5out/` directory
- Provides comprehensive performance analysis data

## Performance Analysis

The assignment evaluates how different functional unit latencies affect:

1. **Overall execution time** (sim_seconds)
2. **Instructions per second** (host_inst_rate)
3. **Memory bandwidth utilization** (bw_read, bw_write)
4. **Cache performance** (cache hit/miss rates)
5. **Functional unit utilization** (FU busy cycles)

## Results Interpretation

By comparing the simulation statistics across different configurations, you can analyze:

- Which algorithms are more sensitive to multiplication latency changes
- Which algorithms are more sensitive to square root latency changes
- The trade-offs between different CPU configurations
- The impact of functional unit design choices on real-world performance

Our analysis was compiled in `Results.pdf`, which is a slide show summarizing the findings and insights gained from the simulations. The assignment was given a grade of 9.5/10 from the professor.

## Docker container for gem5 simulator with x86 architecture for educational purposes

The full documentation on gem5 can be found [at gem5 official documentation](https://www.gem5.org/documentation/).

## Prerequisites

- Docker installed on your machine
- Git installed on your machine

After cloning this repository, go to the repository directory and follow the instructions below.

## How to build and run the docker container

This command will build the docker container with the name orgb_gem5:

```bash
docker build -t orgb_gem5 .
```

After that, you can run the docker container with the following command:

```bash
docker run -u ${UID}:${GID} -v ${PWD}/orgb_progs:/gem5/orgb_progs -v ${PWD}/orgb_configs:/gem5/orgb_configs -v ${PWD}/m5out:/gem5/m5out --rm -it orgb_gem5
```

If you want to build and run the docker container in a single command, run the following command:

```bash
docker build -t orgb_gem5 . && docker run -u ${UID}:${GID} -v ${PWD}/orgb_progs:/gem5/orgb_progs -v ${PWD}/orgb_configs:/gem5/orgb_configs -v ${PWD}/m5out:/gem5/m5out --rm -it orgb_gem5
```

For the first time, the docker container will be built and run. After that, the container will be run.

## How to run gem5 simulator

This container already provides the gem5 simulator for x86 architecture. To run the gem5 simulator, run the following command:

```bash
./gem5 orgb_configs/simulate.py run-benchmark -c tests/test-progs/hello/bin/x86/linux/hello
```

After each run, the results will be saved in the m5out directory.

## Compile a program for gem5 simulator

To compile a program for gem5 simulator, run the following command:

```bash
gcc orgb_progs/hello.c -o orgb_progs/hello -static
```

All programs compiled for gem5 simulator must use the -static flag.

After that, you can run the program on gem5 simulator with:

```bash
./gem5 orgb_configs/simulate.py run-benchmark -c orgb_progs/hello
```

## Changing the gem5 simulator CPU and Cache configuration

To change the gem5 simulator CPU and Cache configuration, edit the orgb_configs/systems/cpus/MyO3CPU.py for the CPU configuration and orgb_configs/systems/caches/MyCache.py for the Cache configuration.

## How to build gem5 simulator for another architecture

To manually build gem5 simulator inside the docker container in another desired architecture, run the following command:

```bash
scons build/$GEM5_ARCH/gem5.opt -j$(nproc) && RUN ln -s build/$GEM5_ARCH/gem5.opt ./gem5.$GEM5_ARCH
```

Substitute $GEM5_ARCH with the desired architecture. For example, to build gem5 for ARM architecture, run the following command:

```bash
scons build/ARM/gem5.opt -j$(nproc) && RUN ln -s build/ARM/gem5.opt ./gem5.ARM
```
