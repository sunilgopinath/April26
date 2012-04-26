//
//  TileView.h
//  Puzzle
//
//  Created by NYU User on 11/3/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>	//needed for SystemSoundID
#import "April26AppDelegate.h"
@class PuzzleView;

@interface TileView: UIImageView {
	PuzzleView *view;
	NSUInteger row;	//current position of this tile
	NSUInteger col;
    SystemSoundID *sid;
    April26AppDelegate *appDelegate;

}

- (id) initWithView: (PuzzleView *) v row: (NSUInteger) r col: (NSUInteger) c;
@end
