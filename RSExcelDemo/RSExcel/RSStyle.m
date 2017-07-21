//
//  RSStyle.m
//  RSExcelDemo
//
//  Created by WhatsXie on 2017/7/21.
//  Copyright © 2017年 StevenXie. All rights reserved.
//

#import "RSStyle.h"

NSString *const RSHeightOfHeaderRowSettingName = @"RSHeightOfHeaderRow";
NSString *const RSHeightOfRowSettingName = @"RSHeightOfRow";
NSString *const RSWidthOfFirstColSettingName = @"RSWidthOfFirstCol";
NSString *const RSWidthOfColSettingName = @"RSWidthOfCol";
NSString *const RSAutoFitHeightSettingName = @"RSAutoFitHeight";
NSString *const RSBackgroundColorSettingName = @"RSBackgroundColor";
NSString *const RSBackgroundColorOfHeaderSettingName = @"RSBackgroundColorOfHeader";
NSString *const RSTextColorSettingName = @"RSTextColor";
NSString *const RSTextColorOfHeaderSettingName = @"RSTextColorOfHeader";
NSString *const RSFontSettingName = @"RSFont";
NSString *const RSFontOfHeaderSettingName = @"RSFontOfHeader";
NSString *const RSTextAlignmentSettingName = @"RSTextAlignment";
NSString *const RSTextAlignmentOfHeaderSettingName = @"RSTextAlignmentOfHeader";
NSString *const RSSpacingSettingName = @"RSSpacing";
NSString *const RSBorderColorSettingName = @"RSBorderColor";
NSString *const RSBorderInsetsSettingName = @"RSBorderInsets";
NSString *const RSTrimWidthSpaceSettingName = @"RSTrimWidthSpace";
NSString *const RSTrimHeightSpaceSettingName = @"RSTrimHeightSpace";
NSString *const RSStripeBackgroundColorSettingName = @"RSStripeBackgroundColor";
NSString *const RSStripeTextColorSettingName = @"RSStripeTextColor";


@implementation RSStyle {
    BOOL _isTextAlignmentOfHeaderOrigin;
}

@synthesize textAlignmentOfHeader = _textAlignmentOfHeader;

- (instancetype)init {
    return [self initWithSettings:nil];
}

- (instancetype)initWithSettings:(NSDictionary *)settings {
    if (self = [super init]) {
        _heightOfHeaderRow = 0.f;
        _heightOfRow = 0.f;
        _widthOfFirstCol = 0.f;
        _widthOfCol = 0.f;
        _backgroundColor = [UIColor whiteColor];
        _backgroundColorOfHeader = nil;
        _textColor = [UIColor blackColor];
        _textColorOfHeader = nil;
        _font = [UIFont systemFontOfSize:17.f];
        _fontOfHeader = nil;
        _textAlignment = NSTextAlignmentCenter;
        _isTextAlignmentOfHeaderOrigin = YES;
        _spacing = 1.f;
        _borderColor = [UIColor grayColor];
        _borderInsets = UIEdgeInsetsMake(1.f, 1.f, 1.f, 1.f);
        _trimWidthSpace = YES;
        _trimHeightSpace = YES;
        _stripeBackgroundColor = nil;
        _stripeTextColor = nil;
        
        if (settings) {
            id obj;
            if ((obj = [settings objectForKey:RSHeightOfHeaderRowSettingName])) _heightOfHeaderRow = [obj floatValue];
            if ((obj = [settings objectForKey:RSHeightOfRowSettingName])) _heightOfRow = [obj floatValue];
            if ((obj = [settings objectForKey:RSWidthOfFirstColSettingName])) _widthOfFirstCol = [obj floatValue];
            if ((obj = [settings objectForKey:RSWidthOfColSettingName])) _widthOfCol = [obj floatValue];
            if ((obj = [settings objectForKey:RSAutoFitHeightSettingName])) _autoFitHeight = [obj boolValue];
            if ((obj = [settings objectForKey:RSBackgroundColorSettingName])) _backgroundColor = obj;
            if ((obj = [settings objectForKey:RSBackgroundColorOfHeaderSettingName])) _backgroundColorOfHeader = obj;
            if ((obj = [settings objectForKey:RSTextColorSettingName])) _textColor = obj;
            if ((obj = [settings objectForKey:RSTextColorOfHeaderSettingName])) _textColorOfHeader = obj;
            if ((obj = [settings objectForKey:RSFontSettingName])) _font = obj;
            if ((obj = [settings objectForKey:RSFontOfHeaderSettingName])) _fontOfHeader = obj;
            if ((obj = [settings objectForKey:RSTextAlignmentSettingName])) _textAlignment = [obj integerValue];
            if ((obj = [settings objectForKey:RSTextAlignmentOfHeaderSettingName])) self.textAlignmentOfHeader = [obj floatValue];
            if ((obj = [settings objectForKey:RSSpacingSettingName])) _spacing = [obj floatValue];
            if ((obj = [settings objectForKey:RSBorderColorSettingName])) _borderColor = obj;
            if ((obj = [settings objectForKey:RSBorderInsetsSettingName])) _borderInsets = [obj UIEdgeInsetsValue];
            if ((obj = [settings objectForKey:RSTrimWidthSpaceSettingName])) _trimWidthSpace = [obj boolValue];
            if ((obj = [settings objectForKey:RSTrimHeightSpaceSettingName])) _trimHeightSpace = [obj boolValue];
            if ((obj = [settings objectForKey:RSStripeBackgroundColorSettingName])) _stripeBackgroundColor = obj;
            if ((obj = [settings objectForKey:RSStripeTextColorSettingName])) _stripeTextColor = obj;
        }
    }
    return self;
}

+ (instancetype)defaultStyle {
    NSDictionary *settings = @{
                               RSBackgroundColorOfHeaderSettingName: [UIColor colorWithRed:104/255.f green:173/255.f blue:213/255.f alpha:1.f],
                               RSBorderColorSettingName: [UIColor colorWithRed:170/255.f green:200/255.f blue:230/255.f alpha:1.f],
                               RSBackgroundColorSettingName: [UIColor whiteColor],
                               RSHeightOfHeaderRowSettingName: @36.f,
                               RSHeightOfRowSettingName: @36.f,
                               RSWidthOfFirstColSettingName: @74.f,
                               RSWidthOfColSettingName: @75.f,
                               RSFontOfHeaderSettingName: [UIFont systemFontOfSize:13.f],
                               RSFontSettingName: [UIFont systemFontOfSize:13.f],
                               RSTextColorSettingName: [UIColor blackColor],
                               RSTextColorOfHeaderSettingName: [UIColor whiteColor],
                               RSBorderInsetsSettingName: [NSValue valueWithUIEdgeInsets:UIEdgeInsetsMake(1.f, 1.f, 1.f, 1.f)]
                               };
    return [RSStyle styleWithSettings:settings];
}

+ (instancetype)styleWithSettings:(NSDictionary *)settings {
    return [[RSStyle alloc] initWithSettings:settings];
}

- (UIColor *)backgroundOfHeader {
    return _backgroundColorOfHeader ?: _backgroundColor;
}

- (void)setTextAlignmentOfHeader:(NSTextAlignment)textAlignmentOfHeader {
    _textAlignmentOfHeader = textAlignmentOfHeader;
    _isTextAlignmentOfHeaderOrigin = NO;
}

- (NSTextAlignment)textAlignmentOfHeader {
    return _isTextAlignmentOfHeaderOrigin ? _textAlignment : _textAlignmentOfHeader;
}

- (UIFont *)fontOfHeader {
    return _fontOfHeader ?: _font;
}

- (UIColor *)textColorOfHeader {
    return _textColorOfHeader ?: _textColor;
}

- (CGFloat)widthOfFirstCol {
    return _widthOfFirstCol > 0 ? _widthOfFirstCol : _widthOfCol;
}

- (CGFloat)heightOfHeaderRow {
    return _heightOfHeaderRow > 0 ? _heightOfHeaderRow : _heightOfRow;
}


@end
