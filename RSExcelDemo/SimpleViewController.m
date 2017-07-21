//
//  SimpleViewController.m
//  RSExcelDemo
//
//  Created by WhatsXie on 2017/7/21.
//  Copyright © 2017年 StevenXie. All rights reserved.
//

#import "SimpleViewController.h"
#import "RSExcelFile.h"
@interface SimpleViewController ()<RSeportViewDatasource>
@property (nonatomic, strong)RSReportView *reportView;
@end

@implementation SimpleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.reportView = [[RSReportView alloc] init];
    self.reportView.datasource = self;
    [self.view addSubview:self.reportView];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    CGRect rect = self.view.bounds;
    rect = CGRectInset(rect, 16, 16);
    rect.origin.y += 60;
    rect.size.height -= 64;
    self.reportView.frame = rect;
    
    //    self.reportView.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64);
}

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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
