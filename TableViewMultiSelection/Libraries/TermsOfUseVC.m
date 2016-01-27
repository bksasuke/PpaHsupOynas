//
//  TermsOfUseVC.m
//  SanyoPush
//
//  Created by suke on 1/22/16.
//  Copyright © 2016 Tung Dao. All rights reserved.
//

#import "TermsOfUseVC.h"

@interface TermsOfUseVC () <UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextView *textView;

//@property(nonatomic, weak)IBOutlet UIButton *backButton;
@end

@implementation TermsOfUseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.textView.editable =NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)backAction:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
