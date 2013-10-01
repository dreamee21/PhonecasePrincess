//
//  AcntViewController.m
//  iOS_phonecasePrincess
//
//  Created by Jehyeok on 9/4/13.
//  Copyright (c) 2013 aurumplanet. All rights reserved.
//

#import "AcntViewController.h"

@interface AcntViewController ()

@end

@implementation AcntViewController

@synthesize mutableArr;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];

//    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://testpay.kcp.co.kr/lds/smart_phone_linux_jsp/sample/acnt/order_acnt_app.jsp?AppUrl=KCPAcntSample://"]]];
    
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://210.122.2.49/~phonecasefree/payment/pages/acnt/order_acnt.php"]]];
    
    [self.view addSubview:webView];
    
    webView.delegate = self;
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Web 의 이벤트를 받아 금결원 앱을 호출하는 과정
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    NSURL *url = request.URL;
    NSString *urlstring = url.absoluteString;
    
    if ([urlstring isEqualToString:@"http://itunes.apple.com/kr/app/id398456030?mt=8"]) {
        [[UIApplication sharedApplication] openURL: [NSURL URLWithString:@"http://itunes.apple.com/kr/app/id398456030?mt=8"]];
    }
    
    // KCP Web -> App 호출 프로토콜 규약
    if ([urlstring hasPrefix:@"toApp:"]||[urlstring hasPrefix:@"toapp:"]) {
        NSArray *processArray = [urlstring componentsSeparatedByString:@":"];
        NSString *function = (NSString *)[processArray objectAtIndex:1];
        if ([@"launchAcnt" isEqualToString:function] == YES)
        {
            NSString *param = (NSString *)[processArray objectAtIndex:2];
            
            // 금결원 App 호출 파라미터 구성
            char tmpData[512]={0};
            sprintf(tmpData, "kftc-bankpay://eftpay?callbackfunc=KCPAcntSample://payResult?%s&", (char*)[param UTF8String]);
            //          sprintf(tmpData, "kftc-bankpay://eftpay?callbackfunc=KCPAcntSample://%s&", (char*)[param UTF8String]);
            
            // 금결원 App 이 UTF8 또는 EUC-KR 형태의 파라미터를 수신
            // 아래의 텍스트 변환은 앱간의 한글을 지원하기 위함
            NSString *nsData = [NSString stringWithUTF8String:tmpData];
            NSString *nsRequest = [[NSString alloc]initWithFormat:@"%@", [nsData stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
            
            BOOL isInstalled = [[UIApplication sharedApplication] openURL:[NSURL URLWithString:nsRequest]];
            if (!isInstalled) {
                // 설치 되어 있지 않습니다! 앱스토어로 안내...
                [[UIApplication sharedApplication] openURL: [NSURL URLWithString:@"http://itunes.apple.com/kr/app/id398456030?mt=8"]];
            }       
            return NO;
        }
    }
    return YES;
}


-(void) callJavascript:(NSString*) bankpaycode bankpayvalue:(NSString*) bankpayvalue
{
    // KCP Javascript 에 금결원으로부터 받은 결과값 전달
    NSString *javascript = [[NSString alloc]initWithFormat:@"KCP_App_script('%@', '%@')", bankpaycode, bankpayvalue];
    
    // KCP javascript 실행
    [webView stringByEvaluatingJavaScriptFromString:javascript];
}

@end
