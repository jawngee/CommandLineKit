//
//  HWApplication.m
//  HelloWorld
//
//  Created by Jon Gilkison on 2/11/14.
//  Copyright (c) 2014 Interfacelab LLC. All rights reserved.
//

#import "HWApplication.h"


@implementation HWApplication

-(void)setup
{
    [self.arguments registerArgument:@"echo"
                     signatureFormat:@"[-e --echo]="
                          helpString:@"-e --echo\t\tString to echo."];
}

-(int)main
{
    NSString *echoText=[self.arguments firstObjectForArgument:@"echo"];
    if (echoText)
    {
        printf("%s\n",[echoText UTF8String]);
    }
    else
    {
        [self printError:@"Please specify a string to echo with the --echo switch."];
        return 1;
    }
    
    return 0;
}

@end
