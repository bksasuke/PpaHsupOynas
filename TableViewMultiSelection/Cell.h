//
//  Cell.h
//  test
//
//  Created by suke on 1/26/16.
//  Copyright © 2016 suke. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Cell : UITableViewCell

@property (strong, nonatomic) IBOutlet UITextField *txtBirthday;
@property (weak, nonatomic) IBOutlet UIButton *btnBoy;
@property (weak, nonatomic) IBOutlet UIButton *btnGirl;
@property (weak, nonatomic) IBOutlet UIButton *btnNotSure;
@end
