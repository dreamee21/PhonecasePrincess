//
//  ConfirmBuyingViewController.h
//  iOS_phonecasePrincess
//
//  Created by Jehyeok on 7/1/13.
//  Copyright (c) 2013 aurumplanet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderViewController.h"

@interface ConfirmBuyingViewController : UIViewController

@property (strong, nonatomic) OrderViewController *orderViewController;

- (IBAction)confirmBuying:(id)sender;
@end