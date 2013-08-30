//
//  SettingViewController.m
//  iOS_phonecasePrincess
//
//  Created by Jehyeok on 6/26/13.
//  Copyright (c) 2013 aurumplanet. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()

@end

@implementation SettingViewController
@synthesize noticeViewController;
@synthesize howtoViewController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.png"]];
        self.noticeViewController = [[NoticeViewController alloc] initWithNibName:@"NoticeViewController" bundle:nil];
        self.howtoViewController = [[HowToViewController alloc] initWithNibName:@"HowToViewController" bundle:nil];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)noticeBtn:(id)sender
{
    noticeViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:noticeViewController animated:YES completion:nil];
}

-(IBAction)howtoBtn:(id)sender
{
    howtoViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:howtoViewController animated:YES completion:nil];
}

- (IBAction)contactBtn:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"mailto://contact@aurumplanet.com"]];
}
@end
