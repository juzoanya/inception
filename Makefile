# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: juzoanya <juzoanya@student.42wolfsburg,    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/07/25 06:08:37 by juzoanya          #+#    #+#              #
#    Updated: 2023/08/20 11:31:31 by juzoanya         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

COMPOSE_FILE = "./srcs/docker-compose.yml"

all: build

build:
	@sudo mkdir ~/data ~/data/wordpress ~/data/mariadb
	@docker compose -f $(COMPOSE_FILE) up -d --build

run:
	@docker compose -f $(COMPOSE_FILE) up -d

stop:
	@docker compose -f $(COMPOSE_FILE) down

clean: stop
	@docker rmi -f $$(docker images -qa);
	@docker volume rm $$(docker volume ls -q);
	@sudo rm -rf ~/data/mariadb ~/data/wordpress ~/data

re: clean all

.PHONY: build run stop clean