//
//  StyleViewController.m
//  RSExcelDemo
//
//  Created by WhatsXie on 2017/7/21.
//  Copyright © 2017年 StevenXie. All rights reserved.
//

#import "StyleViewController.h"
#import "RSExcelFile.h"
#import "RSStyle+DemoStyle.h"

@interface StyleViewController ()<RSeportViewDatasource>

@property (nonatomic, strong) RSReportView *reportView;
@property (nonatomic, assign) RSStyleType currentStyle;

@end

@implementation StyleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    RSStyle *style = [RSStyle blueStyle];
    
    self.reportView = [[RSReportView alloc] init];
    self.reportView.datasource = self;
    self.reportView.style = style;
    [self.view addSubview:self.reportView];
    
    self.currentStyle = RSStyleTypeBlue;
}
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    CGRect rect = self.view.bounds;
    rect = CGRectInset(rect, 16, 16);
    rect.origin.y += 60;
    rect.size.height -= 64;
    self.reportView.frame = rect;
}

- (IBAction)changeStyle:(id)sender {
    UIAlertAction *actionBlue = [UIAlertAction actionWithTitle:@"蓝色" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self setStyle:RSStyleTypeBlue];
    }];
    UIAlertAction *actionGreen = [UIAlertAction actionWithTitle:@"绿色" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self setStyle:RSStyleTypeGreen];
    }];
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"切换样式" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    [alert addAction:actionBlue];
    [alert addAction:actionGreen];
    [self.navigationController presentViewController:alert animated:YES completion:nil];
}

- (void)setStyle:(RSStyleType)style {
    if (self.currentStyle == style) {
        return;
    }
    self.reportView.style = style == RSStyleTypeBlue ? [RSStyle blueStyle] : [RSStyle greenStyle];
    self.currentStyle = style;
    [UIView animateWithDuration:0.5 animations:^{
        [self.reportView reloadData];
    }];
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

@end
