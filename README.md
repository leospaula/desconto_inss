# Desconto INSS

Este é um projeto Rails 7 que utiliza Devise para autenticação, Sidekiq para processamento em background e Bootstrap para estilização. O projeto inclui funcionalidades de autenticação de usuários, CRUD de proponentes e cálculo de desconto do INSS.

## Funcionalidades

- Autenticação de usuário com Devise (login, logout, registro, recuperação de senha)
- CRUD de proponentes
- Processamento em background com Sidekiq
- Estilização com Bootstrap

## Requisitos

- Ruby 3.x
- Rails 7.x
- PostgreSQL
- Redis (para Sidekiq)
- Docker e Docker Compose (opcional)

## Instruções para Clonar e Rodar o Projeto Localmente

#### 1. Clonando o Repositório

```bash
git clone https://github.com/leospaula/desconto_inss.git
cd desconto_inss
```

### 2. Configuração Local (Sem Docker)

##### 1. Instale as dependências:

```bash
bundle install
```

##### 2. Configure o banco de dados:
Edite `config/database.yml` conforme necessário e então execute:

```bash
rails db:create db:migrate db:seed
```

##### 3. Inicie o Sidekiq para processamento em background:

```bash
bundle exec sidekiq
```

##### 4. Inicie o servidor:

```bash
rails server
```

##### 5. Acesse a aplicação em:

```bash
http://localhost:3000
```

### 2. Rodando com Docker e Docker Compose

##### 1. Certifique-se de que o Docker e o Docker Compose estão instalados.

##### 2. Construa e inicie os contêineres:

```bash
docker-compose up --build
```

##### 3. Execute as migrações e o seed:

```bash
docker-compose run web bin/rails db:create db:migrate db:seed
```

##### 4. Inicie os containeres em segundo plano:

```bash
docker-compose up -d
```

##### 5. Acesse a aplicação em:

```bash
http://localhost:3000
```