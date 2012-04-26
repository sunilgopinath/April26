//
//  IkeaDictionary.m
//  April26
//
//  Created by Sunil Gopinath on 4/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "IkeaView.h"

@implementation IkeaView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        textView = [[UITextView alloc] initWithFrame: self.bounds];
		textView.backgroundColor = [UIColor whiteColor];
		textView.textColor = [UIColor blackColor];
		textView.font = [UIFont fontWithName: @"Times New Roman" size: 15.75];
		textView.editable = NO;	//Don't pop up a keyboard.
        
        NSMutableDictionary *d = [[NSMutableDictionary alloc] init]; //born empty
        [d setValue: @"capable, children's toys"      forKey: @"duktig"];
        [d setValue: @"bed"       forKey: @"oslo"];
        [d setValue: @"shelf"       forKey: @"billy"];
        [d setValue: @"tableware"    forKey: @"dinera"];
        [d setValue: @"cassette"    forKey: @"kassett"];
        [d setValue: @"office furniture"       forKey: @"effectiv"];
        [d setValue: @"knives" forKey: @"SKÄRPT"];
        
        //The key is what you look up.
		NSString *key = @"me";

		//Loop through all the keys,
		//not necessarily ion the order in which you inserted them.
		NSEnumerator *e = [d keyEnumerator];
        textView.text = @"";
		while ((key = [e nextObject]) != nil) {
			textView.text = [textView.text stringByAppendingFormat: @"%@ => %@\n", key, [d objectForKey: key]];
            
		}
		
        [self addSubview:textView];
        
        NSString *string = @"Ikea dictionary";
		UIFont *font = [UIFont systemFontOfSize: 20];
		CGSize size = [string sizeWithFont: font];
        label = [[UILabel alloc] initWithFrame: CGRectMake(0, self.frame.size.height - 150, size.width, size.height)];
        label.textColor = [UIColor blueColor];
		label.backgroundColor = [UIColor clearColor];
		label.font = font;
		label.text = string;
		[self addSubview: label];
    }
    return self;
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
