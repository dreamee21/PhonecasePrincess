//
//  JoyHubViewController.m
//  iOS_phonecasePrincess
//
//  Created by Jehyeok on 6/26/13.
//  Copyright (c) 2013 aurumplanet. All rights reserved.
//

#import "JoyHubViewController.h"

@interface JoyHubViewController ()

@end

@implementation JoyHubViewController

@synthesize joyHubWebViewController, joyhub;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.png"]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    joyhub = [[JoyhubAPI alloc] init];
//    [joyhub InitAPI];
//    
//    self.joyHubWebViewController = [[JoyHubWebViewController alloc] initWithNibName:@"JoyHubWebViewController" bundle:nil];
//    
//    [joyHubWebViewController setMainURL:[joyhub GetMainURL]];
//    [joyHubWebViewController setShopURL:[joyhub GetShopURL]];
//    [joyHubWebViewController setSettingURL:[joyhub GetToSettingURL]];
//    [joyHubWebViewController setFamilyURL:[joyhub GetFamilyURL]];
//    
//    CGRect theFrame = joyHubWebViewController.view.frame;
//    theFrame.origin = CGPointMake(self.view.frame.size.width, 0);
//    joyHubWebViewController.view.frame = theFrame;
//    theFrame.origin = CGPointMake(0,0);
//    [UIView beginAnimations:nil context:nil];
//    [UIView setAnimationDuration:0.8f]; joyHubWebViewController.view.frame = theFrame;
//    [UIView commitAnimations];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backBtn:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)joyhubBtn:(id)sender
{
    [self.view addSubview:joyHubWebViewController.view];
    [joyHubWebViewController.view setHidden: NO];
    [joyHubWebViewController ShowShopURL];
}
@end
