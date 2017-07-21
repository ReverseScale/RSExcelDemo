//
//  RSGrid.h
//  RSExcelDemo
//
//  Created by WhatsXie on 2017/7/21.
//  Copyright © 2017年 StevenXie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface RSGrid : NSObject

@property (nonatomic, copy) NSString *text;
@property (nonatomic, strong) UIImage *image;

@property (nonatomic, strong) UIColor *backgroundColor;
@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, strong) UIFont *font;
@property (nonatomic, assign) NSTextAlignment textAlignment;
@property (nonatomic, assign) NSInteger rowspan;
@property (nonatomic, assign) NSInteger colspan;
@property (nonatomic, assign) BOOL underline;
@property (nonatomic, readonly) BOOL isTextAlignmentOriginal;

@property (nonatomic, strong) NSIndexPath *indexPath;

@end
