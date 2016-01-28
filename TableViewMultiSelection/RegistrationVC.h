//
//  TableViewController.h
//  TableViewMultiSelection
//
//  Created by Tà Truhoada on 10/26/15.
//  Copyright © 2015 Hoang Dang Trung. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegistrationVC : UITableViewController
@property (weak, nonatomic) IBOutlet UIButton *btnEnableNoti;
@property (weak, nonatomic) IBOutlet UIButton *btnDisableNoti;
@property (weak, nonatomic) IBOutlet UIButton *btnMale;
@property (weak, nonatomic) IBOutlet UIButton *btnFemale;
@property (weak, nonatomic) IBOutlet UIButton *btnPapa;
@property (weak, nonatomic) IBOutlet UILabel *btnMama;
@property (weak, nonatomic) IBOutlet UIButton *btnRelation;
@property (weak, nonatomic) IBOutlet UIButton *btnGrand;
@property (weak, nonatomic) IBOutlet UIButton *btnGrandMother;
@property (weak, nonatomic) IBOutlet UIButton *btnSingle;
@property (weak, nonatomic) IBOutlet UIButton *btnChildWDisability;
@property (weak, nonatomic) IBOutlet UIButton *btnToSAccept;
@property (weak, nonatomic) IBOutlet UITextField *txtBirthday;
@property (weak, nonatomic) IBOutlet UITextField *txtPostID;
@property (weak, nonatomic) IBOutlet UIButton *regBtn;

@end

