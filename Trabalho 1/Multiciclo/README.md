# Multiciclo

Na implementação multiciclo, cada instrução é dividida em várias etapas, e cada etapa é executada em um ciclo de clock separado. Isso permite que diferentes instruções sejam executadas em diferentes quantidades de ciclos, dependendo da complexidade da instrução. Essa abordagem melhora o desempenho em relação à implementação monociclo, pois permite uma melhor utilização dos recursos do processador. No entanto, a implementação multiciclo é mais complexa de projetar e implementar.

Diferentemente da implementação do monociclo e do pipeline, o multiciclo mantém fisicamente juntas as memórias de instruções e de dados. Isso significa que, para testar o processador, é necessário gerar um único arquivo para as instruções e dados.

## Estrutura da Implementação

Os seguintes arquivos e pastas estão presentes na implementação monociclo:

- `MEM_Instruction_Data`: Memória conjunta para as instruções e dados do processador.

- `MPIS_Multiciclo.circ`: Implementação do datapath do processador em si, para serem abertos no software Logisim.

- `testbench-logisim.asm`: Assembly para testar as instruções adicionadas. Este código irá executar somente no simulador Logisim, pois segue as convenções que fizemos, em que as instruções começam no endereço `0x00000000` e os dados começam no endereço `0x000000a0`.

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
