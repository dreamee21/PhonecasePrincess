//
//  PPIApp.h
//  iTorque2D
//
//  Created by Windev Studio on 5/11/12.
//  Copyright (c) 2012 KDML. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PPIApp : NSObject {
    NSString *packagename;
    NSInteger point;
}

@property (nonatomic, retain) NSString *packagename;
@property (nonatomic, readwrite) NSInteger point;

@end
