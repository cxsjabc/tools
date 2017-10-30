/*
* Copyright by xichen(Xi.chen)  511272827@qq.com
*/
#include "common_local.h"

#ifndef BUF_SIZE
#define	BUF_SIZE	4096
#endif

int main(int argc, char *argv[])
{
	int fds = -1, fdd = -1;
	char buf[BUF_SIZE];	
	ssize_t sizer, sizew;
	int res;

	LOG_W("Owner: Xi Chen: the same to cp command!\n");	
	
	if(argc != 3) {
		fprintf(stderr, "arguments error!\n");
		return -1;
	}

	fds = open(argv[1], O_RDONLY);
	if(fds == -1) {
		fprintf(stderr, "open %s error!\n", argv[1]);
		return -2;
	}
	fdd = open(argv[2], O_CREAT | O_WRONLY | O_TRUNC, 0644);
	if(fdd == -1) {
		fprintf(stderr, "open %s error!\n", argv[2]);
		return -3;
	}
	
	while((sizer = read(fds, buf, BUF_SIZE)) > 0) {
		sizew = write(fdd, buf, sizer);
		if(sizew != sizer) {
			fprintf(stderr, "write error!\n");
			goto l_exit;	
		}
	}	

	if(sizer < 0)
		goto l_exit;

	goto success;

l_exit:	
	res = -100;
	goto end;

success:
	res = 0;
	goto end;

end:
	if(fdd != -1)
		close(fdd);
	if(fds != -1)
		close(fds);

    return res;
}
