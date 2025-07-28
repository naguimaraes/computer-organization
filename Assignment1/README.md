# Assignment 1 - Implementation of New Instructions in MIPS Processor Microarchitecture/Organization

This assignment aims to implement new instructions in the MIPS processor microarchitecture. Its specification can be found in [Specification.pdf](./Trabalho1/Especificacao.pdf), in Portuguese. The MIPS processor is a reduced instruction set computer (RISC) architecture widely used in embedded systems and personal computers. The final report, which details how the instructions were implemented and was written in Portuguese as well, can be found in [Report1.pdf](./Trabalho1/Relatorio.pdf).

Our implementations were given a grade of 10/10 from the professor.

## Processor Implementations

There are three different implementations of the MIPS processor: [single-cycle](./Single-cycle), [multi-cycle](./Multi-cycle), and 5-stage [pipeline](./Pipeline). Their implementations and particularities can be found by clicking on the links.

## [Simulators](./Simulators)

The implementations were made in the [Logisim](https://sourceforge.net/projects/circuit/) simulator ([local executable](../Simulators/logisim-win-2.7.1.exe)), which is a free software for designing and simulating digital circuits. The Logisim software allows users to create complex circuits using a graphical interface, making it easier to visualize and understand the processor's architecture. We were given a base MIPS processor implementation in Logisim with some basic components, which we then modified to add the new instructions.

The other used simulator is [MARS](https://courses.missouristate.edu/KenVollmar/mars/) ([local executable](../Simulators/Mars4_5.jar)), which is a MIPS simulator that allows users to write and execute MIPS assembly code. It provides a user-friendly interface for writing, debugging, and executing MIPS programs, making it an ideal tool for testing the new instructions implemented in the Logisim processor to see how they were supposed to behave.

## Implemented Instructions

### 1. SRA (Shift Right Arithmetic)

Arithmetic shift is an operation that moves all bits of a value to the right, filling the most significant bits with the value of the original sign bit. This means that if the most significant bit (sign bit) is 1, it will be replicated to the right during the shift. If the sign bit is 0, zeros will be inserted to the right.

The syntax of the SRA instruction follows the format `SRA $dest, $src, sa`, where:

- `$dest` is the destination register where the shift result will be stored.
- `$src` is the source register that contains the value to be shifted.
- `sa` is the shift amount, specified as an integer.

Here is an example of using the SRA instruction: `SRA $1, $2, 3`

In this example, the value contained in register `$2` will be arithmetically shifted to the right by `3` positions, and the result will be stored in register `$1`.

It is important to note that arithmetic right shift is primarily used to perform divisions by powers of 2. For example, an arithmetic right shift of 1 is equivalent to a division by 2, a shift of 2 is equivalent to a division by 4, and so on.

### 2. JAL (Jump and Link)

The JAL instruction performs an unconditional jump to a specified address while simultaneously storing the return address in register `$31` (also known as `$ra`). This instruction is commonly used for procedure calls, allowing the program to return to the instruction following the JAL.

The syntax of the JAL instruction follows the format `JAL target`, where:

- `target` is the jump target address or label.

Here is an example of using the JAL instruction: `JAL procedure`

In this example, the program will jump to the address labeled `procedure`, and the address of the instruction following the JAL will be stored in register `$31`.

### 3. BGEZAL (Branch on Greater Than or Equal to Zero and Link)

The BGEZAL instruction performs a conditional branch based on whether a register's value is greater than or equal to zero. If the condition is true, it branches to the target address and stores the return address in register `$31`. This instruction combines conditional branching with linking functionality.

The syntax of the BGEZAL instruction follows the format `BGEZAL $src, target`, where:

- `$src` is the source register whose value is tested.
- `target` is the branch target address or label.

Here is an example of using the BGEZAL instruction: `BGEZAL $1, subroutine`

In this example, if the value in register `$1` is greater than or equal to zero, the program will branch to `subroutine` and store the return address in register `$31`.

### 4. LUI (Load Upper Immediate)

The LUI instruction loads a 16-bit immediate value into the upper 16 bits of a destination register, while the lower 16 bits are filled with zeros. This instruction is typically used to load constants or addresses into registers.

The syntax of the LUI instruction follows the format `LUI $dest, immediate`, where:

- `$dest` is the destination register.
- `immediate` is the 16-bit immediate value to be loaded.

Here is an example of using the LUI instruction: `LUI $1, 0x1234`

In this example, the value `0x12340000` will be lo
aded into register `$1`.
