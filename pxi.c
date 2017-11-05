/*
* Copyright by xichen(Xi.chen)  511272827@qq.com
*/
#include "common_local.h"

// this file, we want to print some common and useful information 
// , such as: include file path,...

// mac
#define MAC_INC_PATH	"/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk/usr/include/"

// linux
// Todo

int main()
{
	printf("[W] Owner: Xi Chen!\n");	
	printf("Mac: include file path:\n\t%s\n", MAC_INC_PATH);	

    return 0;
}
