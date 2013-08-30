//
//  JoyhubSendAchievementConnection.h
//  JoyhubAPI
//
//  Created by Kimhyunjo on 12. 10. 4..
//
//

#import <Foundation/Foundation.h>

@interface JoyhubSendAchievementConnection : NSObject<NSURLConnectionDelegate>
{
    NSMutableData* responseData;
}

@property (nonatomic, retain) NSMutableData* responseData;


@end
