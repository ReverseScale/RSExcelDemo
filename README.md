# RSExcelDemo

![](https://img.shields.io/badge/platform-iOS-red.svg) ![](https://img.shields.io/badge/language-Objective--C-orange.svg) ![](https://img.shields.io/badge/download-2.7MB-brightgreen.svg
) ![](https://img.shields.io/badge/license-MIT%20License-brightgreen.svg) 

表格工具视图封装，多种样式，使用简单。
推荐：RmondJone/ExcelView（https://github.com/RmondJone/ExcelView）
支持XIB布局，支持代码布局，支持锁双向表头。

| 名称 |1.列表页 |2.简单页 |3.风格页 | 4.复合页 | 5.单元页 | 6.响应页 | 7.自适应页 |
| ------------- | ------------- | ------------- | ------------- | ------------- | ------------- | ------------- | ------------- |
| 截图 | ![](http://og1yl0w9z.bkt.clouddn.com/17-7-21/50968283.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/17-7-21/67391545.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/17-7-21/36860931.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/17-7-21/56984525.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/17-7-21/16416833.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/17-7-21/53621226.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/17-7-21/3844082.jpg) |
| 描述 | 通过 storyboard 搭建基本框架 | 简单展示 | 风格展示 | 复合表头 | 多元化单元格 | 响应事件 | 自适应高度 |


## Advantage 框架的优势
* 1.文件少，逻辑清晰，功能解耦
* 2.不依赖任何其他第三方库
* 3.支持多种数据展示
* 4.使用协议方式响应，学习曲线好
* 5.具备较高自定义性

## Requirements 要求
* iOS 7+
* Xcode 8+


## Usage 使用方法
### 第一步 引入头文件
```Objective-C
#import "RSExcelFile.h"
```
### 第二步 签协议、声明属性
```Objective-C
@interface SimpleViewController ()<RSeportViewDatasource>
@property (nonatomic, strong)RSReportView *reportView;
@end
```
### 第三步 实现和布局
```Objective-C
self.reportView = [[RSReportView alloc] init];
self.reportView.datasource = self;
[self.view addSubview:self.reportView];
CGRect rect = self.view.bounds;
rect = CGRectInset(rect, 16, 16);
rect.origin.y += 60;
rect.size.height -= 64;
self.reportView.frame = rect;
```
### 第四步 实现协议（数据）
```Objective-C
#pragma mark - <LMReportViewDatasource>
- (NSInteger)numberOfRowsInReportView:(RSReportView *)reportView {
    return 20;
}
- (NSInteger)numberOfColsInReportView:(RSReportView *)reportView {
    return 10;
}
- (RSGrid *)reportView:(RSReportView *)reportView gridAtIndexPath:(NSIndexPath *)indexPath {
    RSGrid *grid = [[RSGrid alloc] init];
    grid.text = [NSString stringWithFormat:@"%ld-%ld", indexPath.row, indexPath.col];
    return grid;
}
```
### 可选 处理代理
```Objective-C
// 代理协议
RSeportViewDelegate
```
```Objective-C
#pragma mark - <LMReportViewDelegate>
- (void)reportView:(RSReportView *)reportView didTapLabel:(RSLabel *)label {
    if (label.indexPath.row == 0) {
        // 点击表头进行排序
        RSOrder order;
        if (reportView.sortedCol == label.indexPath.col && reportView.sortedOrder == RSOrderedDescending) {
            order = RSOrderedAscending;
        }
        else {
            order = RSOrderedDescending;
        }
        [reportView sortByCol:label.indexPath.col order:order];
    }
    else {
        [self alertMessage:[NSString stringWithFormat:@"点击 %ld-%ld", label.indexPath.row, label.indexPath.col]];
    }
}
- (void)reportView:(RSReportView *)reportView didLongPressLabel:(RSLabel *)label {
    [self alertMessage:[NSString stringWithFormat:@"长按 %ld-%ld", label.indexPath.row, label.indexPath.col]];
}
- (NSOrderedSet *)reportView:(RSReportView *)reportView indexesSortedByCol:(NSInteger)col order:(RSOrder)order {
    if (order == RSOrderedAscending) {
        return [self ascOrderedSetForSortedCol:col];
    }
    else if (order == RSOrderedDescending) {
        return [[self ascOrderedSetForSortedCol:col] reversedOrderedSet];
    }
    else {
        return nil;
    }
}
```

使用简单、效率高效、进程安全~~~如果你有更好的建议,希望不吝赐教!


## License 许可证
RSExcelDemo 使用 MIT 许可证，详情见 LICENSE 文件。


## Contact 联系方式:
* WeChat : WhatsXie
* Email : ReverseScale@iCloud.com
* Blog : https://reversescale.github.io
