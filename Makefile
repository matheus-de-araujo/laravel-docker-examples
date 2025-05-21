.PHONY: help up down build art artisan a test

# Caminho do compose customizado
COMPOSE=docker compose -f compose.prod.yaml

help:
	@echo "Comandos disponíveis:"
	@echo "  up      - Inicia o ambiente Docker"
	@echo "  down    - Para o ambiente Docker"
	@echo "  build   - Reconstrói os containers Docker"
	@echo "  artisan - Executa comandos Artisan no container"
	@echo "  test    - Executa os testes do Laravel"

up:
	$(COMPOSE) up -d
	@echo "Ambiente Laravel iniciado com Docker!"

down:
	$(COMPOSE) down
	@echo "Ambiente Laravel parado."

build:
	$(COMPOSE) build
	@echo "Containers Docker reconstruídos."

logs:
	$(COMPOSE) logs -f
	@echo "Exibindo logs do ambiente Docker."

artisan:
	$(COMPOSE) exec -it workspace php artisan $(filter-out $@,$(MAKECMDGOALS))

art:
	$(COMPOSE) exec -it workspace php artisan $(filter-out $@,$(MAKECMDGOALS))

a: 
	@$(COMPOSE) exec -it workspace php artisan $(filter-out $@,$(MAKECMDGOALS))

bash:
	$(COMPOSE) exec -it workspace bash

test:
	$(COMPOSE) exec -T app php artisan test
	@echo "Executando testes do Laravel."
