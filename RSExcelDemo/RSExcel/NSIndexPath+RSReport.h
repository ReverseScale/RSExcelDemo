//
//  NSIndexPath+RSReport.h
//  RSExcelDemo
//
//  Created by WhatsXie on 2017/7/21.
//  Copyright © 2017年 StevenXie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSIndexPath (RSReport)

@property (nonatomic, readonly) NSInteger row;
@property (nonatomic, readonly) NSInteger col;
+ (NSIndexPath *)indexPathForCol:(NSInteger)col inRow:(NSInteger)row;


@end
