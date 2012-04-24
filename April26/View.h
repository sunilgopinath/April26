//
//  View.h
//  April26
//
//  Created by Sunil Gopinath on 4/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface View : UIView {
    NSUInteger tapCount;	//1 for single tap, 2 for double, 0 for no tap
	NSTimeInterval delay; 	//after this number of seconds, a tap wears off
    UILabel *label;
}

@end
