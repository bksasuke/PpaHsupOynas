//
//  WebViewController.m
//  SanyoPush
//
//  Created by suke on 1/25/16.
//  Copyright © 2016 Tung Dao. All rights reserved.
//

#import "WebViewController.h"

@implementation WebViewController
-(void) viewDidLoad {
    [super viewDidLoad];
    [self loadWebView];
    id scrollview = [_webView.subviews objectAtIndex:0];
    for (UIView *subview in [scrollview subviews])
        if ([subview isKindOfClass:[UIImageView class]])
            subview.hidden = YES;
    
}
- (void)loadWebView
{
    NSMutableURLRequest * request =[NSMutableURLRequest
                                    requestWithURL:[NSURL URLWithString:@"http://mistral-design.net/test/onod//"]];
    [self.webView loadRequest:request];
}
- (IBAction)onClickBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
