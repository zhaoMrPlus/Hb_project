//
//  AppDelegate.m
//  Hb_Project
//
//  Created by 毛蛋 on 2019/3/1.
//  Copyright © 2019 zhb. All rights reserved.
//

#import "AppDelegate.h"
#import "KBTabbarController.h"
#import "UIColor+Factory.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window.backgroundColor=[UIColor whiteColor];
    [self changeNavigationBar];
    UINavigationController * nav=[[UINavigationController alloc] initWithRootViewController:[[KBTabbarController alloc]init]];
    self.window.rootViewController = nav;
    return YES;
}
- (void)changeNavigationBar
{
    //导航条字体颜色设置
    NSDictionary *navbarTitleTextAttributes =
    [NSDictionary dictionaryWithObjectsAndKeys:
     [UIColor blackColor], NSForegroundColorAttributeName,
     nil];
    [[UINavigationBar appearance] setTitleTextAttributes:navbarTitleTextAttributes];
    //导航条背景
    [[UINavigationBar appearance] setBarTintColor:UIColorFromRGB(0x2bdcff)];
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
