//
//  April26AppDelegate.h
//  April26
//
//  Created by Sunil Gopinath on 4/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class View;
@class PuzzleView;

@interface April26AppDelegate : UIResponder <UIApplicationDelegate> {
	View *view;
    PuzzleView *puzzleView;
	UIWindow *_window;
}


@property (strong, nonatomic) UIWindow *window;

@end
