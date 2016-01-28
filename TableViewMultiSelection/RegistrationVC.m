//
//  RegistrationVC.m
//  OtherSanyoPushApp
//
//  Created by suke on 1/26/16.
//  Copyright © 2015 Hoang Dang Trung. All rights reserved.
//

#import "RegistrationVC.h"
#import "Person.h"
#import "Cell.h"

@interface RegistrationVC () <UITextFieldDelegate>
@end

@implementation RegistrationVC {
    NSMutableArray *arrayData;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"Cell" bundle:nil] forCellReuseIdentifier:@"Cell"];
    arrayData = [[NSMutableArray alloc] initWithCapacity:1];
    for (int i=0; i<1; i++) {
        Person *personData = [[Person alloc] init];
        [arrayData addObject:personData];
    }
    self.tableView.allowsMultipleSelectionDuringEditing = YES;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"topBanner.jpg"] forBarMetrics:UIBarMetricsDefault];
    [self setUpSupplement];
    
    
}

#pragma mark - Edit tableView
- (IBAction)onAddd:(id)sender {
    Person *personData = [[Person alloc] init];
    [arrayData addObject:personData];
    
    [self.tableView reloadData];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}
-(void)setUpSupplement {
    self.txtBirthday.delegate = self;
    self.txtBirthday.delegate = self;
    self.txtPostID.delegate =   self;
}
#pragma mark - Table view data source
//-(UIView *) tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
//    static NSString *CellIdentifier = @"SectionFooter";
//    UIView *headerView = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    if (headerView == nil){
//        [NSException raise:@"headerView == nil.." format:@"No cells with matching CellIdentifier loaded from your storyboard"];
//    }
//    return headerView;
//}
//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
//    return 150;}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return arrayData.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Cell *cell = (Cell*)[tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    Person *personData = [[Person alloc] init];
    personData = arrayData[indexPath.row];
    cell.txtBirthday.delegate =self;
    return cell;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [arrayData removeObjectAtIndex:indexPath.row];
        [tableView reloadData];
    }
}

-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    Person *person = [Person new];
    person = arrayData[sourceIndexPath.row];
    [arrayData removeObjectAtIndex:sourceIndexPath.row];
    [arrayData insertObject:person atIndex:destinationIndexPath.row];
}

#pragma mark - Text and table up for rational
// Enable textfield up when neccessary
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField.frame.origin.y > 240) {
        [self animateTextField:textField up:YES];
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (textField.frame.origin.y > 240) {
        [self animateTextField:textField up:NO]; }
}

-(void)animateTextField:(UITextField*)textField up:(BOOL)up
{
    const int movementDistance = -130; // tweak as needed
    const float movementDuration = 0.3f; // tweak as needed
    
    int movement = (up ? movementDistance : -movementDistance);
    
    [UIView beginAnimations: @"animateTextField" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
}


@end














