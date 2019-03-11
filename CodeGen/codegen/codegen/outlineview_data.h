//
//  outlineview_data.h
//  codegen1
//
//  Created by eyu on 2019/3/10.
//  Copyright © 2019年 eyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface outlineviewData : NSObject
{
    NSString *name;
    NSString *iD;
    NSMutableArray *array;
    
}

@property (readwrite,copy) NSString *name;
@property (readwrite,copy) NSString *iD;
@property (readwrite,copy) NSMutableArray *array;

@end

