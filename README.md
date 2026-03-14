# 🎬 Filmow Insights

O **Filmow Insights** é uma ferramenta de automação e análise de dados cinematográficos. Ele permite importar dados detalhados de filmes da rede social Filmow via URL, organizando-os em um dashboard moderno e funcional.

![Preview do Projeto](public/filmow_insights_preview.png)

## 🚀 Motivação e Objetivos
Desenvolvido como um projeto de portfólio "Real World", focado em resolver desafios de extração de dados e experiência do usuário (UX).
* **Engenharia de Dados:** Captura de HTML não estruturado e conversão em registros relacionais.
* **Modern Rails (Hotwire/Turbo):** Interface dinâmica com feedback instantâneo sem necessidade de SPAs complexas.
* **Clean Code:** Lógica de scraping encapsulada em *Service Objects* (SRP).

## 🛠️ Tecnologias
* **Framework:** Ruby on Rails 7 (Hotwire/Turbo)
* **Banco de Dados:** PostgreSQL
* **Web Scraping:** Nokogiri & Open-URI
* **Estilização:** Tailwind CSS (Dark Mode)

## 📋 Funcionalidades Concluídas
- [x] **Importação via URL:** Scraper que extrai Título, Diretor, Ano e Nota.
- [x] **CRUD Completo:** Listagem e exclusão de filmes com persistência no Postgres.
- [x] **Tratamento de Encoding:** Suporte total a caracteres especiais (UTF-8).
- [x] **UX & Feedback:** Botão dinâmico ("Buscando...") e confirmações de exclusão.
- [x] **Sistema de Notificações:** Flash messages animadas para sucesso/erro.
- [x] **Prevenção de Duplicidade:** O sistema evita importar o mesmo filme múltiplas vezes.

## 🧠 Desafios Técnicos Superados

### 1. Robustez no Web Scraping
Implementação de tratamento de encoding UTF-8 no `Nokogiri` para garantir a integridade de títulos brasileiros e uso de seletores CSS resilientes a mudanças no site de origem.

### 2. Feedback Assíncrono com Turbo
Uso de atributos `data-turbo` para desabilitar botões e fornecer feedback visual imediato ao usuário durante processos de I/O bloqueantes (scraping), melhorando a percepção de performance.

## 🔧 Como Executar

1. **Clone o projeto:**
   ```bash
   git clone [https://github.com/Peuvictor/filmow-insights.git](https://github.com/Peuvictor/filmow-insights.git)
   cd filmow-insights
   bundle install
   rails db:create
   rails db:migrate
   rails s


## Desenvolvido por Pedro Victor Guimarães
