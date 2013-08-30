//
//  JoyhubAPI.h
//  JoyhubAPI
//
//  Created by Kim hyunjo on 12. 9. 6..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define __PPI_FOR_IOS__
#ifdef __PPI_FOR_IOS__
    #import <sqlite3.h>
#endif

#ifdef __PPI_READ_ADDRESS_BOOK__
    #import <AddressBook/AddressBook.h>
#endif

#define BASE_URL @"http://www.joyhub.org/JoyHubMobile"

@class PPIApp;
@class JoyhubInitConnection;
@class JoyhubSendscoreConnection;
@class JoyhubConsumePointConnection;
@class JoyhubSendAchievementConnection;
@class JoyhubUpdatePPIAppInfoConnection;
@class JoyhubNotifyInstalledAppConnection;

@interface JoyhubAPI : NSObject<NSXMLParserDelegate>
{
    NSString* strUDID;
    NSString* strC2DM;
    NSString* strOS;
    NSString* strUserPackagename;
    
    NSString* strMainURL;
    NSString* strInitURL;
    NSString* strRankingURL;
    NSString* strShopURL;
    NSString* strToappURL;
    NSString* strSettingURL;
    NSString* strFamilyURL;
    
    NSString* strInfoUpdateDate;
    NSString* strXmlData;
    NSDictionary *pListJoyhubData;
    NSMutableArray *arrayPPIApps;
    PPIApp* aPPIApp;
    
    JoyhubInitConnection *initConnectionDelegate;
    JoyhubSendscoreConnection *sendscoreConectionDelegate;
    JoyhubConsumePointConnection *consumePointConnectionDelegate;
    JoyhubSendAchievementConnection *sendAchievementConnectionDelegate;
    JoyhubUpdatePPIAppInfoConnection *updatePPIAppInfoConnectionDelegate;
    JoyhubNotifyInstalledAppConnection *notifyInstalledAppConnectionDelegate;
}

@property (nonatomic, retain) NSString* strUDID;
@property (nonatomic, retain) NSString* strC2DM;
@property (nonatomic, retain) NSString* strOS;
@property (nonatomic, retain) NSString* strUserPackagename;
@property (nonatomic, retain) NSString* strMainURL;
@property (nonatomic, retain) NSString* strInitURL;
@property (nonatomic, retain) NSString* strRankingURL;
@property (nonatomic, retain) NSString* strShopURL;
@property (nonatomic, retain) NSString* strToappURL;
@property (nonatomic, retain) NSString* strSettingURL;
@property (nonatomic, retain) NSString* strFamilyURL;
@property (nonatomic, retain) NSString* strInfoUpdateDate;
@property (nonatomic, retain) NSString* strXmlData;
@property (nonatomic, retain) NSDictionary *pListJoyhubData;
@property (nonatomic, retain) NSMutableArray *arrayPPIApps;

- (void)InitAPI;
- (void)OnUpdatePPIAppFinish;
- (NSString*) GetUDID;
- (NSString*) GetC2DM;
- (NSString*) GetOS;
- (NSString*) GetUserPackagename;

- (NSString*) GetMainURL;
- (NSString*) GetRankingURL;
- (NSString*) GetShopURL;
- (NSString*) GetFamilyURL;
- (NSString*) GetToAppURL;
- (NSString*) GetToSettingURL;

- (NSString*) GetInfoUpdateDate;
- (NSString*) GetXmlData;
- (NSString*) GetDBPath;

- (NSString*) GetUserID;

#ifdef __PPI_FOR_IOS__
- (void)GetPPIDataFromSQLite;
- (void)UpdatePPIDataToSQLite;
- (BOOL) ProcessUpdatePPIAppInfo;
- (void) CheckInstalledApps;
#endif

#ifdef __PPI_READ_ADDRESS_BOOK__
- (void)copyDatabase;
- (void)ReadAddressBook;
- (void)ReadAddressBookRunner;
#endif


- (BOOL) ProcessRequestInit;
- (BOOL) SendGameScore:(int)score;
- (void) SendAchievement:(int)aid;
- (NSInteger) GetUserPoint;
- (void)ConsumeUserPoint:(int)score;

@end
