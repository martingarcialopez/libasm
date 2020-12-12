/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   libasm.h                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mgarcia- <mgarcia-@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/12/12 12:16:10 by mgarcia-          #+#    #+#             */
/*   Updated: 2020/12/12 21:38:13 by mgarcia-         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef LIBASM_H
# define LIBASM_H

size_t			ft_strlen(char *str);
char			*ft_strcpy(char *dest, const char *src);
int			ft_strcmp(const char *str1, const char *str2);
int			ft_write(int fd, char *buf, int nbytes);
int			ft_read(int fd, char *buf, int nbytes);
char			*ft_strdup(const char *s);

typedef struct		s_list
{
	void		*data;
	struct s_list	*next;
}			t_list;

int			ft_atoi_base(char *str, char *base);
int			ft_list_size(t_list *begin_list);
void			ft_list_push_front(t_list **begin_list, void *data);
void			ft_list_sort(t_list **begin_list, int (*cmp)());
void			ft_list_remove_if(t_list **begin_list, void *data_ref,
					int (*cmp)(), void (*free_fct)(void *));

#endif
