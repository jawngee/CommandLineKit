//
//  CLKApplication.h
//  CommandLineKit
//
//  Created by Jon Gilkison on 2/11/14.
//  Copyright (c) 2014 Interfacelab LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CLKArguments.h"

/**
 *	Command line application
 */
@interface CLKApplication : NSObject

/**
 *	The arguments for the application
 */
@property (readonly) CLKArguments *arguments;

/**
 *	Application setup
 */
-(void)setup;

/**
 *	The main entry point for the application
 */
-(int)main;

/**
 *	Runs this application
 */
+(int)run;

/**
 *	Runs this application
 */
+(int)runWithAppName:(NSString *)appName version:(NSString *)version;

/**
 *	Prints help
 */
-(void)printError:(NSString *)error;

@end
