//
//  AppDelegate.h
//  TableViewMultiSelection
//
//  Created by Tà Truhoada on 10/26/15.
//  Copyright © 2015 Hoang Dang Trung. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) UIStoryboard *storyboard;
//@property (nonatomic, strong) UINavigationController *container;
- (UIViewController *)viewControllerWithIndentifier:(NSString *)identifier;

@end

