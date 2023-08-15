.PHONY: install
install:
	./scripts/install.sh

.PHONY: alertmanager-config
alertmanager-config:
	./scripts/alertmanager/create_config.sh

.PHONY: down
down:
	docker-compose down --remove-orphans

.PHONY: up
up:
	docker-compose up --build

.PHONY: up-exporters
up-exporters:
	docker-compose -f docker-compose.exporters.yml up --build

.PHONY: up-alertmanager
up-alertmanager:
	docker-compose --profile=alertmanager up --build