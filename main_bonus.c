#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "libasm.h"

int		compare_two_numbers(long a, long b)
{
	return (a - b);
}

void		print_list(t_list *lst)
{
	printf("o-- ");
	while (lst)
	{
		printf("%ld --> ", (long)(lst->data));
		lst = lst->next;
	}
	printf("NULL\n");
}

void		print_str_list(t_list *lst)
{
	printf("o-- ");
	while (lst)
	{
		printf("\"%s\" --> ", (char*)(lst->data));
		lst = lst->next;
	}
	printf("NULL\n");
}

void		free_list(t_list **begin_list)
{
	t_list *lst;
	t_list *tmp;

	lst = *begin_list;
	while (lst)
	{
		tmp = lst;
		lst = lst->next;
		free(tmp);
	}
}

void		free_str_list(t_list **begin_list)
{
	t_list *lst;
	t_list *tmp;

	lst = *begin_list;
	while (lst)
	{
		tmp = lst;
		lst = lst->next;
		free(tmp->data);
		free(tmp);
	}
}

void		free_str(void *data)
{
	printf("freeing string \"%s\"...\n", (char*)data);
	free(data);
}

void		false_free(void *data)
{
	printf("freeing %ld data...\n", (long)data);
}

int main()
{
	t_list	*var;

	var = NULL;

	printf("====    FT_ATOI_BASE    ====\n\n");
	printf("ft_atoi_base(\"\\t\\r\\n\\v\\f +10\", \"0123456789\") = %d\n", ft_atoi_base("\t\r\n\v\f+10", "0123456789"));
	printf("ft_atoi_base(\"  -10\", \"01\") = %d\n", ft_atoi_base("  -10", "01"));
	printf("ft_atoi_base(\" -10alo\", \"01\") = %d\n", ft_atoi_base(" -10alo", "01"));
	printf("ft_atoi_base(\"+ff\", \"0123456789abcdef\") = %d\n", ft_atoi_base("+ff", "0123456789abcdef"));
	printf("ft_atoi_base(\"--10\", \"01\") = %d\n", ft_atoi_base("--10", "01"));
	printf("ft_atoi_base(\"+-10\", \"01\") = %d\n", ft_atoi_base("+-10", "01"));
	printf("ft_atoi_base(\"11\", \"01-\") = %d\n", ft_atoi_base("11", "01-"));
	printf("ft_atoi_base(\"13\", \"0 1234\") = %d\n", ft_atoi_base("13", "0 1234"));
	printf("ft_atoi_base(\"16\", \"01234556\") = %d\n", ft_atoi_base("16", "01234556"));
	printf("ft_atoi_base(NULL, \"0123456789\") = %d\n", ft_atoi_base(NULL, "0123456789"));
	printf("ft_atoi_base(\"  --10\", NULL) = %d\n\n\n", ft_atoi_base("  --10", NULL));
	
	printf("====    ( LONG ) LIST    ====\n\n");
	ft_list_push_front(&var, (void*)7);
	printf("ft_list_push_front(&lst, 7)...\n");
	ft_list_push_front(&var, (void*)12);
	printf("ft_list_push_front(&lst, 12)...\n");
	ft_list_push_front(&var, (void*)42);
	printf("ft_list_push_front(&lst, 42)...\n");
	ft_list_push_front(&var, (void*)123);
	printf("ft_list_push_front(&lst, 123)...\n");
	ft_list_push_front(&var, (void*)245);
	printf("ft_list_push_front(&lst, 245)...\n\n");
	print_list(var);
	printf("\nlist size is %d    ( ft_list_size(lst) )\n", ft_list_size(var));
	printf("\nsorting...        ( ft_list_sort(&lst, &compare_two_numbers) )\n\n");
	ft_list_sort(&var, &compare_two_numbers);
	print_list(var);
	printf("\nremoving element 42...   ( ft_list_remove_if(&lst, 42, &compare_two_numbers, &free_number) )\n");
	ft_list_remove_if(&var, (void*)42, &compare_two_numbers, &false_free);
	printf("\n");
	print_list(var);
	printf("\nfreeing list...\n\n");
	free_list(&var);

	var = NULL;

	printf("====    (CHAR *) LIST    ====\n\n");
	ft_list_push_front(&var, (void*)strdup("7"));
	printf("ft_list_push_front(&lst, \"7\")...\n");
	ft_list_push_front(&var, (void*)strdup("12"));
	printf("ft_list_push_front(&lst, \"12\")...\n");
	ft_list_push_front(&var, (void*)strdup("42"));
	printf("ft_list_push_front(&lst, \"42\")...\n");
	ft_list_push_front(&var, (void*)strdup("123"));
	printf("ft_list_push_front(&lst, \"123\")...\n");
	ft_list_push_front(&var, (void*)strdup("245"));
	printf("ft_list_push_front(&lst, \"245\")...\n\n");
	print_str_list(var);
	printf("\nlist size is %d    (ft_list_size(lst))\n", ft_list_size(var));
	printf("\nsorting...        (ft_list_sort(&lst, &strcmp))\n\n");
	ft_list_sort(&var, &strcmp);
	print_str_list(var);
	printf("\nremoving element \"42\"...   (ft_list_remove_if(&lst, \"42\", &strcmp, &free_str)\n");
	ft_list_remove_if(&var, (void*)"42", &strcmp, &free_str);
	printf("\n");
	print_str_list(var);
	printf("\nfreeing list...\n");
	free_str_list(&var);
	
	return (0);
}
