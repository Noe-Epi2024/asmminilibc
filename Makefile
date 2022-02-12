##
## EPITECH PROJECT, 2020
## B-ASM-400-PAR-4-1-bsasmminilibc-noe.jais
## File description:
## Makefile
##

SRCS	=	src/strlen.asm		\
			src/strchr.asm		\
			src/memset.asm		\
			src/memcpy.asm		\
			src/strcmp.asm		\
			src/strncmp.asm		\

OBJS	=	$(SRCS:.asm=.o)

NAME	=	libasm.so

all:	$(NAME)

# compile with linker all .o to generate the lib
$(NAME):	$(OBJS)
		ld -o $(NAME) -shared $(OBJS)

# Macro with nasm to assemble all target .asm into .o
%.o : %.asm
		nasm -f elf64 -o $@ $<

clean:
	rm -f $(OBJS)

fclean: clean
	rm -f $(NAME)

re:	fclean all