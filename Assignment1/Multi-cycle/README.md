# Multi-cycle

In the multi-cycle implementation, each instruction is divided into several stages, and each stage is executed in a separate clock cycle. This allows different instructions to be executed in different numbers of cycles, depending on the instruction's complexity. This approach improves performance compared to the single-cycle implementation, as it allows better utilization of processor resources. However, the multi-cycle implementation is more complex to design and implement.

Unlike the single-cycle and pipeline implementations, the multi-cycle keeps the instruction and data memories physically together. This means that to test the processor, it is necessary to generate a single file for both instructions and data.

## Running the Processor

To execute the project, follow the steps below:

1. Open the [Logisim software](../Simulators/logisim-win-2.7.1.exe).

2. Load the `.circ` file corresponding to the processor implementation.

3. Load all memory files contained in this folder.

4. Manually generate clock signals to simulate processor execution and view the results.

## Implementation Structure

The following files and folders are present in the multi-cycle implementation:

- `MEM_Instruction_Data`: Combined memory for the processor's instructions and data.

- `MIPS_Multiciclo.circ`: Implementation of the processor's datapath itself, to be opened in the Logisim software.

- `testbench-logisim.asm`: Assembly code to test the added instructions. This code will only run in the Logisim simulator, as it follows the conventions we made, where instructions start at address `0x00000000` and data starts at address `0x000000a0`.

- `testbench-mars.asm`: Assembly code to test the added instructions. This code will only run in the MARS simulator, as it assumes that data starts at address `0x00001001` (.data) and instructions start at address `0x00400000` (.text).
