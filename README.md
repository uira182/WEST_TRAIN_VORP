# Script de Viagem Rápida de Trem com Cobrança

Este é um script para RedM que permite aos jogadores se teletransportarem entre as cidades de Valentine e Rhodes utilizando um trem. O teletransporte é acompanhado por uma animação de vídeo e há uma cobrança de taxa para a viagem.

https://streamable.com/aqgep3

## Funcionalidades

- **Teletransporte entre Cidades:** Os jogadores podem viajar rapidamente entre as cidades de Valentine e Rhodes utilizando um menu interativo.
- **Cobrança de Taxa:** O teletransporte tem um custo de $1.50 por viagem, que é deduzido do dinheiro do jogador.
- **Animação de Vídeo:** Durante o teletransporte, um vídeo curto de 10 segundos é exibido para simular a viagem de trem.
- **Interface de Usuário:** Interface de usuário em HTML, CSS e JavaScript, com botões de seleção de destino e animação de vídeo em tela cheia.

## Instalação

1. **Clone ou Baixe o Repositório:**
   - Clone este repositório ou baixe os arquivos manualmente.

2. **Adicionar ao Servidor:**
   - Coloque a pasta do script na pasta `resources` do seu servidor RedM.

3. **Atualize o `server.cfg`:**
   - Adicione `ensure nome_da_pasta` ao seu arquivo `server.cfg`.

4. **Recursos Necessários:**
   - Certifique-se de que o VORP Core está instalado e configurado corretamente no servidor.

## Arquivos Incluídos

- **`fxmanifest.lua`:** Configuração do manifest do recurso.
- **`cl_train.lua`:** Script do lado do cliente que gerencia o teletransporte e a interação do jogador.
- **`sv_train.lua`:** Script do lado do servidor que lida com a cobrança da taxa e a execução do teletransporte.
- **`html/index.html`:** Interface de usuário com o menu de seleção e vídeo de viagem.
- **`html/style.css`:** Estilos da interface de usuário.
- **`html/script.js`:** Lógica da interface de usuário, incluindo controle do vídeo e interações do jogador.
- **Recursos de Mídia:** Imagens e vídeos usados na interface.

## Como Usar

1. **Posicione-se em uma das localizações designadas (Valentine ou Rhodes).**
2. **Pressione a tecla `E` para abrir o menu de teletransporte.**
3. **Selecione o destino desejado.**
4. **O vídeo de viagem será reproduzido e o teletransporte será realizado após 10 segundos.**

## Contribuição

Contribuições são bem-vindas! Se você quiser adicionar funcionalidades ou melhorar o código, sinta-se à vontade para enviar um pull request.

## Licença

Este projeto está sob a licença MIT. Para mais detalhes, consulte o arquivo `LICENSE`.

## Autor

Criado por **uira182**.
