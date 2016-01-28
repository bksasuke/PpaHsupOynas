//
//  TermsOfUseVC.m
//  SanyoPush
//
//  Created by suke on 1/22/16.
//  Copyright © 2016 Tung Dao. All rights reserved.
//

#import "TermsOfUseVC.h"
#import "iOSRequest.h"
@interface TermsOfUseVC () <UINavigationControllerDelegate>

//@property(nonatomic, weak)IBOutlet UIButton *backButton;
@end

@implementation TermsOfUseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.webView setBackgroundColor:[UIColor clearColor]];
    [self loadWebView];
    [self.navigationController setNavigationBarHidden:YES];
}
- (void)loadWebView
{
    NSMutableURLRequest * request =[NSMutableURLRequest
                                    requestWithURL:[NSURL URLWithString:@"http://mistral-design.net/test/onod//"]];
    [self.webView loadRequest:request];
}
- (IBAction)onBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
    [self.navigationController setNavigationBarHidden:NO];
}



@end
