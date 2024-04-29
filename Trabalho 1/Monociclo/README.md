# Monociclo

Na implementação monociclo, cada instrução é executada em um único ciclo de clock. Isso significa que todas as etapas do ciclo de instrução (busca, decodificação, execução, acesso à memória e escrita no registrador) são realizadas em um único ciclo. Embora seja simples de entender e implementar, essa abordagem pode ser ineficiente em termos de desempenho, pois algumas instruções podem levar mais tempo para serem executadas do que outras.

É necessário destacar que a forma como este processador foi implementado no software Logisim separa fisicamente as memórias de instruções e de dados. Isso significa que, para testar o processador, é necessário gerar um arquivo de memória de instruções e um arquivo de memória de dados separadamente.

## Estrutura da Implementação

Os seguintes arquivos e pastas estão presentes na implementação monociclo:

- `MEM_Data`: Memória de dados do processador.

- `MEM_Instruction`: Memória de instruções do processador.

- `MPIS_Monociclo.circ`: Implementação do datapath do processador em si, para serem abertos no software Logisim.

- `testbench-logisim.asm`: Assembly para testar as instruções adicionadas. Este código irá executar somente no simulador Logisim, pois pressupõe que os dados e as instruções estão em memórias diferentes, com ambos começando no endereço `0x00000000`.

- `testbench-mars.asm`: Assembly para testar as instruções adicionadas. Este código irá executar somente no simulador MARS, pois pressupõe que os dados começam no endereço `0x00001001` (.data) e que as instruções começam no endereço `0x00400000` (.text).

## Como modificar a ROM de controle

O controle do processador é feito através de uma memória ROM, que implementa uma tabela-verdade com as saídas de controle para cada instrução. A entrada da ROM é o opcode da instrução atual, por meio do qual se obtém a posição da memória que contém as saídas de controle para a prórpria.

Para modificá-la, basta inserir na ROM, no endereço correspondente ao opcode da instrução, o valor hexadecimal que corresponde ao vetor de bits da saída de controle para a instrução desejada.

## Como Executar

Para executar o projeto, siga as etapas abaixo:

1. Abra o software Logisim.

2. Carregue o arquivo `.circ` correspondente à implementação do processador.

3. Carregue todos os arquivos de memória contidos na pasta do respectivo processador.

4. Manualmente gere os sinais de relógio para simular a execução do processador e veja os resultados.
