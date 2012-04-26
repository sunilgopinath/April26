//
//  BigView.m
//  April26
//
//  Created by Sunil Gopinath on 4/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BigView.h"
#import "PuzzleView.h"
#import "View.h"
#import "EtchView.h"
#import "IkeaView.h"

@implementation BigView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        views = [NSArray arrayWithObjects:
                 [[View alloc] initWithFrame:self.bounds],
                 [[PuzzleView alloc] initWithFrame:self.bounds],
                 [[EtchView alloc] initWithFrame:self.bounds],
                 [[IkeaView alloc] initWithFrame:self.bounds],
                 nil
                 ];
        index = 0;
        [self addSubview:[views objectAtIndex:index]];
        
        // Create the swipe gesture recogniser for flipping between views
        UISwipeGestureRecognizer *recognizer = [[UISwipeGestureRecognizer alloc]
                                                initWithTarget: self action: @selector(swipe:)
                                                ];
		recognizer.direction = UISwipeGestureRecognizerDirectionRight;
		[self addGestureRecognizer: recognizer];
        
		recognizer = [[UISwipeGestureRecognizer alloc]
                      initWithTarget: self action: @selector(swipe:)
                      ];
		recognizer.direction = UISwipeGestureRecognizerDirectionLeft;
		[self addGestureRecognizer: recognizer];
        
		recognizer = [[UISwipeGestureRecognizer alloc]
                      initWithTarget: self action: @selector(swipe:)
                      ];
		recognizer.direction = UISwipeGestureRecognizerDirectionUp;
		[self addGestureRecognizer: recognizer];
        
		recognizer = [[UISwipeGestureRecognizer alloc]
                      initWithTarget: self action: @selector(swipe:)
                      ];
		recognizer.direction = UISwipeGestureRecognizerDirectionDown;
		[self addGestureRecognizer: recognizer];
        
        
    }
    return self;
}

- (void) swipe: (UISwipeGestureRecognizer *) recognizer {
	//CGPoint p = [recognizer locationInView: self];
    //NSString *direction = @"unknown";
	if (recognizer.direction == UISwipeGestureRecognizerDirectionRight) {
		NSLog(@"→");
        //toggle the index
        NSUInteger newIndex = index;
        if(index < views.count-1) {
            newIndex++;
        } else {
            newIndex = 0;
        }
        NSLog(@"index is %i and newIndex is %i", index, newIndex);
        [UIView transitionFromView: [views objectAtIndex: index]
                            toView: [views objectAtIndex: newIndex]
                          duration: 2.25
                           options: UIViewAnimationOptionTransitionFlipFromLeft
                        completion: NULL
         ];
        if(index < views.count-1) {
            index++;
        } else {
            index = 0;
        }
	} else if (recognizer.direction == UISwipeGestureRecognizerDirectionLeft) {
		NSLog(@"←");
        NSUInteger newIndex = index;
        if(index > 1) {
            newIndex--;
        } else {
            newIndex = views.count - 1;
        }
        NSLog(@"index is %i and newIndex is %i", index, newIndex);
        [UIView transitionFromView: [views objectAtIndex: index]
                            toView: [views objectAtIndex: newIndex]
                          duration: 2.25
                           options: UIViewAnimationOptionTransitionFlipFromRight
                        completion: NULL
         ];
        if(index > 1) {
            index--;
        } else {
            index = views.count - 1 ;
        }
	} else if (recognizer.direction == UISwipeGestureRecognizerDirectionUp) {
		NSLog(@"↑");
        [UIView transitionFromView: [views objectAtIndex: index]
                            toView: [views objectAtIndex: 0]
                          duration: 2.25
                           options: UIViewAnimationOptionTransitionFlipFromBottom
                        completion: NULL
         ];
        
	} else if (recognizer.direction == UISwipeGestureRecognizerDirectionDown) {
		NSLog(@"↓");
        [UIView transitionFromView: [views objectAtIndex: index]
                            toView: [views objectAtIndex: views.count-1]
                          duration: 2.25
                           options: UIViewAnimationOptionTransitionFlipFromLeft
                        completion: NULL
         ];
	}
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
