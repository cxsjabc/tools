//
//  ViewController.m
//  codegen1
//
//  Created by eyu on 2019/3/10.
//  Copyright © 2019年 eyu. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //[txt_src setTextColor:[NSColor redColor]];
    // Do any additional setup after loading the view.
    [_outlineview setDataSource:self];
    [_outlineview setDelegate:self];
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (NSString *)getInputText
{
    return [_txt_src stringValue];
}

- (NSString *)getPreprocessedString:(NSString *)s
{
    NSMutableString *ms = [[NSMutableString alloc] initWithString:s];
    NSString *trimed_ms = [ms stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return trimed_ms;
}

- (BOOL)checkInputText:(NSString *)s
{
    NSString *trimed_ms = [self getPreprocessedString:s];
    
    if([trimed_ms isEqualToString:@""])
        return FALSE;
    return TRUE;
}

// bugs: can't show the outline data..
- (IBAction)btn_search_clicked:(id)sender
{
    NSString *txt_symbol = [self getInputText];
    NSString *trimed_ms;
    
    if(![self checkInputText:txt_symbol])
        return;
    
    trimed_ms = [self getPreprocessedString:txt_symbol];
    root = [[outlineviewData alloc] init];
    
    outlineviewData *data = [[outlineviewData alloc] init];
    [data setName:trimed_ms];
    [data setID:@"123"];
    [[root array] addObject:data];
    
    outlineviewData *child = [[outlineviewData alloc] init];
    [child setName:@"普京"];
    [child setID:@"111"];
    [[data array] addObject:child];
    
    outlineviewData *data2 = [[outlineviewData alloc] init];
    [data2 setName:@"江泽民"];
    [data2 setID:@"456"];
    [[root array] addObject:data2];
    
    outlineviewData *child2 = [[outlineviewData alloc] init];
    [child2 setName:@"奥巴马"];
    [child2 setID:@"222"];
    [[data2 array] addObject:child2];
    
    [_outlineview sizeLastColumnToFit];
    [_outlineview reloadData];
    [_outlineview setFloatsGroupRows:YES];
    [_outlineview setRowSizeStyle:NSTableViewRowSizeStyleDefault];
    
#if 1
    // Expand all the root items; disable the expansion animation that normally happens
    [NSAnimationContext beginGrouping];
    [[NSAnimationContext currentContext] setDuration:0];
    [_outlineview expandItem:nil expandChildren:YES];
    [NSAnimationContext endGrouping];
#endif
    
    //[_txt_src setStringValue:@"test"];
}

//获取表格数据
- (id)outlineView:(NSOutlineView *)outlineView child:(NSInteger)index ofItem:(id)item
{
    if (item == nil) {
        return [[root array] objectAtIndex:index];
    }
    else
    {
        return [[(outlineviewData *)item array] objectAtIndex:index];
    }
}

//获取表格数据的个数
- (NSInteger)outlineView:(NSOutlineView *)outlineView numberOfChildrenOfItem:(id)item
{
    // return [[root mutableChildNodes] count];
    NSInteger number = (item == nil) ? [[root array] count] : [[(outlineviewData*)item array] count];
    return number;
}

//判断能否展开
- (BOOL)outlineView:(NSOutlineView *)outlineView isItemExpandable:(id)item
{
    outlineviewData *data = (outlineviewData *)item;
    return [[data array] count];
}

//判断是否应该展开
- (BOOL)outlineView:(NSOutlineView *)outlineView shouldExpandItem:(id)item
{
    outlineviewData *data = (outlineviewData *)item;
    return [[data array] count];
}

//显示数据到表格上
- (void)outlineView:(NSOutlineView *)outlineView willDisplayCell:(id)cell forTableColumn:(NSTableColumn *)tableColumn item:(id)item
{
    outlineviewData *data = (outlineviewData *)item;
    NSString *identifier = [tableColumn identifier];
    
    if ([identifier isEqualToString:@"name"])
    {
        NSTextFieldCell * textCell = cell;
        [textCell setStringValue:data.name];
    }
    else if([identifier isEqualToString:@"id"])
    {
        NSTextFieldCell * textCell = cell;
        [textCell setStringValue:data.iD];
    }
}

#if 1
- (id)outlineView:(NSOutlineView *)outlineView objectValueForTableColumn:(NSTableColumn *)tableColumn byItem:(id)item
{
#if 1
    outlineviewData *data = (outlineviewData *)item;
    return [[NSString alloc] initWithString:data.name];
#endif
}
#endif

@end
