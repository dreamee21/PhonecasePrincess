//
//  AFProgressHud.h
//  RealWallpaper
//
//  Created by Windev on 10. 10. 15..
//  Copyright 2010 KDML. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AFProgressHud : UIView {
	UIActivityIndicatorView *activityIndicator;
	UIImageView *square;
	UILabel *sentenceLabel;

}
- (void)initIndicator;
- (void)startHud;
- (void)stopHud;
@end
