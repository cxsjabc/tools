/*
* Copyright by xichen(Xi.chen)  511272827@qq.com
*/
#include <unistd.h>
#include <stdio.h>
#include <dirent.h>
#include <sys/stat.h>
#include "common_local.h"

void show_file_tree(const char *dir, int tabs, int depth, int show_all)
{
	DIR *d;
	struct dirent *ent;
	int res;
	struct stat stat_buf;

	if(depth > 0 && tabs / 4 > depth)
		return;

	if((d = opendir(dir)) == NULL) {
		perror("opendir %s error\n");
		return;
	}

	res = chdir(dir);
	if(res == -1) {
		perror("chdir error!\n");
		closedir(d);
		return;
	}

	while((ent = readdir(d)) != NULL) {
		//LOG_HERE;
		res = lstat(ent->d_name, &stat_buf);		
		if(res == -1) {
			perror("lstat error!\n");
			closedir(d);
			return;
		}
		if(S_ISDIR(stat_buf.st_mode)) {
			if(!show_all && strstr(ent->d_name, ".") == ent->d_name)
				continue;
			if(strcmp(ent->d_name, ".") == 0 || strcmp(ent->d_name, "..") == 0) {
				continue;
			}
			//printf("enter dir:%s\n", ent->d_name);
			printf("%*s%s/\n", tabs, "", ent->d_name);
			show_file_tree(ent->d_name, tabs + 4, depth, show_all);
		} else {
			if(!show_all && strstr(ent->d_name, ".") == ent->d_name)
				continue;
			printf("%*s%s\n", tabs, "", ent->d_name);
		}
	}

	res = chdir("..");
	if(res == -1) {
		perror("chdir to .. error!\n");
		closedir(d);
		return;
	}	
	res = closedir(d);
	if(res == -1) {
		perror("closedir error!\n");
		return;
	}	
}


int main(int argc, char *argv[])
{
	char *dir;
	int show_all = 0;
	int i = 1;
	int depth = 3;
	
	printf("[W] owner: Xi Chen!\n");
	if(argc >= 5) {
		fprintf(stderr, "too many args: usage-> %s [-a] [-d <num>] <folder>\n", argv[0]);
		return -1;
	}

	dir = ".";
	--argc;
	while(i <= argc) {
		if(strcmp(argv[i], "-a") == 0)
			show_all = 1;			
		else if(strcmp(argv[i], "-d") == 0) {
			if(argv[i + 1] == NULL) {
				fprintf(stderr, "args error: -d should follow a depth number!\n");
				return -2;
			} else {
				depth = atoi(argv[i + 1]);
				++i;
			} 
		} else
			dir = argv[i];
		++i;
	}

	show_file_tree(dir, 0, depth, show_all);

    return 0;
}
