# Pipeline (5-stage)

In the 5-stage pipeline implementation, the instruction cycle is divided into five stages: instruction fetch, decode, execution, memory access, and register write-back. Each stage is executed in a separate clock cycle, and multiple instructions can be executed simultaneously in different stages of the pipeline. This allows for more efficient instruction execution and better performance compared to single-cycle and multi-cycle implementations. However, pipeline implementation also introduces additional challenges, such as data dependencies and pipeline hazards.

Like the single-cycle, this processor was implemented in Logisim software to physically separate the instruction and data memories. This means that to test the processor, it is necessary to generate an instruction memory file and a data memory file separately.

## Running the Processor

To execute the project, follow the steps below:

1. Open the [Logisim software](../Simulators/logisim-win-2.7.1.exe).

2. Load the `.circ` file corresponding to the processor implementation.

3. Load all memory files contained in this folder.

4. Manually generate clock signals to simulate processor execution and view the results.

## Implementation Structure

The following files and folders are present in the pipeline implementation:

- `MEM_Data`: Processor data memory.

- `MEM_Instruction`: Processor instruction memory.

- `Control_ROM`: <!--- TODO: when you figure out what this file is, write it here--->

- `MIPS_Pipeline.circ`: Implementation of the processor's datapath itself, to be opened in the Logisim software.

- `testbench-logisim.asm`: Assembly code to test the added instructions. This code will only run in the Logisim simulator, as it assumes that data and instructions are in different memories, both starting at address `0x00000000`. Another detail is that, to avoid data dependencies, the code was written to intersperse all operations with multiple NOP instructions.

- `testbench-mars.asm`: Assembly code to test the added instructions. This code will only run in the MARS simulator, as it assumes that data starts at address `0x00001001` (.data) and instructions start at address `0x00400000` (.text).

## How to modify the Control ROM

<!--- 
TODO: when you figure out how to do this, add instructions here
--->
