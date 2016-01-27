//
//  TableViewController.m
//  TableViewMultiSelection
//
//  Created by Tà Truhoada on 10/26/15.
//  Copyright © 2015 Hoang Dang Trung. All rights reserved.
//

#import "RegistrationVC.h"
#import "Person.h"
#import "Cell.h"

@interface RegistrationVC ()
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
}
- (void) onAdd {
    Person *personData = [[Person alloc] init];
    [arrayData addObject:personData];
    
    [self.tableView reloadData];
}
- (IBAction)onAddd:(id)sender {
    Person *personData = [[Person alloc] init];
    [arrayData addObject:personData];
    
    [self.tableView reloadData];
}

- (void) onEdit {
    if (self.tableView.editing) {
        [self.tableView setEditing:false animated:YES];
        self.navigationItem.leftBarButtonItem =
        [[UIBarButtonItem alloc] initWithTitle:@"Edit"
                                         style:UIBarButtonItemStylePlain
                                        target:self
                                        action:@selector(onEdit)];
    } else {
        
        [self.tableView setEditing:true animated:YES];
        self.navigationItem.rightBarButtonItem =
        [[UIBarButtonItem alloc] initWithTitle:@"Delete"
                                         style:UIBarButtonItemStylePlain
                                        target:self
                                        action:@selector(onDelete)];
        self.navigationItem.leftBarButtonItem =
        [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                         style:UIBarButtonItemStylePlain
                                        target:self
                                        action:@selector(onEdit)];
    }
}
-(UIView *) tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    static NSString *CellIdentifier = @"SectionFooter";
    UITableViewCell *headerView = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (headerView == nil){
        [NSException raise:@"headerView == nil.." format:@"No cells with matching CellIdentifier loaded from your storyboard"];
    }
    return headerView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 150;}

- (void) onDelete {
    NSArray *selectedRows;
    selectedRows = self.tableView.indexPathsForSelectedRows;
    if (selectedRows.count > 0) {
        NSMutableIndexSet *indicesOfItemsToDelete = [[NSMutableIndexSet alloc] init];
        for (NSIndexPath *selectedIndex in selectedRows) {
            [indicesOfItemsToDelete addIndex: selectedIndex.row];
        }
        [arrayData removeObjectsAtIndexes:indicesOfItemsToDelete];
        [self.tableView deleteRowsAtIndexPaths:selectedRows withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

#pragma mark - Table view data source

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

@end














