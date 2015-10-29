//
//  HIDAppDelegate.m
//  CatenaxioIOS
//
//  Created by Hugo Izquierdo on 9/25/14.
//  Copyright (c) 2014 Hugo Izquierdo. All rights reserved.
//

#import "HIDAppDelegate.h"
#import "HIDPantallaPrincipal.h"
#import <Parse/Parse.h>

@implementation HIDAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    // Initialize Parse.
    [Parse setApplicationId:@"lRLIrMRNzpnlw3O9VaoucfqBEOe8JD2Py3vzAfaN"
                  clientKey:@"pyh7NMX2fIo18ripJooAAuZ9VG5HnI8qNOaDNd6G"];
    
    //controlador y UINavigation
    HIDPantallaPrincipal *controlador=[[HIDPantallaPrincipal alloc]init];
    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:controlador];
    self.window.rootViewController=nav;
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end