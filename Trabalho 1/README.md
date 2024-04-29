# Trabalho 1 - Implementação de Novas Instruções na Microarquitetura/Organização do Processador MIPS

Este trabalho tem como objetivo implementar novas instruções na microarquitetura do processador MIPS. O processador MIPS é uma arquitetura de conjunto de instruções reduzido (RISC) amplamente utilizada em sistemas embarcados e computadores pessoais.

## Implementações do Processador

Existem três implementações diferentes do processador MIPS: [monociclo](./Monociclo/README.md), [multiciclo](./Multiciclo/README.md) e com 5 estágios de [pipeline](./Pipeline/README.md). Suas implementações e particularidades podem ser encontradas clicando nos links.

## Instruções Implementadas

<!-- TODO: adicionar as descrições -->
### 1. SRA (Shift Right Arithmetic)

O deslocamento aritmético é uma operação que move todos os bits de um valor para a direita, preenchendo os bits mais significativos com o valor do bit de sinal original. Isso significa que, se o bit mais significativo (bit de sinal) for 1, ele será replicado para a direita durante o deslocamento. Se o bit de sinal for 0, zeros serão inseridos à direita.

A sintaxe da instrução SRA segue o formato `SRA $dest, $src, sa`, onde:

- `$dest` é o registrador de destino onde o resultado do deslocamento será armazenado.
- `$src` é o registrador de origem que contém o valor a ser deslocado.
- `sa` é o valor de deslocamento, especificado como um número inteiro.

Aqui está um exemplo de uso da instrução SRA: `SRA $1, $2, 3`

Neste exemplo, o valor contido no registrador `$2` será deslocado aritmeticamente para a direita em `3` posições, e o resultado será armazenado no registrador `$1`.

É importante observar que o deslocamento aritmético à direita é usado principalmente para realizar divisões por potências de 2. Por exemplo, um deslocamento aritmético à direita de 1 é equivalente a uma divisão por 2, um deslocamento de 2 é equivalente a uma divisão por 4 e assim por diante.

### 2. Descrição da instrução 2

### 3. Descrição da instrução 3

### 4. Descrição da instrução 4
