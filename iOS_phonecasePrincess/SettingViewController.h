//
//  SettingViewController.h
//  iOS_phonecasePrincess
//
//  Created by Jehyeok on 6/26/13.
//  Copyright (c) 2013 aurumplanet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NoticeViewController.h"
#import "HowToViewController.h"

@interface SettingViewController : UIViewController
{
    NoticeViewController* noticeViewController;
}
@property (strong, nonatomic) NoticeViewController* noticeViewController;
@property (strong, nonatomic) HowToViewController* howtoViewController;

- (IBAction)noticeBtn:(id)sender;
- (IBAction)howtoBtn:(id)sender;
- (IBAction)contactBtn:(id)sender;
@end
