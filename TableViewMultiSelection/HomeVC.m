//
//  HomeVC.m
//  OtherSanyoPushApp
//
//  Created by suke on 1/27/16.
//  Copyright © 2016 Hoang Dang Trung. All rights reserved.
//

#import "HomeVC.h"
#import "iOSRequest.h"
@interface HomeVC ()

@end

@implementation HomeVC
{
    NSArray *arrayDetails;
}

- (void)viewDidLoad {
    [super viewDidLoad];
     [self.navigationController setNavigationBarHidden:NO animated:YES];
}
- (void)searchSample
{
    NSString *keyword = @"tuanhung";
    arrayDetails = nil;
    [iOSRequest search:keyword onCompletion:^(NSDictionary *jsonData) {
        dispatch_async(dispatch_get_main_queue(), ^{
            arrayDetails = jsonData[@"items"];
            for (NSDictionary *item in arrayDetails) {
                NSDictionary *snippet = item[@"snippet"];
                // NSLog(@"%@",snippet[@"title"]);
            }
            [self.tableView reloadData];
        });
    }];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5; //arrayDetails.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 35.0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    NSDictionary *item = (NSDictionary *)[arrayDetails objectAtIndex:indexPath.row];
    NSDictionary *snippet = item[@"snippet"];
    cell.textLabel.text = @"子育て世代のお母さんの健診について";//[snippet objectForKey:@"title"];
    NSURL *urlImage = [NSURL URLWithString:snippet[@"thumbnails"][@"default"][@"url"]];
    //    NSData *dataImage = [NSData dataWithContentsOfURL:urlImage];
    //  cell.imageView.image = [UIImage imageWithData:dataImage];
    cell.detailTextLabel.text = @"16/01/2016";
    return cell;
}


@end
