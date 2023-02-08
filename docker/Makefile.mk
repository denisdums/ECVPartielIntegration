DC=docker-compose

include $(SELF_DIR)/.env

up: ## Start Docker
	$(DC) up -d --remove-orphans
	@echo "$(APP_TD) is running";
	@echo "-------------------+-----------------------------------------------------------";
	@echo " Application URL  | http://$(APP_TD).docker";
	@echo "-------------------------------------------------------------------------------";

build:
	$(DC) up -d --build --remove-orphans --force-recreate
	@echo "$(APP_TD) is running";
	@echo "-------------------+-----------------------------------------------------------";
	@echo " Application URL  | http://$(APP_TD).docker";
	@echo "-------------------------------------------------------------------------------";


do: ## Stop Docker
	$(DC) down
	@echo "$(APP_TD) application is stopped"

ex: ## Connect to php
	$(DC) exec --user=www-data php /bin/bash