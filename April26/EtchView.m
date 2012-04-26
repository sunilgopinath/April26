//
//  EtchView.m
//  April26
//
//  Created by Sunil Gopinath on 4/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EtchView.h"

@implementation EtchView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        path = CGPathCreateMutable();
    }
    return self;
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    CGPoint p = [[touches anyObject] locationInView:self];
    CGPathMoveToPoint(path, NULL, p.x, p.y);
}

- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    CGPoint p = [[touches anyObject] locationInView: self];
    CGPathAddLineToPoint(path, NULL, p.x, p.y);
    [self setNeedsDisplay]; // this calls drawRect
}

- (void) clearPath {
    CGPathRelease(path); //clear the path
    path = CGPathCreateMutable();
    [self setNeedsDisplay]; //redraw the screen with the cleared path
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
 	CGContextRef c = UIGraphicsGetCurrentContext();
	CGContextBeginPath(c);
	CGContextAddPath(c, path);
	CGContextSetRGBStrokeColor(c, 0, 0, 0, 1);	//black
	CGContextStrokePath(c);
}


@end
