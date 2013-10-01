//
//  OrderViewController.h
//  iOS_phonecasePrincess
//
//  Created by Jehyeok on 6/5/13.
//  Copyright (c) 2013 aurumplanet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "AcntViewController.h"

typedef enum {
    none = 0,
    postcd,
    addrCheck,
} check;

@interface OrderViewController : UIViewController <NSXMLParserDelegate, UIActionSheetDelegate>
{
    check checkElement;
    
    UITextField *address;
    NSMutableString *xmlValue;
    NSMutableArray *xmlParseData;
    NSMutableDictionary *currectItem;
    
    UILabel *productName;
    UILabel *cost;
    
    NSMutableArray *mutableArr;
    UITextField *fromName;
    UITextField *fromPhoneNum1;
    UITextField *fromPhoneNum2;
    UITextField *fromPhoneNum3;
    
    UITextField *toName;
    UITextField *toPhoneNum1;
    UITextField *toPhoneNum2;
    UITextField *toPhoneNum3;
    
    UITextField *addrNum;
    UITextField *addr;
    UITextField *addrDetail;
    UITextField *email;
    
    UIImage *photoImage;
    UIImageView *photoImageView;
}
@property (strong, nonatomic) AcntViewController *acntViewController;

@property (strong, nonatomic) UIImage *photoImage;
@property (strong, nonatomic) IBOutlet UIImageView *photoImageView;

@property (nonatomic, retain) IBOutlet UIView *customerInfo;
@property (nonatomic, retain) IBOutlet UIScrollView *orderInfo;

@property (strong, nonatomic) IBOutlet UITextField *address;

@property (strong, nonatomic) NSMutableArray *mutableArr;
@property (strong, nonatomic) IBOutlet UITextField *fromName;
@property (strong, nonatomic) IBOutlet UITextField *fromPhoneNum1;
@property (strong, nonatomic) IBOutlet UITextField *fromPhoneNum2;
@property (strong, nonatomic) IBOutlet UITextField *fromPhoneNum3;
@property (strong, nonatomic) IBOutlet UITextField *toName;
@property (strong, nonatomic) IBOutlet UITextField *toPhoneNum1;
@property (strong, nonatomic) IBOutlet UITextField *toPhoneNum2;
@property (strong, nonatomic) IBOutlet UITextField *toPhoneNum3;
@property (strong, nonatomic) IBOutlet UITextField *addrNum;
@property (strong, nonatomic) IBOutlet UITextField *addr;
@property (strong, nonatomic) IBOutlet UITextField *addrDetail;
@property (strong, nonatomic) IBOutlet UITextField *email;
@property (strong, nonatomic) IBOutlet UILabel *productName;
@property (strong, nonatomic) IBOutlet UILabel *cost;


@property NSMutableData *data_for_network;
@property (strong, nonatomic) NSMutableArray *itemList;
@property (strong, nonatomic) NSMutableString *currentValue;

- (void)postData;
- (IBAction)onCopyInfoBtn:(id)sender;
- (IBAction)backBtn:(id)sender;
- (IBAction)onAddressBtn:(UITextField*)sender;
- (IBAction)payBtn:(id)sender;

@end