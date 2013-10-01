//
//  AcntViewController.h
//  iOS_phonecasePrincess
//
//  Created by Jehyeok on 9/4/13.
//  Copyright (c) 2013 aurumplanet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AcntViewController : UIViewController<UIWebViewDelegate> {
    UIWebView *webView;
    NSMutableArray *mutableArr;
}

@property (strong, nonatomic) NSMutableArray *mutableArr;

-(void) callJavascript:(NSString*) bankpaycode bankpayvalue:(NSString*) bankpayvalue;

@end
