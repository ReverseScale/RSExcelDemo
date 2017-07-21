//
//  RSLabel.m
//  RSExcelDemo
//
//  Created by WhatsXie on 2017/7/21.
//  Copyright © 2017年 StevenXie. All rights reserved.
//

#import "RSLabel.h"

@implementation RSLabel

- (void)drawRect:(CGRect)rect {
    
    if (self.image) {
        self.clipsToBounds = YES;
        [self.image drawInRect:rect];
        return;
    }
    
    if (self.text.length > 0) {
        NSMutableAttributedString *multableAttributedText = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
        NSRange range = NSMakeRange(0, multableAttributedText.length);
        [multableAttributedText addAttribute:NSUnderlineStyleAttributeName
                                       value:(self.underline ? @(NSUnderlineStyleSingle) : @(NSUnderlineStyleNone))
                                       range:range];
        [multableAttributedText addAttribute:NSUnderlineColorAttributeName
                                       value:self.textColor
                                       range:range];
        self.attributedText = [multableAttributedText copy];
    }
    [super drawRect:rect];
}

- (void)heightToFit {
    if (self.text.length == 0) {
        return;
    }
    else {
        CGFloat height = [self.text boundingRectWithSize:CGSizeMake(CGRectGetWidth(self.bounds), 0)
                                                 options:NSStringDrawingUsesLineFragmentOrigin
                                              attributes:@{
                                                           NSFontAttributeName: self.font,
                                                           NSUnderlineColorAttributeName: @(self.underline)
                                                           }
                                                 context:nil].size.height;
        if (height > CGRectGetHeight(self.frame)) {
            CGRect rect = self.frame;
            rect.size.height = roundf(height + 0.5f);
            self.frame = rect;
        }
    }
}


@end
