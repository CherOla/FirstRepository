//
//  AppDelegate.m
//  ProjectForGit
//
//  Created by Оля Чернявская on 03.11.15.
//  Copyright © 2015 Оля Чернявская. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

{
    UIViewController *cont;
    NSLayoutConstraint *constraintOne;
    NSLayoutConstraint *constraintTwo;
    NSLayoutConstraint *constraintThree;
    NSLayoutConstraint *constraintFour;
    
    NSTimer *timer;
    
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    cont = [[UIViewController alloc] init];
    self.window.rootViewController = cont;
    
    [cont loadView];
    cont.view.backgroundColor = [UIColor whiteColor];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:0.1f
                                             target:self
                                           selector:@selector(onTick)
                                           userInfo:nil
                                            repeats:YES];
    UIView *first = [[UIView alloc]init];
    first.backgroundColor = [UIColor greenColor];
    first.translatesAutoresizingMaskIntoConstraints = NO;
    [cont.view addSubview:first];
    
    
    
    constraintOne = [NSLayoutConstraint constraintWithItem:first
                                                 attribute:NSLayoutAttributeWidth
                                                 relatedBy:NSLayoutRelationEqual
                                                    toItem:nil
                                                 attribute:NSLayoutAttributeNotAnAttribute
                                                multiplier:1.0f
                                                  constant:100];
    
    constraintTwo = [NSLayoutConstraint constraintWithItem:first
                                                 attribute:NSLayoutAttributeHeight
                                                 relatedBy:NSLayoutRelationEqual
                                                    toItem:nil
                                                 attribute:NSLayoutAttributeNotAnAttribute
                                                multiplier:1.0f
                                                  constant:100];
    
    constraintThree = [NSLayoutConstraint constraintWithItem:first
                                                   attribute:NSLayoutAttributeCenterX
                                                   relatedBy:NSLayoutRelationEqual
                                                      toItem:cont.view
                                                   attribute:NSLayoutAttributeCenterX
                                                  multiplier:1.0f
                                                    constant:0];
    
    constraintFour = [NSLayoutConstraint constraintWithItem:first
                                                  attribute:NSLayoutAttributeCenterY
                                                  relatedBy:NSLayoutRelationEqual
                                                     toItem:cont.view
                                                  attribute:NSLayoutAttributeCenterY
                                                 multiplier:1.0f
                                                   constant:0];
    
    
    
    [cont.view addConstraint:constraintOne];
    [cont.view addConstraint:constraintTwo];
    [cont.view addConstraint:constraintThree];
    [cont.view addConstraint:constraintFour];
    
    
    
    [self.window makeKeyAndVisible];
    
    
    return YES;
}

-(void)onTick
{
    constraintFour.constant+=5;
    if (constraintFour.constant == 100) {
        [timer invalidate];
    }
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
