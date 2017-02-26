#include "common_local.h"

int main(int argc, char *argv[])
{
	int i;
	
	if(argc == 1) {

		for(i = 0; i < 128; ++i) {
			printf("%d %c", i, (char)i);
			if(i != 0 && i % 10 == 0)
				printf("\n");
		}
		printf("\n");
	
		return 0;
	}
	
	if(argv[1][0] == '-') {
		if(argv[1][1] == 'h') {
			printf("Written By XiChen!\n");
			return 0;
		}
	}
	i = *argv[1];
	printf("%d %c\n", i, (char)i);
	
    return 0;
}
