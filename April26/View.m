//
//  View.m
//  April26
//
//  Created by Sunil Gopinath on 4/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "View.h"

@implementation View

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]
                                             initWithTarget: self action: @selector(handleSingle:)
                                             ];
        singleTap.numberOfTapsRequired = 1;
        
        UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc]
                                             initWithTarget: self action: @selector(handleDouble:)
                                             ];
        doubleTap.numberOfTapsRequired = 2;
        
        //Don't call handleSingle: until we know for sure
        //that this tap is not the first tap of a double tap.
        [singleTap requireGestureRecognizerToFail: doubleTap];
        
        delay = 2;
        [self addGestureRecognizer: singleTap];
        [self addGestureRecognizer: doubleTap];
        
        label = [[UILabel alloc] initWithFrame: self.bounds];
        label.font = [UIFont systemFontOfSize: self.bounds.size.height];
        label.textAlignment = UITextAlignmentCenter;
        [self wearOff];
        [self addSubview: label];

        
    }
    return self;
}


- (void) wearOff {
    label.text = @"0";
}


- (void) handleSingle: (UITapGestureRecognizer *) recognizer {
    label.text = @"1";
    [self performSelector: @selector(wearOff) withObject: nil afterDelay: delay];
}

- (void) handleDouble: (UITapGestureRecognizer *) recognizer {
    label.text = @"2";
    [self performSelector: @selector(wearOff) withObject: nil afterDelay: delay];
}

- (void) noTap {
    label.text = @"0";
}


- (void) singleTap {	//called when a single tap is received.
	tapCount = 1;
	[self setNeedsDisplay];
    
	//After a few seconds, the single tap wears off.
	[self performSelector: @selector(noTap) withObject: nil
               afterDelay: delay];
}

- (void) doubleTap {	//called when a double tap is received
	tapCount = 2;
	[self setNeedsDisplay];
	
	//After a few seconds, the double tap wears off.
	[self performSelector: @selector(noTap) withObject: nil
               afterDelay: delay];
}

- (void) tripleTap {
    tapCount = 3;
    [self setNeedsDisplay];
    
    [self performSelector: @selector(noTap) withObject:nil
               afterDelay:delay];
}


@end
