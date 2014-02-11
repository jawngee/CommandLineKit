//
//  main.m
//  HelloWorld
//
//  Created by Jon Gilkison on 2/11/14.
//  Copyright (c) 2014 Interfacelab LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HWApplication.h"

int main(int argc, const char * argv[])
{

    int result=0;
    
    @autoreleasepool
    {
        result=[HWApplication runWithAppName:@"Hello World"
                                     version:@"0.1"];
    }

    return result;
}

