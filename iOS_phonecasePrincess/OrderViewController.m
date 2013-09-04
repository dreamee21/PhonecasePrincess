//
//  OrderViewController.m
//  iOS_phonecasePrincess
//
//  Created by Jehyeok on 6/5/13.
//  Copyright (c) 2013 aurumplanet. All rights reserved.
//

#import "OrderViewController.h"

@interface OrderViewController ()

@end

@implementation OrderViewController

@synthesize photoImage, photoImageView;
@synthesize customerInfo;
@synthesize orderInfo;
@synthesize address, data_for_network;
@synthesize itemList, currentValue;
@synthesize fromName, fromPhoneNum1, fromPhoneNum2, fromPhoneNum3, toName, toPhoneNum1, toPhoneNum2, toPhoneNum3;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:@"OrderViewController" bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        xmlParseData = [[NSMutableArray alloc] init];
        xmlValue = [[NSMutableString alloc] init];
        currectItem = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    customerInfo.layer.cornerRadius = 10;
    
    UIScrollView *sc = orderInfo;
    sc.contentSize = ((UIView*)[sc.subviews objectAtIndex:0]).bounds.size;
    
    UITapGestureRecognizer *hideKeyBoardRecognizer =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(hideKeyBoard:)];
    [self.view addGestureRecognizer:hideKeyBoardRecognizer];
    [photoImageView initWithImage:photoImage];
}

- (void)hideKeyBoard:(UITapGestureRecognizer *)recognizer
{
    [self.view endEditing:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onCopyInfoBtn:(id)sender
{
    [toName setText:[fromName text]];
    [toPhoneNum1 setText:[fromPhoneNum1 text]];
    [toPhoneNum2 setText:[fromPhoneNum2 text]];
    [toPhoneNum3 setText:[fromPhoneNum3 text]];
}

- (IBAction)backBtn:(id)sender
{
//    [self dismissViewControllerAnimated:YES completion:nil];
    [self.view removeFromSuperview];
}

- (IBAction)onAddressBtn:(UITextField *)sender
{
    if(!([self.address.text isEqual: @""] || self.address.text==nil))
    {
        NSString* strURL = @"http://biz.epost.go.kr/KpostPortal/openapied?regkey=861394877e6c97c4e1346297408364&target=post&query=";
        
        NSString *queryString = [self.address.text stringByAddingPercentEscapesUsingEncoding:-2147481280];
        
        
        NSURL *url = [NSURL URLWithString:[strURL stringByAppendingString:queryString]];
        
        NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
        
        
        [theRequest setValue:@"ko" forHTTPHeaderField:@"accept-language"];
        
        self.data_for_network=nil;
        
        [NSURLConnection connectionWithRequest:theRequest delegate:self];
        
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"입력창확인" message:@"입력창이 비었습니다." delegate:self cancelButtonTitle:@"확인" otherButtonTitles:nil, nil];
        [alert show];
    }    
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    if(!self.data_for_network)
    {
        self.data_for_network = [[NSMutableData alloc] init];
    }
    
    [self.data_for_network appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
//    NSString *str = [[NSString alloc] initWithData:self.data_for_network encoding:0x80000000 + kCFStringEncodingDOSKorean];
//    NSLog(@"%@",str);
    
    NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithData:self.data_for_network];
    
    [xmlParser setDelegate:self];
    [xmlParser parse];
}

- (void)parser:(NSXMLParser*)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    if([elementName isEqualToString:@"item"])
    {
        [xmlValue setString:@""];
        checkElement = none;
    }
    else if ([elementName isEqualToString:@"postcd"])
    {
        checkElement = postcd;
    }
    else if ([elementName isEqualToString:@"address"])
    {
        checkElement = addrCheck;
    }
}
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    if (checkElement == postcd)
    {
		[xmlValue setString:string];
        checkElement = none;
    }
    else if (checkElement == addrCheck)
    {
		[xmlValue appendString:string];
        checkElement = none;
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    if ([elementName isEqualToString:@"postcd"]) {
		[currectItem setValue:[NSString stringWithString:xmlValue] forKey:elementName];
    }
    else if ([elementName isEqualToString:@"address"]) {
        [currectItem setValue:[NSString stringWithString:xmlValue] forKey:elementName];
    }
    else if ([elementName isEqualToString:@"item"]) {
        [xmlParseData addObject:[NSDictionary dictionaryWithDictionary:currectItem]];
	}
}



- (void)parserDidEndDocument:(NSXMLParser *)parser
{
    NSMutableArray *addrList = [[NSMutableArray alloc] init];
    
    UIActionSheet *addrListActionSheet;
    addrListActionSheet.actionSheetStyle = UIActionSheetStyleAutomatic;
    
    addrListActionSheet = [[UIActionSheet alloc] initWithTitle:@"내 사진으로 폰케이스 만들기" delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil, nil];
    
    for ( int i = 0 ;i < xmlParseData.count; i++ ) {
        NSLog(@"%@", [NSString stringWithFormat:@"%@ %@",[[xmlParseData objectAtIndex:i] valueForKey:@"postcd"], [[xmlParseData objectAtIndex:i] valueForKey:@"address"]]);
        
        [addrList addObject:[NSString stringWithFormat:@"%@ %@",[[xmlParseData objectAtIndex:i] valueForKey:@"postcd"], [[xmlParseData objectAtIndex:i] valueForKey:@"address"]]];
        [addrListActionSheet addButtonWithTitle:[addrList objectAtIndex:i]];
    }
    
    [addrListActionSheet showFromRect:CGRectMake(0, 0, 320, 548) inView:self.view animated:YES];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
}

@end