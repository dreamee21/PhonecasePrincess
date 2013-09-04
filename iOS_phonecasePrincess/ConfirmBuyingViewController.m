//
//  ConfirmBuyingViewController.m
//  iOS_phonecasePrincess
//
//  Created by Jehyeok on 7/1/13.
//  Copyright (c) 2013 aurumplanet. All rights reserved.
//

#import "ConfirmBuyingViewController.h"

@interface ConfirmBuyingViewController ()

@end

@implementation ConfirmBuyingViewController
@synthesize orderViewController;
@synthesize photoImage;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UITapGestureRecognizer *singleFingerTap =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(handleSingleTap:)];
    UIPanGestureRecognizer *moveGesture =
    [[UIPanGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(handleMove:)];
    [self.view addGestureRecognizer:singleFingerTap];
    [self.view addGestureRecognizer:moveGesture];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer {
    [self.view removeFromSuperview];
}

- (void)handleMove:(UIPanGestureRecognizer *)recognizer {
    [self.view removeFromSuperview];
}
- (IBAction)confirmBuying:(id)sender
{
    orderViewController = [[OrderViewController alloc] initWithNibName:@"OrderViewController" bundle:nil];
    orderViewController.photoImage = photoImage;
    [self.view.superview addSubview:orderViewController.view];
    [self.view removeFromSuperview];
    
//    orderViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
//    [self presentViewController:orderViewController animated:YES completion:nil];
}
@end
