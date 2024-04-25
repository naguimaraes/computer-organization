# Trabalho 1 - Implementação de Novas Instruções na Microarquitetura/Organização do Processador MIPS

Este trabalho tem como objetivo implementar novas instruções na microarquitetura do processador MIPS. O processador MIPS é uma arquitetura de conjunto de instruções reduzido (RISC) amplamente utilizada em sistemas embarcados e computadores pessoais.

<!-- TODO: adicionar imagens -->
## Implementações do Processador

Existem três implementações diferentes do processador MIPS: monociclo, multiciclo e com 5 estágios de pipeline. Cada uma dessas implementações possui características distintas em termos de desempenho e complexidade.

### Monociclo

Na implementação monociclo, cada instrução é executada em um único ciclo de clock. Isso significa que todas as etapas do ciclo de instrução (busca, decodificação, execução, acesso à memória e escrita no registrador) são realizadas em um único ciclo. Embora seja simples de entender e implementar, essa abordagem pode ser ineficiente em termos de desempenho, pois algumas instruções podem levar mais tempo para serem executadas do que outras.

### Multiciclo

Na implementação multiciclo, cada instrução é dividida em várias etapas, e cada etapa é executada em um ciclo de clock separado. Isso permite que diferentes instruções sejam executadas em diferentes quantidades de ciclos, dependendo da complexidade da instrução. Essa abordagem melhora o desempenho em relação à implementação monociclo, pois permite uma melhor utilização dos recursos do processador. No entanto, a implementação multiciclo é mais complexa de projetar e implementar.

### Pipeline (de 5 estágios)

Na implementação com 5 estágios de pipeline, o ciclo de instrução é dividido em cinco estágios: busca de instrução, decodificação, execução, acesso à memória e escrita no registrador. Cada estágio é executado em um ciclo de clock separado, e várias instruções podem ser executadas simultaneamente em diferentes estágios do pipeline. Isso permite uma execução mais eficiente das instruções e um melhor desempenho em comparação com as implementações monociclo e multiciclo. No entanto, a implementação com pipeline também introduz desafios adicionais, como dependências de dados e hazards de pipeline.

## Estrutura do Projeto

O projeto está organizado da seguinte forma:

- `MEM_Data`: Este arquivo representa a memória de dados do processador.

- `MEM_Instruction`: Este arquivo representa a memória de instruções do processador.

- `Control_ROM`: Este arquivo representa a ROM de controle do processador.
(Somente para a versão Pipeline)  

- Arquivos com a extensão `.circ`: Estes arquivos representam o processador em si e podem ser abertos no software Logisim. Eles contêm a implementação da microarquitetura do processador MIPS, incluindo as novas instruções implementadas neste trabalho.

## Instruções Implementadas

Neste trabalho, foram implementadas as seguintes novas instruções:

<!-- TODO: adicionar as descrições -->
1. Instrução 1: Descrição da instrução 1.

2. Instrução 2: Descrição da instrução 2.

3. Instrução 3: Descrição da instrução 3.

## Como Executar o Projeto

Para executar o projeto, siga as etapas abaixo:

1. Abra o software Logisim.

2. Carregue o arquivo `.circ` correspondente à implementação do processador.

3. Carregue todos os arquivos de memória contidos na pasta do respectivo processador.

4. Execute o programa e observe o comportamento do processador com as novas instruções implementadas.
