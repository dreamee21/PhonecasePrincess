//
//  JoyHubViewController.h
//  iOS_phonecasePrincess
//
//  Created by Jehyeok on 6/26/13.
//  Copyright (c) 2013 aurumplanet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JoyhubAPI.h"
#import "JoyHubWebViewController.h"

@interface JoyHubViewController : UIViewController
{
    JoyhubAPI *joyhub;
    JoyHubWebViewController *joyHubWebViewController;
}
@property (strong, nonatomic) JoyHubWebViewController *joyHubWebViewController;
@property (strong, nonatomic) JoyhubAPI *joyhub;

- (IBAction)backBtn:(id)sender;
- (IBAction)joyhubBtn:(id)sender;
@end