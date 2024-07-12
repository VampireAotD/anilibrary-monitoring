.PHONY: help
help:
	@printf "\nUsage: make <command>\n"
	@grep -E '^[a-z.A-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: install
install: ## Create .env file from .env.example, build images and launch Monitoring
	./scripts/install.sh

.PHONY: up
up: ## Launch Monitoring without Alertmanager
	docker compose up -d --build

.PHONY: down
down: ## Stop all containers
	docker compose --profile alerts down --remove-orphans

.PHONY: alerts
alerts: ## Launch Monitoring with Alertmanager and exporters
	docker compose --profile alerts up -d --build