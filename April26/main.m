//
//  main.m
//  April26
//
//  Created by Sunil Gopinath on 4/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "April26AppDelegate.h"

int main(int argc, char *argv[])
{
    @autoreleasepool {
        srand(time(NULL));
        
        NSMutableDictionary *d = [[NSMutableDictionary alloc] init]; //born empty
        [d setValue: @"deer, a female deer"      forKey: @"doe"];
        [d setValue: @"drop of golden sun"       forKey: @"ray"];
        [d setValue: @"name I call myself"       forKey: @"me"];
        [d setValue: @"long, long way to run"    forKey: @"far"];
        [d setValue: @"needle pulling thread"    forKey: @"sew"];
        [d setValue: @"note to follow sol"       forKey: @"la"];
        [d setValue: @"drink with jam and bread" forKey: @"ti"];
        //Do not add nil at the end.
        
		//The key is what you look up.
		NSString *key = @"me";
        
		NSLog(@"%@ is %@\n\n", key, [d objectForKey: key]);
        
		//Loop through all the keys,
		//not necessarily ion the order in which you inserted them.
		NSEnumerator *e = [d keyEnumerator];
        
		while ((key = [e nextObject]) != nil) {
			NSLog(@"%@, a %@", key, [d objectForKey: key]);
		}
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([April26AppDelegate class]));
    }
}
