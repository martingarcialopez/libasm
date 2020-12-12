#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <stdlib.h>

#include "libasm.h"

int main()
{
	unsigned int  ret;
	char buf[4];
	char str[] = "holaktal";
	char str2[] = "1234";
	char *str3 = NULL;
	
	bzero(buf, 4);
	printf("====    FT_STRLEN    ====\n");
	printf("real  strlen(\"%s\") = %ld\n", str, strlen(str));
	printf("my ft_strlen(\"%s\") = %ld\n", str, ft_strlen(str));
	
	printf("\n====    FT_STRCMP    ====\n");
	printf("real  strcmp(\"%s\", \"%s\") : %d\n", str2, str, strcmp(str2, str));
	printf("my ft_strcmp(\"%s\", \"%s\") : %d\n", str2, str, ft_strcmp(str2, str));

	printf("\nreal  strcmp(\"%s\", \"%s\") : %d\n", str, str2, strcmp(str, str2));
	printf("my ft_strcmp(\"%s\", \"%s\") : %d\n\n", str, str2, ft_strcmp(str, str2));

	printf("real  strcmp(\"%s\", \"%s\") : %d\n", str2, str2, strcmp(str2, str2));
	printf("my ft_strcmp(\"%s\", \"%s\") : %d\n", str2, str2, ft_strcmp(str2, str2));

	printf("\n====    FT_STRCPY    ====\n");
	printf("str is \"%s\"\n", str);
	printf("ft_strcpy(str, \"%s\")...\n", str2);
	ft_strcpy(str, str2); 
	printf("str is \"%s\"\n\n", str);

	printf("====    FT_READ    ====\n");
	printf("ft_read(0, buf, 4)\n\n");
	ft_read(0, buf, 4);
	printf("\n\n");
	printf("====    FT_WRITE    ====\n");
	printf("ft_write(1, buf, 4)...\n");
	ft_write(1, buf, 4);
	printf("\n\n");
	printf("ft_write(-1, buf, 1)...\n");
	ft_write(-1, buf, 1);
	perror("Error ");

	printf("\n====    FT_STRDUP    ====\n");
	printf("str3 == %s\n", str3);
	printf("str3 = ft_strdup(\"%s\")\n", str2);
	str3 = ft_strdup(str2);
	printf("str3 == %s\n\n", str3);
	free(str3);

	return (0);
}
