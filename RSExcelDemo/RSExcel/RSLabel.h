//
//  RSLabel.h
//  RSExcelDemo
//
//  Created by WhatsXie on 2017/7/21.
//  Copyright © 2017年 StevenXie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RSLabel : UILabel

@property (nonatomic, strong) NSIndexPath *indexPath;
@property (nonatomic, assign) NSInteger rowspan;
@property (nonatomic, assign) NSInteger colspan;
@property (nonatomic, assign) BOOL underline;
@property (nonatomic, retain) UIImage *image;

- (void)heightToFit;


@end
