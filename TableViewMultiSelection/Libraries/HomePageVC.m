//
//  HomePageVC.m
//  OtherSanyoPushApp
//
//  Created by suke on 1/28/16.
//  Copyright © 2016 Hoang Dang Trung. All rights reserved.
//

#import "HomePageVC.h"

@interface HomePageVC ()

@end

@implementation HomePageVC
{
    UIImageView *theLoadingImageView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    theLoadingImageView.image = [ UIImage imageNamed:@"background.png"];
    [self loadWebView];
    self.webView.backgroundColor = [UIColor clearColor];
  [self.navigationController setNavigationBarHidden:YES];
}
- (void)loadWebView
{
    NSMutableURLRequest * request =[NSMutableURLRequest
                                    requestWithURL:[NSURL URLWithString:@"http://mistral-design.net/test/onod//"]];
    [self.webView loadRequest:request];
}
-(void)webViewDidStartLoad:(UIWebView *)myWebView {
    NSLog(@"start");
    theLoadingImageView.hidden = NO;
}

-(void)webViewDidFinishLoad:(UIWebView *)myWebView {
    NSLog(@"finish");
    theLoadingImageView.hidden = YES;
}
- (IBAction)onBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
    [self.navigationController setNavigationBarHidden:NO];
}
@end


