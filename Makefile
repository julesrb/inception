# -----------\ Name \--------------------------------------------------------- #

NAME	:= inception

# -----------\ Directories \-------------------------------------------------- #

LIBFT_DIR	:= ./lib/libft/
LIBMLX		:= ./lib/MLX42
INC_DIREC := includes/
SRC_DIREC := sources/
OBJ_DIREC := build/

# -----------\ Rules \-------------------------------------------------------- #

.DEFAULT_GOAL := all
.DELETE_ON_ERROR:

all: $(NAME)

$(NAME):	
	mkdir /home/jelly/data/mariadb
	chmod 777 /home/jelly/data/mariadb
	mkdir /home/jelly/data/wordpress
	chmod 777 /home/jelly/data/wordpress
	cd src
	docker compose up --build
	@echo "Inception is runing."

clean:
	@echo "fclean"
	bash ./src/requirements/tools/reset-docker.sh

fclean: clean
	rm -rf /home/jelly/data/mariadb
	rm -rf /home/jelly/data/wordpress

re: clean all

.PHONY: all, clean, fclean, re

