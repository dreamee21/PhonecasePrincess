//
//  JoyhubNotifyInstalledAppConnection.h
//  JoyhubAPI
//
//  Created by Kimhyunjo on 12. 10. 16..
//
//

#import <Foundation/Foundation.h>

@interface JoyhubNotifyInstalledAppConnection : NSObject<NSURLConnectionDelegate>
{
    NSMutableData* responseData;
}

@property (nonatomic, retain) NSMutableData* responseData;


@end
