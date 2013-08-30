//
//  JoyHubWebViewController.h
//  JoyHubWeb
//
//  Created by Windev Studio on 3/16/12.
//  Copyright (c) 2012 KDML. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFProgressHud.h"

@interface JoyHubWebViewController : UIViewController<UIWebViewDelegate,UIAlertViewDelegate,UITabBarDelegate>{
    IBOutlet UIWebView* _webView;
    IBOutlet UITabBar* _tabbar;
    
    IBOutlet UIView* m_naviView;
    IBOutlet UIImageView* _navigationBackground;
    IBOutlet UIButton* m_btnRefresh;
    IBOutlet UIButton* m_btnBack;
    IBOutlet UIButton* m_btnToApp;
    IBOutlet UIButton* m_naviBlockView;
    
    AFProgressHud *progressHud;
    
    NSString* strMainURL;
    NSString* strShopURL;
    NSString* strToAppURL;
    NSString* strSettingURL;
    NSString* strAppProfileURL;
    
    id anCallbackObject;
    SEL anCallbackSelector;
}

-(void)setMainURL:(NSString*) strValue;
-(void)setShopURL:(NSString*) strValue;
-(void)setSettingURL:(NSString*) strValue;
-(void)setAppProfileURL:(NSString*) strValue;
-(void)setFamilyURL:(NSString*) strValue;

-(void)ShowMainURL;
-(void)ShowShopURL;
-(void)ShowAppProfileURL;

-(void)setCallbackObject:(id)anObject withSelector:(SEL)selector;

@property (nonatomic,retain) IBOutlet UIWebView *_webView;
@property (nonatomic,retain) IBOutlet UITabBar* _tabbar;

@property (nonatomic,retain) IBOutlet UIView* m_naviView;

@property (nonatomic,retain) IBOutlet UIImageView* _navigationBackground;
@property (nonatomic,retain) IBOutlet UIButton* m_btnRefresh;
@property (nonatomic,retain) IBOutlet UIButton* m_btnBack;
@property (nonatomic,retain) IBOutlet UIButton* m_btnToApp;
@property (nonatomic,retain) IBOutlet UIButton* m_naviBlockView;

-(IBAction)onBtnBackClicked;
-(IBAction)onBtnRefreshClicked;
-(IBAction)onBtnShopClicked;
-(IBAction)onBtnMainClicked;
-(IBAction)onBtnToappClicked;
-(IBAction)onBtnSettingClicked;
-(IBAction)onJoyhubFamilyClicked;

-(IBAction)onNaviBtnBackClicked;
-(IBAction)onNaviBtnRefreshClicked;
-(IBAction)onNaviBtnToAppClicked;
-(IBAction)onnaviBlockViewClicked;

@end