//
//  JoyhubUpdatePPIAppInfoConnection.h
//  JoyhubAPI
//
//  Created by Kimhyunjo on 12. 10. 16..
//
//

#import <Foundation/Foundation.h>

@interface JoyhubUpdatePPIAppInfoConnection : NSObject<NSURLConnectionDelegate>
{
    NSMutableData* responseData;
    
    id anCallbackObject;
    SEL anCallbackSelector;
}

@property (nonatomic, retain) NSMutableData* responseData;

-(void)setCallbackObject:(id)anObject withSelector:(SEL)selector;

@end
