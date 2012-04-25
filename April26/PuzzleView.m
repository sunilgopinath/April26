//
//  View.m
//  Puzzle
//
//  Created by NYU User on 11/3/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "PuzzleView.h"
#import "TileView.h"

@implementation PuzzleView
@synthesize emptyRow;
@synthesize emptyCol;

- (id) initWithFrame: (CGRect) frame
{
	self = [super initWithFrame: frame];
	if (self) {
		// Initialization code
		self.backgroundColor = [UIColor whiteColor];
        
        //Put upper left corner of label in upper left corner of View.
		//Make label just big enough to hold the string.
        

        
		//Rows are numbered from top to bottom, starting at 0.
		//Columns are numbered from left to right, starting at 0.
		//The empty location is initially in the lower left corner.
		n = 3;
		emptyRow = n - 1;
		emptyCol = 0;
		margin = 1;
        NSUInteger randomMoves = 0;
        
        
		set = [NSArray arrayWithObjects:
               [[TileView alloc] initWithView: self row: 0 col: 0],
               [[TileView alloc] initWithView: self row: 0 col: 1],
               [[TileView alloc] initWithView: self row: 0 col: 2],
               
               [[TileView alloc] initWithView: self row: 1 col: 0],
               [[TileView alloc] initWithView: self row: 1 col: 1],
               [[TileView alloc] initWithView: self row: 1 col: 2],
               
               //Lower left corner is empty.
               [[TileView alloc] initWithView: self row: 2 col: 1],
               [[TileView alloc] initWithView: self row: 2 col: 2],
               nil
               ];
        
		for (TileView *tileView in set) {
			[self addSubview: tileView];
		}
        
		//Place origin of View at center of upper left TileView.
		//Assume that each TileView is the same size.
        
		TileView *tileView = [set objectAtIndex:0];
		CGSize tileSize = tileView.image.size;
		CGSize viewSize = self.bounds.size;
		CGFloat half = (n - 1) / 2;
        
		self.bounds = CGRectMake(
                                 half * (tileSize.width  + margin) - viewSize.width  / 2,
                                 half * (tileSize.height + margin) - viewSize.height / 2,
                                 viewSize.width,
                                 viewSize.height
                                 );
        for (int i = 0; i < 50; ++i) {
            randomMoves++;
            NSUInteger r = rand() % set.count;
            TileView *touch = [set objectAtIndex: r];
            [touch touchesBegan: nil withEvent: nil];
        }
        moveCount = 0;
        

        label = [[UILabel alloc] initWithFrame: CGRectMake(0, 40, 200, 500)];
        label.textColor = [UIColor blueColor];
		label.backgroundColor = [UIColor clearColor];
		label.font = [UIFont systemFontOfSize: 20];
		label.text = @"Moves: 0";
		[self addSubview: label];
	}
	return self;
}

//Place the TileView at the given row and column.

- (void) place: (TileView *) tileView atRow: (NSUInteger) row col: (NSUInteger) col;
{
	moveCount++;
    NSLog(@"user has made %d moves", moveCount);
    if(moveCount > 20) {
        label.text = [NSString stringWithFormat: @"Seriously?"];        
    }
    sleep(2);
    label.text = [NSString stringWithFormat: @"Moves: %u", moveCount];
    
    CGSize size = tileView.bounds.size;
    
	tileView.center = CGPointMake(
                                  col * (size.width  + margin),
                                  row * (size.height + margin)
                                  );
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void) drawRect: (CGRect) rect
 {
 // Drawing code
 }
 */

@end
