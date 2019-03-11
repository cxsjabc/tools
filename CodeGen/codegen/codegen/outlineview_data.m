//
//  outlineview_data.m
//  codegen1
//
//  Created by eyu on 2019/3/10.
//  Copyright © 2019年 eyu. All rights reserved.
//

#import "outlineview_data.h"

@implementation outlineviewData

@synthesize name;
@synthesize iD;
@synthesize array;

-(id)init
{
    name = nil;
    iD = nil;
    array = [NSMutableArray new];
    
    return self;
}

@end
