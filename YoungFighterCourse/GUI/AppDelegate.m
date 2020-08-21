//
//  AppDelegate.m
//  YoungFighterCourse
//
//  Created by Денис on 24.07.2020.
//  Copyright © 2020 cr0manty. All rights reserved.
//

#import "AppDelegate.h"
#import "Employee.h"
#import "Organization.h"
#import <SVProgressHUD/SVProgressHUD.h>

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [SVProgressHUD setDefaultMaskType: SVProgressHUDMaskTypeBlack];
    return true;
}

@end
