//
//  AppDelegate.m
//  TableViewMultiSelection
//
//  Created by Tà Truhoada on 10/26/15.
//  Copyright © 2015 Hoang Dang Trung. All rights reserved.
//

#import "AppDelegate.h"
#import "RegistrationVC.h"
#import "HomeVC.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    UIStoryboard *mainStoryBoard=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    RegistrationVC *registrationVC = [mainStoryBoard instantiateViewControllerWithIdentifier:@"registrationVC"];
    UINavigationController *navController=[[UINavigationController alloc] initWithRootViewController:registrationVC];
   // HomeVC *homeVC = [mainStoryBoard instantiateViewControllerWithIdentifier:@"homeVC"];
    
    self.window.rootViewController = navController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (UIViewController *)viewControllerWithIndentifier:(NSString *)identifier
{
    return [_storyboard instantiateViewControllerWithIdentifier:identifier];
}
//- (void)checkAccountLogin
//{
//    BOOL *account =nil;
//    if (!account) {
//        self.window.rootViewController = [self viewControllerWithIndentifier:@"RegistrationVC"];
//    }
//    else {
//        self.window.rootViewController = [self viewControllerWithIndentifier:@"HomeVC"];
//    }
//    BOOL success = YES;
//    NSString *segueId = success ? @"HomeVC" : @"RegistrationVC";
//    [self.window.rootViewController performSegueWithIdentifier:segueId sender:self];
//}
@end
