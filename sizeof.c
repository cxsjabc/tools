/*
* Copyright by xichen(Xi.chen)  511272827@qq.com
*/
#include "common_local.h"

const char *type_name[] = {
	"char",
	"short",
	"int",
	"long",
	"longlong",
	"float",
	"double",
	"p",				// means pointer
};

const int type_sizeof[] = {
	sizeof(char),
	sizeof(short),
	sizeof(int),
	sizeof(long),
	sizeof(long long),
	sizeof(float),
	sizeof(double),
	sizeof(void *),
};

// if return -1, it means the type is unknown!
int get_size_from_type_arr(const char *type)
{
	int i;
	for(i = 0; i < sizeof(type_name) / sizeof(type_name[0]); ++i) {
		if(strcmp(type, type_name[i]) == 0)
			return type_sizeof[i];
	}
	return -1;
}

int main(int argc, char *argv[])
{
	int a, b, c, d;
	LOG_W("Owner: Xi Chen!\n");	
	if(argc == 1) {	// print all sizeof infos
		a = sizeof(char);
		b = sizeof(short); 
		c = sizeof(int); 
		d = sizeof(long); 
		// it's ugly! 	
		printf("sizeof(char):%d\n", a);
		printf("sizeof(short):%d\n", b);
		printf("sizeof(ing):%d\n", c);
		printf("sizeof(long):%d\n", d);
		printf("sizeof(long long):%lu\n", sizeof(long long));
		printf("sizeof(float):%lu\n", sizeof(float));
		printf("sizeof(double):%lu\n", sizeof(double));
		printf("sizeof(void *):%lu\n", sizeof(void *));
		return 0;
	}

	if(argc > 1) {
		int i = 1;
		while(i < argc) {
			int size = get_size_from_type_arr(argv[i]);
			if(size >= 0) { 
				printf("sizeof(%s):%d\n", argv[i], size);
			} else
				printf("Unknown type:%s\n", argv[i]);
			++i;
		}
	}
    return 0;
}
