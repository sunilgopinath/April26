//
//  ButtonView.m
//  April26
//
//  Created by Sunil Gopinath on 4/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ButtonView.h"

@implementation ButtonView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
		self.backgroundColor = [UIColor whiteColor];
		button = [UIButton buttonWithType: UIButtonTypeRoundedRect];
        
        //we need to call the app delegate to use the sound id
        appDelegate = (April26AppDelegate *)[[UIApplication sharedApplication] delegate];
        
		//Center the button in the view.
		CGRect b = self.bounds;
        NSString *string = @"Short";
        
        //create golden rectangle dimensions
        CGFloat side = 100;
        CGSize size = CGSizeMake(((1 + sqrt(5))/2)*side, side);	//size of button
		button.frame = CGRectMake(
                                  b.origin.x + (b.size.width - size.width) / 2,
                                  b.origin.y + (b.size.height - size.height) / 2,
                                  size.width,
                                  size.height
                                  );
        
		[button setTitleColor: [UIColor cyanColor] forState: UIControlStateDisabled]; 
        [button setTitleColor: [UIColor redColor] forState: UIControlStateNormal];
        [button setTitle: string forState: UIControlStateNormal];
		[button addTarget: self
                   action: @selector(touchUpInside:)
         forControlEvents: UIControlEventTouchUpInside
         ];
        
		[self addSubview: button];
    }
    return self;
}

- (void) touchUpInside: (id) sender {
	//The sender is the button that was pressed.
    
	NSLog(@"The \"%@\" button was pressed.",
		  [sender titleForState: UIControlStateNormal]);
    
    AudioServicesAddSystemSoundCompletion(
                                          appDelegate->chineseSID, NULL, NULL, complete,
                                          (__bridge void *)((UIButton *)sender));

	//udioServicesPlaySystemSound(kSystemSoundID_Vibrate);
	AudioServicesPlaySystemSound((appDelegate->chineseSID));
    ((UIButton *)sender).enabled = NO;

}
 
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

static void complete(SystemSoundID sid, void *p)
{
	UIButton *button = (__bridge UIButton *)p;
	button.enabled = YES;
}
@end
