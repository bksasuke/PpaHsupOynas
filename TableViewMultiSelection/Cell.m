//
//  Cell.m
//  test
//
//  Created by suke on 1/26/16.
//  Copyright © 2016 suke. All rights reserved.
//

#import "Cell.h"

@implementation Cell

- (void)awakeFromNib {
    self.txtBirthday.delegate = self;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}
@end
