//
//  RSReportView.h
//  RSExcelDemo
//
//  Created by WhatsXie on 2017/7/21.
//  Copyright © 2017年 StevenXie. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RSReportView;
@class RSGrid;
@class RSLabel;
@class RSStyle;

typedef NS_ENUM(NSInteger, RSOrder) {
    RSOrderedAscending = -1,
    RSOrderedNature,
    RSOrderedDescending
};

@protocol RSeportViewDatasource <NSObject>

@required
- (NSInteger)numberOfRowsInReportView:(RSReportView *)reportView;
- (NSInteger)numberOfColsInReportView:(RSReportView *)reportView;
- (RSGrid *)reportView:(RSReportView *)reportView gridAtIndexPath:(NSIndexPath *)indexPath;

@optional
- (NSInteger)numberOfHeadRowsInReportView:(RSReportView *)reportView; // 表头行数，默认为1
- (CGFloat)reportView:(RSReportView *)reportView heightOfRow:(NSInteger)row; // 某一行的高度，如果未实现则取style中的heightOfHeaderRow/heightOfRow的值
- (CGFloat)reportView:(RSReportView *)reportView widthOfCol:(NSInteger)col; // 某一列的宽度，如果未实现则取style中的widthOfFirstCol/widthOfCol的值

@end

@protocol RSeportViewDelegate <NSObject>

@optional
- (void)reportView:(RSReportView *)reportView didTapLabel:(RSLabel *)label;
- (void)reportView:(RSReportView *)reportView didLongPressLabel:(RSLabel *)label;
- (NSOrderedSet *)reportView:(RSReportView *)reportView indexesSortedByCol:(NSInteger)col order:(RSOrder)order;

@end

@interface RSReportView : UIView

@property (nonatomic, weak) id<RSeportViewDatasource> datasource;
@property (nonatomic, weak) id<RSeportViewDelegate> delegate;

@property (nonatomic, readonly) UITapGestureRecognizer *tapGestureRecognizer;
@property (nonatomic, readonly) UILongPressGestureRecognizer *longPressGestureRecognizer; // 默认minimumPressDuration = 1.0。

@property (nonatomic, strong) RSStyle *style; // 报表整体风格样式，在报表已加载过的情况下(didMoveToSuperview)，需要调用手动reloadData来刷新样式。

@property (nonatomic, assign) NSInteger sortedCol;
@property (nonatomic, assign) RSOrder sortedOrder;

- (instancetype)initWithFrame:(CGRect)frame; // 在frame.size.width/height == 0 时候，会自动拉伸至内容所需宽度/长度
- (void)reloadData;
- (void)sortByCol:(NSInteger)col order:(RSOrder)order;

- (NSInteger)numberOfRows;
- (NSInteger)numberOfCols;
- (NSInteger)numberOfHeadRows;
- (RSGrid *)gridAtIndexPath:(NSIndexPath *)indexPath;
- (CGFloat)heightOfRow:(NSInteger)row;
- (CGFloat)widthOfCol:(NSInteger)col;

@end
