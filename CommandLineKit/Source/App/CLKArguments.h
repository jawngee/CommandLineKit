//
//  CLKArguments.h
//  CommandLineKit
//
//  Created by Jon Gilkison on 2/11/14.
//  Copyright (c) 2014 Interfacelab LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *	Defines the
 */
@interface CLKArguments : NSObject

/**
 *	Registers a command line argument
 *
 *	@param name            The name of the argument, eg 'help'
 *	@param signatureFormat The signature format for the argument, eg '[-h --help]'
 *	@param helpString      The help description for the argument
 */
-(void)registerArgument:(NSString *)name signatureFormat:(NSString *)signatureFormat helpString:(NSString *)helpString;

/**
 *	Returns the boolean value of an argument
 *
 *	@param argument The name of the argument, eg 'help'
 *
 *	@return The value, NO if the argument doesn't have a value
 */
-(BOOL)booleanArgument:(NSString *)argument;

/**
 *	Returns all objects for an argument
 *
 *	@param argument The name of the argument
 *
 *	@return An array containing all of the object values for the specified argument
 */
-(NSArray *)allObjectsForArgument:(NSString *)argument;

/**
 *	The first object value for an argument
 *
 *	@param argument The name of the argument
 *
 *	@return The first object value for the argument, nil if none exists
 */
-(id)firstObjectForArgument:(NSString *)argument;

/**
 *	The first object value for an argument
 *
 *	@param argument The name of the argument
 *
 *	@return The first object value for the argument, nil if none exists
 */
-(id)lastObjectForArgument:(NSString *)argument;

/**
 *	Returns the object value of an argument at a given index
 *
 *	@param index    The index for the value argument
 *	@param argument The name of the argument
 *
 *	@return The object value for the argument at that index, nil if none exists
 */
-(id)objectAtIndex:(NSUInteger)index forArgument:(NSString *)argument;

/**
 *	Prints help
 */
-(void)printHelp;

/**
 *	Parses the command line
 */
-(void)parse;

@end
