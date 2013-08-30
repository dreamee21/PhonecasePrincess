//
//  JoyhubConsumePointConnection.h
//  JoyhubAPI
//
//  Created by Kimhyunjo on 12. 10. 4..
//
//

#import <Foundation/Foundation.h>

@interface JoyhubConsumePointConnection : NSObject<NSURLConnectionDelegate>
{
    NSMutableData* responseData;
}

@property (nonatomic, retain) NSMutableData* responseData;

@end
