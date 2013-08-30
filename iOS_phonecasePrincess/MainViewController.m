//
//  MainViewController.m
//  iOS_phonecasePrincess
//
//  Created by Jehyeok on 6/25/13.
//  Copyright (c) 2013 aurumplanet. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

@synthesize tabBarBgView, contentView;
@synthesize homeButton, myButton, cameraButton, settingButton, discountButton;
@synthesize gridViewController, myOrderListViewController, makeCustomCaseViewController, settingViewController, joyHubViewController, iPhone5ViewController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self) {
        self.title = @"폰케이스 공짜로 주는 앱";
        self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
        
        gridViewController = [[GridViewController alloc] initWithNibName:@"GridViewController" bundle:nil];
        myOrderListViewController = [[MyOrderListViewController alloc] initWithNibName:@"MyOrderListViewController" bundle:nil];
        makeCustomCaseViewController = [[MakeCustomCaseViewController alloc] initWithNibName:@"MakeCustomCaseViewController" bundle:nil];
        settingViewController = [[SettingViewController alloc] initWithNibName:@"SettingViewController" bundle:nil];
        joyHubViewController = [[JoyHubViewController alloc] initWithNibName:@"JoyHubViewController" bundle:nil];
        iPhone5ViewController = [[IPhone5ViewController alloc] initWithNibName:@"IPhone5ViewController" bundle:nil];
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.contentView addSubview:gridViewController.view];
    [self.contentView addSubview:myOrderListViewController.view];
    [self.contentView addSubview:makeCustomCaseViewController.view];
    [self.contentView addSubview:settingViewController.view];
    
    // default view : grid view
    myOrderListViewController.view.hidden = YES;
    makeCustomCaseViewController.view.hidden = YES;
    settingViewController.view.hidden = YES;
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setButtonState:(UIButton *)sender
{
    self.homeButton.selected = NO;
    self.myButton.selected = NO;
    self.cameraButton.selected = NO;
    self.settingButton.selected = NO;
    self.discountButton.selected = NO;
    
    sender.selected = YES;
}

- (IBAction)buttonClicked:(UIButton*)sender
{
    
    if([sender isEqual:self.homeButton])
    {
        gridViewController.view.hidden = NO;
        myOrderListViewController.view.hidden = YES;
        makeCustomCaseViewController.view.hidden = YES;
        settingViewController.view.hidden = YES;
        [self setButtonState:sender];
    }
    else if([sender isEqual:self.myButton])
    {
        gridViewController.view.hidden = YES;
        myOrderListViewController.view.hidden = NO;
        makeCustomCaseViewController.view.hidden = YES;
        settingViewController.view.hidden = YES;
        [self setButtonState:sender];
    }
    else if([sender isEqual:self.cameraButton])
    {
        UIActionSheet *phoneListActionSheet;
        
        phoneListActionSheet = [[UIActionSheet alloc] initWithTitle:@"내 사진으로 폰케이스 만들기" delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:@"iPhone 5", @"iPhone 4/iPhone 4S", @"Galaxy S3", @"Galaxy Note 2", nil];
        
        [phoneListActionSheet showFromRect:CGRectMake(0, 0, 320, 548) inView:self.view animated:YES];

//        iPhone5ViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
//        [self presentViewController:iPhone5ViewController animated:YES completion:nil];
    }
    else if([sender isEqual:self.settingButton])
    {
        gridViewController.view.hidden = YES;
        myOrderListViewController.view.hidden = YES;
        makeCustomCaseViewController.view.hidden = YES;
        settingViewController.view.hidden = NO;
        [self setButtonState:sender];
    }
    else if([sender isEqual:self.discountButton])
    {
        joyHubViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
//        joyHubViewController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
//        joyHubViewController.modalTransitionStyle = UIModalTransitionStylePartialCurl;
        [self presentViewController:joyHubViewController animated:YES completion:nil];
    }
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex == 0) // user selects iPhone5
    {
        iPhone5ViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentViewController:iPhone5ViewController animated:YES completion:nil];
    }
    else if(buttonIndex == 1) // user selects iPhone4/iPhone4S
    {
        NSLog(@"iPhone4");
    }
    else if(buttonIndex == 2) // user selects Galaxy S3
    {
        NSLog(@"Gal 3");
    }
    else if(buttonIndex == 3)
    {
        NSLog(@"gal note2");
    }
}

@end
