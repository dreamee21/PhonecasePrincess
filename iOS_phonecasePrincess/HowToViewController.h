//
//  HowToViewController.h
//  iOS_phonecasePrincess
//
//  Created by Chris Kim on 13. 8. 30..
//  Copyright (c) 2013년 aurumplanet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HowToViewController : UIViewController
@property (nonatomic, weak) IBOutlet UIWebView *howtoWebView;
- (IBAction)backBtn:(id)sender;
@end
