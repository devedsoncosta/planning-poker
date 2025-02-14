# Requisitos Funcionais (RF)
## Criação e Gerenciamento de Sala

- RF1: Os usuários devem ser capazes de criar uma sala dedicada para sessões de planning poker.
- RF2: Cada sala deve suportar até 23 jogadores simultaneamente.
- RF3: O criador da sala tem privilégios administrativos, incluindo a capacidade de expulsar jogadores.
- RF4: Jogadores que entram em uma sala são considerados participantes ativos até o final da sessão.

## Gerenciamento de Issues

- RF5: Os usuários devem ser capazes de criar, atualizar e excluir issues dentro da sala.
- RF6: Os usuários devem ser capazes de votar em uma issue específica qualquer número de vezes conforme definido pelas configurações da sala.
- RF7: Após votar em uma issue, os usuários devem ser capazes de prosseguir para a próxima issue sem problemas.

## Votação e Pontos

- RF8: O sistema deve fornecer diferentes formatos de pontos de planejamento para votação.
- RF9: O sistema deve contar e registrar com precisão os votos para cada issue.

## Gerenciamento de Sessão

- RF10: Os usuários devem ser capazes de definir um temporizador para votação em cada issue.
- RF11: O sistema deve fornecer um modo somente leitura com um histórico da sessão para fins de revisão.

## Validação de Usuário

- RF12: O sistema deve mostrar um erro se um usuário tentar entrar em uma sala com um nome que já está em uso.

## Colaboração em Tempo Real

- RF13: O sistema deve suportar atualizações em tempo real e sincronização em todas as interfaces dos participantes.

# Requisitos Não Funcionais (RNF)
## Desempenho e Escalabilidade

- RNF1: O aplicativo deve suportar colaboração em tempo real sem lag para até 23 usuários simultâneos.

## Confiabilidade

- RNF2: O aplicativo deve garantir consistência de dados e sincronização de estado em todos os clientes durante interrupções de rede.

## Usabilidade

- RNF3: A interface do aplicativo deve ser amigável e exigir curva de aprendizado mínima para novos usuários.

## Acessibilidade

- RNF4: O aplicativo deve ser acessível em várias plataformas, incluindo desktops, tablets e smartphones.

## Segurança

- RNF5: O aplicativo deve fornecer mecanismos seguros de controle de acesso para criação e participação em salas.

# Regras de Negócio (RN)
## Processo de Votação

- RN1: Um usuário pode escolher apenas um cartão por sessão de votação.
- RN2: Os resultados da votação são exibidos apenas após todos os participantes ativos terem votado.
- RN3: Se o temporizador expirar antes de um usuário votar, seu voto será perdido para aquela rodada.

## Continuidade da Sessão

- RN4: Uma sessão é considerada ativa até que o criador a encerre formalmente, independentemente dos níveis de atividade dos participantes.

## Resolução de Issues

- RN5: Uma issue só é movida para o status "concluído" após todos os votos serem lançados e os resultados serem exibidos.

## Integridade Histórica

- RN6: Uma vez que uma sessão é tornada somente leitura, seu histórico não pode ser alterado.
