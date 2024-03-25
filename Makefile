#!make

SUBCOMMAND = $(subst +,-, $(filter-out $@,$(MAKECMDGOALS)))
CURRENT_DIR = $(shell pwd)

include ${CURRENT_DIR}/.env

project-stop:
	docker-compose -f docker/${ENV}/docker-compose.yml --env-file ${CURRENT_DIR}/.env stop
	docker-compose -f docker/${ENV}/docker-compose.yml --env-file ${CURRENT_DIR}/.env rm --force

project-start: project-stop
	docker-compose -f docker/${ENV}/docker-compose.yml --env-file ${CURRENT_DIR}/.env up --build -d
