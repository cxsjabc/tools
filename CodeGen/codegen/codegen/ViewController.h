//
//  ViewController.h
//  codegen1
//
//  Created by eyu on 2019/3/10.
//  Copyright © 2019年 eyu. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "outlineview_data.h"

@interface ViewController : NSViewController<NSOutlineViewDataSource, NSOutlineViewDelegate>
{
    outlineviewData *root;
    
    //For NSoutlineView child items
}

@property  IBOutlet NSButton *btn_search;
@property  IBOutlet NSTextField *txt_src;
@property  IBOutlet NSOutlineView *outlineview;

- (IBAction)btn_search_clicked:(id)sender;

@end

