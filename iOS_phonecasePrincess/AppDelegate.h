//
//  AppDelegate.h
//  iOS_phonecasePrincess
//
//  Created by Jehyeok on 5/24/13.
//  Copyright (c) 2013 aurumplanet. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "JoyhubAPI.h"
//#import "JoyHubWebViewController.h"
#import "JoyHubViewController.h"
#import "AcntViewController.h"

@class MainViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
//    JoyhubAPI *joyhub;
//    JoyHubWebViewController *joyHubWebViewController;
}

//@property (strong, nonatomic) JoyhubAPI *joyhub;

//@property (strong, nonatomic) JoyHubWebViewController *joyHubWebViewController;
@property (strong, nonatomic) JoyHubViewController *joyHubViewController;

@property (strong, nonatomic) IBOutlet UIWindow *window;

//@property (strong, nonatomic) ViewController *viewController;

@property (strong, nonatomic) MainViewController *mainViewController;

@property (strong, nonatomic) UINavigationController *navController;

@property (strong, nonatomic) AcntViewController *acntViewController;
@end
