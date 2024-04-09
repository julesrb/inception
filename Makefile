# -----------\ Name \--------------------------------------------------------- #

NAME	:= inception

# -----------\ Directories \-------------------------------------------------- #

LIBFT_DIR	:= ./lib/libft/
LIBMLX		:= ./lib/MLX42
INC_DIREC := includes/
SRC_DIREC := sources/
OBJ_DIREC := build/

# -----------\ Rules \-------------------------------------------------------- #

all: $(NAME)

$(NAME):	
	mkdir /home/${USER}/data/mariadb
	mkdir /home/${USER}/data/wordpress
	cd src
	docker compose -f ./src/docker-compose.yml up --build
	@echo "Inception is runing."

clean:
	@echo "fclean"
	-docker ps -qa | xargs docker stop
	-docker ps -qa | xargs docker rm
	-docker image ls -qa | xargs docker rmi -f
	-docker volume ls -q | xargs docker volume rm
	-docker network ls -q | xargs
	-docker network ls -q | xargs docker network rm 2>/dev/null

fclean: clean
	sudo chmod 777 /home/${USER}/data/mariadb
	sudo chmod 777 /home/${USER}/data/wordpress
	sudo rm -rf /home/${USER}/data/mariadb
	sudo rm -rf /home/${USER}/data/wordpress
	docker system prune

re: fclean all

.PHONY: all, clean, fclean, re

