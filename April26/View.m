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
        self.backgroundColor = [UIColor whiteColor];
		tapCount = 0;
		delay = 2;
        
        NSString *text = [NSString stringWithFormat: @"%u", tapCount];
        CGRect b = self.bounds;
        UIFont *font = [UIFont italicSystemFontOfSize: b.size.height/20];
        CGSize size = [text sizeWithFont: font];
        
		CGRect f = CGRectMake(
                              b.origin.x,
                              b.origin.y,
                              size.width + 30,
                              size.height
                              );
        
        label = [[UILabel alloc] initWithFrame: f];
        label.font = font;
        label.backgroundColor = [UIColor clearColor];
        label.textColor = [UIColor blueColor];
        label.text = text;
        [label setUserInteractionEnabled: YES];
        [self addSubview: label];

        
    }
    return self;
}

- (void) noTap {
    tapCount = 0;
    label.text = [NSString stringWithFormat: @"%u", tapCount];
    [self setNeedsDisplay];
}

- (void) singleTap {	//called when a single tap is received.
	tapCount = 1;
    label.text = @"1";
	[self setNeedsDisplay];
    
	//After a few seconds, the single tap wears off.
	[self performSelector: @selector(noTap) withObject: nil
               afterDelay: delay];
}

- (void) doubleTap {	//called when a double tap is received
	tapCount = 2;
    label.text = [NSString stringWithFormat: @"%u", tapCount];
	[self setNeedsDisplay];
	
	//After a few seconds, the double tap wears off.
	[self performSelector: @selector(noTap) withObject: nil
               afterDelay: delay];
}

- (void) tripleTap {
    tapCount = 3;
    label.text = [NSString stringWithFormat: @"%u", tapCount];
    [self setNeedsDisplay];
    
    [self performSelector: @selector(noTap) withObject:nil
               afterDelay:delay];
}

- (void) touchesEnded: (NSSet *) touches withEvent: (UIEvent *) event {	
	UITouch *touch = [touches anyObject];
    if([touch view] == label) {
        if (touch.tapCount == 1) {
            [self performSelector: @selector(singleTap) withObject: nil
                       afterDelay: 0.3];
        } else if (touch.tapCount == 2) {
            [self doubleTap];
        } else if (touch.tapCount == 3) {
            [self tripleTap];
        }
    }
}

- (void) touchesBegan: (NSSet *) touches withEvent: (UIEvent *) event {
	UITouch *touch = [touches anyObject];
    if([touch view] == label) {
        NSLog(@"touch me");
        if (touch.tapCount > 1) {
            [NSObject cancelPreviousPerformRequestsWithTarget: self];
        }
    }
    
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
 // Drawing code
 //NSString *string = [NSString stringWithFormat: @"%u", tapCount];
 //UIFont *font = [UIFont systemFontOfSize: 6 * 72];
 //CGSize size = [string sizeWithFont: font];
 
 //CGRect b = self.bounds;
 //CGFloat x = b.origin.x + (b.size.width - size.width) / 2;
 //CGFloat y = b.origin.y + (b.size.height - size.height) / 2;
 //[string drawAtPoint: CGPointMake(x, y) withFont: font];
}


@end
