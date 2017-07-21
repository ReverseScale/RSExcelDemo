//
//  NSIndexPath+RSReport.m
//  RSExcelDemo
//
//  Created by WhatsXie on 2017/7/21.
//  Copyright © 2017年 StevenXie. All rights reserved.
//

#import "NSIndexPath+RSReport.h"

@implementation NSIndexPath (RSReport)

+ (NSIndexPath *)indexPathForCol:(NSInteger)col inRow:(NSInteger)row {
    return [NSIndexPath indexPathForRow:row inSection:col];
}

- (NSInteger)col {
    return self.section;
}

@end
