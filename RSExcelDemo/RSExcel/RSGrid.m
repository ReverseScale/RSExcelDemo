//
//  RSGrid.m
//  RSExcelDemo
//
//  Created by WhatsXie on 2017/7/21.
//  Copyright © 2017年 StevenXie. All rights reserved.
//

#import "RSGrid.h"

@implementation RSGrid

- (instancetype)init {
    if (self = [super init]) {
        _rowspan = 1;
        _colspan = 1;
        _isTextAlignmentOriginal = YES;
    }
    return self;
}

- (void)setTextAlignment:(NSTextAlignment)textAlignment {
    _textAlignment = textAlignment;
    _isTextAlignmentOriginal = NO;
}


@end
