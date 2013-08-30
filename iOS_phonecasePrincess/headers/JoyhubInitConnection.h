//
//  JoyhubInitConnection.h
//  JoyhubAPI
//
//  Created by Kim hyunjo on 12. 10. 4..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JoyhubInitConnection : NSObject<NSURLConnectionDelegate>
{
    NSMutableData* responseData;
}

@property (nonatomic, retain) NSMutableData* responseData;

@end
