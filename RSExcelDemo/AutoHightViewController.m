//
//  AutoHightViewController.m
//  RSExcelDemo
//
//  Created by WhatsXie on 2017/7/21.
//  Copyright © 2017年 StevenXie. All rights reserved.
//

#import "AutoHightViewController.h"
#import "RSExcelFile.h"

@interface AutoHightViewController ()<RSeportViewDatasource>

@property (nonatomic, strong) RSReportView *reportView;

@end

@implementation AutoHightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.reportView = [[RSReportView alloc] init];
    self.reportView.datasource = self;
    self.reportView.style.autoFitHeight = YES;
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

#pragma mark - <LMReportViewDatasource>

- (NSInteger)numberOfRowsInReportView:(RSReportView *)reportView {
    return 10;
}

- (NSInteger)numberOfColsInReportView:(RSReportView *)reportView {
    return 10;
}

- (RSGrid *)reportView:(RSReportView *)reportView gridAtIndexPath:(NSIndexPath *)indexPath {
    RSGrid *grid = [[RSGrid alloc] init];
    NSString *baseString = [NSString stringWithFormat:@"%ld-%ld", indexPath.row, indexPath.col];
    NSMutableString *text = [NSMutableString stringWithString:baseString];
    for (NSInteger i = 0; i < indexPath.row; i++) {
        [text appendString:@"\n"];
        [text appendString:baseString];
    }
    grid.text = text;
    return grid;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
