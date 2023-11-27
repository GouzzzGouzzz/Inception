# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: nmorandi <nmorandi@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/12 10:28:02 by nmorandi          #+#    #+#              #
#    Updated: 2023/07/11 13:42:28 by nmorandi         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

run: build
	docker compose -f srcs/docker-compose.yml up -d 

build:
	docker compose -f srcs/docker-compose.yml build

down:
	docker compose -f srcs/docker-compose.yml down

clean:
	docker compose -f srcs/docker-compose.yml down
	docker image prune -af
	docker volume prune -f
	docker network prune -f

re: clean run

.PHONY: all build stop clean re
