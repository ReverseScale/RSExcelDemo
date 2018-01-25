//
//  RSStyle+DemoStyle.h
//  RSExcelDemo
//
//  Created by WhatsXie on 2017/7/21.
//  Copyright © 2017年 StevenXie. All rights reserved.
//

#import "RSStyle.h"


typedef NS_ENUM(NSUInteger, RSStyleType) {
    RSStyleTypeDefault,
    RSStyleTypeBlue,
    RSStyleTypeGreen,
};

@interface RSStyle (DemoStyle)

+ (instancetype)blueStyle;
+ (instancetype)greenStyle;

@end
