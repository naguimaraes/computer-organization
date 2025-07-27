# Single-cycle

In the single-cycle implementation, each instruction is executed in a single clock cycle. This means that all stages of the instruction cycle (fetch, decode, execution, memory access, and register write-back) are performed in a single cycle. While it is simple to understand and implement, this approach can be inefficient in terms of performance, as some instructions may take longer to execute than others.

It is important to note that the way this processor was implemented in the Logisim software physically separates the instruction and data memories. This means that to test the processor, it is necessary to generate an instruction memory file and a data memory file separately.

## Running the Processor

To execute the project, follow the steps below:

1. Open the [Logisim software](../Simulators/logisim-win-2.7.1.exe).

2. Load the `.circ` file corresponding to the processor implementation.

3. Load all memory files contained in this folder.

4. Manually generate clock signals to simulate processor execution and view the results.

## Implementation Structure

The following files and folders are present in the single-cycle implementation:

- `MEM_Data`: Processor data memory.

- `MEM_Instruction`: Processor instruction memory.

- `MIPS_Monociclo.circ`: Implementation of the processor's datapath itself, to be opened in the Logisim software.

- `testbench-logisim.asm`: Assembly code to test the added instructions. This code will only run in the Logisim simulator, as it assumes that data and instructions are in different memories, both starting at address `0x00000000`.

- `testbench-mars.asm`: Assembly code to test the added instructions. This code will only run in the MARS simulator, as it assumes that data starts at address `0x00001001` (.data) and instructions start at address `0x00400000` (.text).

## How to modify the Control ROM

The processor control is done through a ROM memory, which implements a truth table with control outputs for each instruction. The ROM input is the current instruction's opcode, through which the memory position containing the control outputs for the instruction itself is obtained.

To modify it, simply insert into the ROM, at the address corresponding to the instruction's opcode, the hexadecimal value that corresponds to the control output bit vector for the desired instruction.
