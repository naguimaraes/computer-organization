# Pipeline (de 5 estágios)

Na implementação com 5 estágios de pipeline, o ciclo de instrução é dividido em cinco estágios: busca de instrução, decodificação, execução, acesso à memória e escrita no registrador. Cada estágio é executado em um ciclo de clock separado, e várias instruções podem ser executadas simultaneamente em diferentes estágios do pipeline. Isso permite uma execução mais eficiente das instruções e um melhor desempenho em comparação com as implementações monociclo e multiciclo. No entanto, a implementação com pipeline também introduz desafios adicionais, como dependências de dados e hazards de pipeline.

Assim como o monociclo, este processador foi implementado no software Logisim de forma a separar fisicamente as memórias de instruções e de dados. Isso significa que, para testar o processador, é necessário gerar um arquivo de memória de instruções e um arquivo de memória de dados separadamente.

## Estrutura da Implementação

Os seguintes arquivos e pastas estão presentes na implementação monociclo:

- `MEM_Data`: Memória de dados do processador.

- `MEM_Instruction`: Memória de instruções do processador.

- `Control_ROM`: <!--- TODO: quando descobrirem oq é esse arquivo, escrevam aqui--->

- `MPIS_Pipeline.circ`: Implementação do datapath do processador em si, para serem abertos no software Logisim.

- `testbench-logisim.asm`: Assembly para testar as instruções adicionadas. Este código irá executar somente no simulador Logisim, pois pressupõe que os dados e as instruções estão em memórias diferentes, com ambos começando no endereço `0x00000000`. Outro detalhe é que, para evitar a dependência de dados, o código foi escrito de forma a intercalar todas as operações com múltiplas instruções de NOP.

- `testbench-mars.asm`: Assembly para testar as instruções adicionadas. Este código irá executar somente no simulador MARS, pois pressupõe que os dados começam no endereço `0x00001001` (.data) e que as instruções começam no endereço `0x00400000` (.text).

## Como modificar a ROM de controle

<!--- 
TODO: quando descobrirem como fazer isso, adicionar instruções aqui
--->

## Como Executar

Para executar o projeto, siga as etapas abaixo:

1. Abra o software Logisim.

2. Carregue o arquivo `.circ` correspondente à implementação do processador.

3. Carregue todos os arquivos de memória contidos na pasta do respectivo processador.

4. Manualmente gere os sinais de relógio para simular a execução do processador e veja os resultados.
