# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: avongdar <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2016/12/04 00:52:21 by avongdar          #+#    #+#              #
#    Updated: 2016/12/04 00:52:22 by avongdar         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

LIB			=	libft/libft.a
NAME		=	libftprintf.a

CC			=	gcc
CFLAGS		=	-Wall -Wextra -Werror #-fsanitize=address

IFLAGS		=	-I includes
FILES		=	ft_printf.c\
				ft_set_env.c\
				ft_atoi.c\
				ft_string.c\
				ft_number.c\
				ft_print_strings.c\
				ft_print_char.c\
				ft_function_list.c\
				ft_print_num_u.c\
				ft_print_num_s.c\
				ft_specifier.c

SRCS		= $(addprefix srcs/, $(FILES))
OBJS 		= $(addprefix build/, $(FILES:.c=.o))

.PHONY: all clean fclean re

all: $(NAME)

build:
	@mkdir build/

$(NAME): $(OBJS)
	@ar rcs $@ $^
	@# gcc main.c $(CFLAGS) -o printf libftprintf.a -I includes
	@# @$(CC) $(CFLAGS) -o $(NAME) $(OBJS) $(LFLAGS) $(MLFLAGS)

build/%.o: srcs/%.c | build
	@$(CC) $(IFLAGS) $(CFLAGS) -c $< -o $@

clean:
	@rm -f build/*.o
	@rm -rf build

fclean: clean
	@rm -f $(NAME)

re: fclean all
