NAME	= libasm.a

FILES	= ft_strlen.s \
		  ft_strcpy.s \
		  ft_strcmp.s \
		  ft_write.s \
		  ft_read.s \
		  ft_strdup.s

BFILES = 

SRCS	=  $(FILES)

BSRCS	= $(BFILES)

OBJS	= ${SRCS:.s=.o}

BOBJS	= ${BSRCS:.s=.o}

NASM	= nasm

NASMFLAGS = -f elf64

RM		= rm -f

%.o:%.s
		$(NASM) $(NASMFLAGS) $<


${NAME}:    ${OBJS}
			ar rc ${NAME} ${OBJS}
			ranlib ${NAME}

all:		${NAME}

bonus:	     ${BOBJS} ${NAME}
			ar rc ${NAME} ${OBJS} ${BOBJS}
			ranlib ${NAME}

clean:
			${RM} ${OBJS} ${BOBJS}

fclean:		clean
			${RM} ${NAME}

re:			fclean all

.PHONY:		all clean fclean re
