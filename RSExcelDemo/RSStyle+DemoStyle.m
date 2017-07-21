//
//  RSStyle+DemoStyle.m
//  RSExcelDemo
//
//  Created by WhatsXie on 2017/7/21.
//  Copyright © 2017年 StevenXie. All rights reserved.
//

#import "RSStyle+DemoStyle.h"

@implementation RSStyle (DemoStyle)

+ (NSDictionary *)defaultLayoutSettings {
    return @{
             RSHeightOfHeaderRowSettingName: @36.f,
             RSHeightOfRowSettingName: @36.f,
             RSWidthOfFirstColSettingName: @74.f,
             RSWidthOfColSettingName: @75.f,
             RSFontOfHeaderSettingName: [UIFont systemFontOfSize:13.f],
             RSFontSettingName: [UIFont systemFontOfSize:13.f],
             RSBorderInsetsSettingName: [NSValue valueWithUIEdgeInsets:UIEdgeInsetsMake(1.f, 1.f, 1.f, 1.f)]
             };
}

+ (instancetype)blueStyle {
    NSMutableDictionary *settings = [[self defaultLayoutSettings] mutableCopy];
    [settings addEntriesFromDictionary:@{
                                         RSBackgroundColorOfHeaderSettingName: [UIColor colorWithRed:57/255.0 green:152/255.0 blue:216/255.0 alpha:1],
                                         RSBorderColorSettingName: [UIColor colorWithRed:46/255.0 green:128/255.0 blue:182/255.0 alpha:1],
                                         RSTextColorOfHeaderSettingName: [UIColor whiteColor],
                                         }];
    return [RSStyle styleWithSettings:settings];
}

+ (instancetype)greenStyle {
    NSMutableDictionary *settings = [[self defaultLayoutSettings] mutableCopy];
    [settings addEntriesFromDictionary:@{
                                         RSBackgroundColorOfHeaderSettingName: [UIColor colorWithRed:0.086 green:0.627 blue:0.521 alpha:1],
                                         RSBorderColorSettingName: [UIColor colorWithRed:0.2 green:0.7 blue:0.6 alpha:1],
                                         RSTextColorOfHeaderSettingName: [UIColor whiteColor],
                                         RSTextColorSettingName: [UIColor colorWithWhite:0.25 alpha:1],
                                         RSStripeTextColorSettingName: [UIColor colorWithRed:0.8 green:0 blue:0 alpha:1],
                                         }];
    return [RSStyle styleWithSettings:settings];
}


@end
