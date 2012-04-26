//
//  ButtonView.h
//  April26
//
//  Created by Sunil Gopinath on 4/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>	//needed for SystemSoundID
#import "April26AppDelegate.h"

@interface ButtonView : UIView {
	UIButton *button;
    April26AppDelegate *appDelegate;
    SystemSoundID chineseSID;
}

@end
