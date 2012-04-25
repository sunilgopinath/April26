//
//  TileView.h
//  Puzzle
//
//  Created by NYU User on 11/3/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PuzzleView;

@interface TileView: UIImageView {
	PuzzleView *view;
	NSUInteger row;	//current position of this tile
	NSUInteger col;
}

- (id) initWithView: (PuzzleView *) v row: (NSUInteger) r col: (NSUInteger) c;
@end
