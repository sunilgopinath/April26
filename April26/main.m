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
        
		NSString *homeDirectory = NSHomeDirectory();
		NSLog(@"home directory == \"%@\"\n", homeDirectory);
        
		NSFileManager *manager = [NSFileManager defaultManager];
		NSDirectoryEnumerator *e = [manager enumeratorAtPath: homeDirectory];
		NSString *name = nil;
        
		while ((name = [e nextObject]) != nil) {
			NSLog(@"%@\n", name);
		}
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([April26AppDelegate class]));
    }
}
