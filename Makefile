SHELL := /bin/bash
.DEFAULT_GOAL:=all

	

all:
	docker-compose up --build --force-recreate


