NAME	= libasm.a

SRCDIR	= srcs/

FILES = ft_strlen.s \
	ft_strcpy.s \
	ft_strcmp.s \
	ft_write.s \
	ft_read.s \
	ft_strdup.s

BFILES = ft_atoi_base.s \
	 ft_list_push_front.s \
	 ft_list_size.s \
	 ft_list_sort.s \
	 ft_list_remove_if.s

SRCS	= $(addprefix $(SRCDIR), $(FILES))

BSRCS	= $(addprefix $(SRCDIR), $(BFILES))

OBJS	= ${SRCS:.s=.o}

BOBJS	= ${BSRCS:.s=.o}

NASM	= nasm

NASMFLAGS = -f elf64

RM		= rm -f

%.o:%.s
		$(NASM) $(NASMFLAGS) $<

${NAME}:	${OBJS}
		ar rc ${NAME} ${OBJS}
		ranlib ${NAME}

all:	${NAME}

bonus:	${OBJS} ${BOBJS}
	ar rc ${NAME} ${OBJS} ${BOBJS}
	ranlib ${NAME}

clean:
	${RM} ${OBJS} ${BOBJS}

fclean:	clean
	${RM} ${NAME}

re:	fclean all

.PHONY:	all bonus clean fclean re
