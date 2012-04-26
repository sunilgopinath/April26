//
//  April26AppDelegate.h
//  April26
//
//  Created by Sunil Gopinath on 4/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>	//needed for SystemSoundID

@class BigView;

@interface April26AppDelegate : UIResponder <UIApplicationDelegate> {

    BigView *bigView;
	UIWindow *_window;
    @public SystemSoundID sid;
    
}


@property (strong, nonatomic) UIWindow *window;

@end
