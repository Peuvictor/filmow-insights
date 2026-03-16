🎬 Filmow Insights
O Filmow Insights é uma ferramenta de automação e gerenciamento de dados cinematográficos. Ele permite importar dados detalhados de filmes diretamente do Filmow via URL, organizando-os em um dashboard moderno, responsivo e resiliente.

🚀 Motivação e Objetivos
Este projeto foi desenvolvido para aplicar conceitos avançados de Ruby on Rails em um cenário real, enfrentando desafios de infraestrutura, web scraping e experiência do usuário (UX).

🛠️ Stack Tecnológica
Linguagem: Ruby 3.3.0 (Versão estável mais recente)

Framework: Ruby on Rails 7.1 (Hotwire/Turbo)

Banco de Dados: PostgreSQL

Web Scraping: Nokogiri & Open-URI

Estilização: Tailwind CSS (Dark Mode nativo)

Deploy: Render

📋 Funcionalidades
[x] Importação Inteligente: Scraper que extrai Título, Diretor, Ano e Nota.

[x] CRUD Completo: Criar, listar, editar e excluir filmes.

[x] Resiliência em Produção (Fallback): Sistema que detecta bloqueios de IP (Erro 403) e permite a entrada manual de dados.

[x] UX Dinâmica: Uso de Hotwire/Turbo para feedbacks instantâneos sem recarregar a página.

[x] Tratamento de Encoding: Suporte total a caracteres especiais e acentuação (UTF-8).

[x] Prevenção de Duplicidade: Evita registros repetidos utilizando a URL como chave única.

🧠 Desafios Técnicos e Soluções
1. Resiliência a Bloqueios (Evasão de 403 Forbidden)
Durante o deploy em produção no Render, identifiquei que o servidor de origem bloqueia requisições vindas de datacenters.

Solução: Implementei cabeçalhos de requisição (User-Agent, Referer) para simular um navegador real e, como contingência, desenvolvi um fluxo de fallback. Caso o scraping falhe, o sistema salva o link e direciona o usuário para a edição manual, garantindo que a aplicação nunca fique inoperante.

2. Sincronização de Ambientes
Atualização de todo o ambiente de desenvolvimento local (WSL) para o Ruby 3.3.0 via rbenv para garantir paridade total com o ambiente de produção do Render, eliminando o erro de "funciona na minha máquina".

3. Service Objects (SRP)
A lógica de extração de dados foi encapsulada no FilmowScraperService, mantendo os Controllers enxutos e seguindo o princípio de responsabilidade única.

🔧 Como Executar Localmente
Clone o repositório:

Bash
git clone https://github.com/Peuvictor/filmow-insights.git
cd filmow-insights
Instale as dependências:

Bash
bundle install
Configure o banco de dados:

Bash
rails db:create db:migrate
Inicie o servidor de desenvolvimento:

Bash
bin/dev
Desenvolvido com ☕ e Ruby por Pedro Victor Guimarães
