//
//  HowToViewController.m
//  iOS_phonecasePrincess
//
//  Created by Chris Kim on 13. 8. 30..
//  Copyright (c) 2013년 aurumplanet. All rights reserved.
//

#import "HowToViewController.h"

@interface HowToViewController ()

@end

@implementation HowToViewController
@synthesize howtoWebView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSURL *myURL = [NSURL URLWithString:@"http://210.122.2.49/~phonecasefree/howto/"];
	NSURLRequest *myURLReq = [NSURLRequest requestWithURL:myURL];
    [howtoWebView loadRequest:myURLReq];
    howtoWebView.opaque = NO;
    howtoWebView.backgroundColor = [UIColor clearColor];
    
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

@end
