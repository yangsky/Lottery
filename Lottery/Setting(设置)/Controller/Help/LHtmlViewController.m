//
//  LHtmlViewController.m
//  Lottery
//
//  Created by Yang Shengyuan on 15-3-11.
//  Copyright (c) 2015年 Yang Shengyuan. All rights reserved.
//

#import "LHtmlViewController.h"
#import "LHtmlPage.h"
@interface LHtmlViewController () <UIWebViewDelegate>
{
    UIWebView *_webView;
}
@end

@implementation LHtmlViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1、设置标题
    self.title = _htmlPage.title;
    
    
    //2、设置网页
    NSURL *url = [[NSBundle mainBundle] URLForResource:_htmlPage.html withExtension:nil];
    [_webView loadRequest:[NSURLRequest requestWithURL:url]];
    
    //3、设置关闭
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonItemStyleBordered target:self action:@selector(close)];
    
    
}

-(void)close
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadView
{
    _webView = [[UIWebView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
    _webView.delegate = self;
    self.view = _webView;
}

#pragma mark - UIWebViewDelegate方法

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    // 移出圈圈
    if (_htmlPage.ID) {
        NSString *js = [NSString stringWithFormat:@"window.location.href = '#%@';", _htmlPage.ID];
        [webView stringByEvaluatingJavaScriptFromString:js];
    }
}

-(void)webViewDidStartLoad:(UIWebView *)webView
{
#warning 待写。。
    //加载缓冲圈圈
}

@end
