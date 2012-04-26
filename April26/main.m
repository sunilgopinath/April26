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
		NSLog(@"home directory == \"%@\"\n\n", homeDirectory);
        
		NSFileManager *manager = [NSFileManager defaultManager];
		NSDirectoryEnumerator *e = [manager enumeratorAtPath: homeDirectory];
		NSString *name = nil;
        
		while ((name = [e nextObject]) != nil) {
			NSLog(@"%@", name);
			NSString *fullPathname = [homeDirectory stringByAppendingPathComponent: name];
			NSLog(@"%@", fullPathname);
            
			NSError *error = nil;
			NSDictionary *attributes =
            [manager attributesOfItemAtPath: fullPathname error: &error];
            
			if (error != nil) {
				NSLog(@"%@", error);
				continue;	//go on to the next file
			}
            
			NSEnumerator *e = [attributes keyEnumerator];
			NSString *key = nil;
            
            while ((key = [e nextObject]) != nil) {
                id attribute = [attributes objectForKey: key];
                
                if ([key isEqualToString: @"NSFilePosixPermissions"]) {
                    unsigned long permissions = [attribute unsignedLongValue];
                    NSLog(@"%@ %lo", key, permissions);
                } else {
                    NSLog(@"%@ %@", key, attribute);
                }
            }
            
			NSLog(@"---------------------------------------------");
		}        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([April26AppDelegate class]));
    }
}
