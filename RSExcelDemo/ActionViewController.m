//
//  ActionViewController.m
//  RSExcelDemo
//
//  Created by WhatsXie on 2017/7/21.
//  Copyright © 2017年 StevenXie. All rights reserved.
//

#import "ActionViewController.h"
#import "RSExcelFile.h"

@interface ActionViewController ()<RSeportViewDatasource, RSeportViewDelegate>

@property (nonatomic, strong) RSReportView *reportView;
@property (nonatomic, strong) NSArray *generalDatas;

@end

@implementation ActionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.reportView = [[RSReportView alloc] init];
    self.reportView.datasource = self;
    self.reportView.delegate = self;
    [self.view addSubview:self.reportView];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    CGRect rect = self.view.bounds;
    rect = CGRectInset(rect, 16, 16);
    rect.origin.y += 60;
    rect.size.height -= 64;
    self.reportView.frame = rect;
}

- (NSArray *)generalDatas {
    if (_generalDatas) {
        return _generalDatas;
    }
    
    NSMutableArray *rows = [NSMutableArray array];
    for (NSInteger rowIndex = 0; rowIndex < 20; rowIndex++) {
        NSMutableArray *grids = [NSMutableArray array];
        NSInteger colIndex = 0;
        while (colIndex < 10) {
            RSGrid *grid = [[RSGrid alloc] init];
            if (rowIndex == 0) {
                grid.text = [NSString stringWithFormat:@"第%ld列", colIndex];
            }
            else {
                grid.text = @(arc4random() % 1000).stringValue;
            }
            [grids addObject:grid];
            colIndex++;
        }
        [rows addObject:grids];
    }
    _generalDatas = rows;
    return _generalDatas;
}

- (void)alertMessage:(NSString *)message {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"系统提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:action];
    [self.navigationController presentViewController:alert animated:YES completion:nil];
}

- (NSOrderedSet *)ascOrderedSetForSortedCol:(NSInteger)col {
    /*
     获取行索引的排序：先获取值的排序，然后一一对应到行索引的排序
     */
    NSMutableArray *sourceValues = [self.generalDatas mutableCopy];
    // 去掉第一行表头
    [sourceValues removeObjectAtIndex:0];
    //将列值数组从小到大排序
    NSArray *sortedValues = [sourceValues sortedArrayUsingComparator:^NSComparisonResult(NSArray *rows1, NSArray *rows2) {
        
        RSGrid *grid1 = rows1[col];
        RSGrid *grid2 = rows2[col];
        
        NSString *str1 = grid1.text;
        NSString *str2 = grid2.text;
        
        NSScanner *scanner = [NSScanner scannerWithString:str1];
        float floatValue;
        [scanner scanFloat:&floatValue];
        
        if ([scanner isAtEnd]) {
            //数字
            return str2.floatValue > str1.floatValue ? NSOrderedAscending : NSOrderedDescending;
        }
        else {
            //非数字
            UILocalizedIndexedCollation *collation = [UILocalizedIndexedCollation currentCollation];
            
            NSInteger length = str1.length < str2.length ? str1.length : str2.length;
            NSInteger loc = 0;
            while (loc < length) {
                
                NSString *word1 = [str1 substringWithRange:NSMakeRange(loc, 1)];
                NSString *word2 = [str2 substringWithRange:NSMakeRange(loc, 1)];
                
                NSInteger section1 = [collation sectionForObject:word1 collationStringSelector:@selector(description)];
                NSInteger section2 = [collation sectionForObject:word2 collationStringSelector:@selector(description)];
                
                return section2 > section1 ? NSOrderedDescending : NSOrderedAscending;
            }
            return NSOrderedAscending;
        }
    }];
    //获取行索引的排序
    NSMutableOrderedSet *sortedIndexes = [NSMutableOrderedSet orderedSet];
    for (id value in sortedValues) {
        NSInteger index = [sourceValues indexOfObject:value];
        //相同的字符串指向同一个(@"0" == @"0")，所以要把索引过的移除掉，避免同一个索引被多次加入到索引数组中
        sourceValues[index] = [NSNull null];
        [sortedIndexes addObject:[NSNumber numberWithInteger:index + 1]];
    }
    return sortedIndexes;
}

#pragma mark - <LMReportViewDatasource>

- (NSInteger)numberOfRowsInReportView:(RSReportView *)reportView {
    return self.generalDatas.count;
}

- (NSInteger)numberOfColsInReportView:(RSReportView *)reportView {
    return [self.generalDatas.lastObject count];
}

- (RSGrid *)reportView:(RSReportView *)reportView gridAtIndexPath:(NSIndexPath *)indexPath {
    RSGrid *grid = self.generalDatas[indexPath.row][indexPath.col];
    return grid;
}

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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
