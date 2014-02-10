//
//  CLKArguments.m
//  CommandLineKit
//
//  Created by Jon Gilkison on 2/11/14.
//  Copyright (c) 2014 Interfacelab LLC. All rights reserved.
//

#import "CLKArguments.h"
#import "NSString+Indenter.h"

#include <sys/ioctl.h>

@interface CLKArguments()
{
    NSMutableDictionary *argumentSigs;
    FSArgumentPackage *package;
}

@end

@implementation CLKArguments


-(id)init
{
    if ((self=[super init]))
    {
        argumentSigs=[[NSMutableDictionary dictionary] retain];
    }
    
    return self;
}

-(void)dealloc
{
    [package release];
    [argumentSigs release];
    [super dealloc];
}

#pragma mark - Argument parsing

-(void)registerArgument:(NSString *)name signatureFormat:(NSString *)signatureFormat helpString:(NSString *)helpString
{
    FSArgumentSignature *sig=[FSArgumentSignature argumentSignatureWithFormat:signatureFormat];
    [sig setDescriptionHelper:^NSString *(FSArgumentSignature *signature, NSUInteger indentLevel, NSUInteger terminalWidth) {
        return [helpString fsargs_mutableStringByIndentingToWidth:indentLevel * 2 lineLength:terminalWidth];
    }];
    
    [argumentSigs setObject:sig forKey:name];
}

-(BOOL)booleanArgument:(NSString *)argument
{
    if (!package)
        [self parse];
    
    return [package booleanValueForSignature:argumentSigs[argument]];
}

- (NSArray *)allObjectsForArgument:(NSString *)argument
{
    if (!package)
        [self parse];
    
    return [package allObjectsForSignature:argumentSigs[argument]];
}

- (id)firstObjectForArgument:(NSString *)argument
{
    if (!package)
        [self parse];
    
    return [package firstObjectForSignature:argumentSigs[argument]];
}

- (id)lastObjectForArgument:(NSString *)argument
{
    if (!package)
        [self parse];
    
    return [package lastObjectForSignature:argumentSigs[argument]];
}

- (id)objectAtIndex:(NSUInteger)index forArgument:(NSString *)argument
{
    if (!package)
        [self parse];
    
    return [package objectAtIndex:index forSignature:argumentSigs[argument]];
}

-(void)printHelp
{
    struct winsize ws;
    ioctl(0, TIOCGWINSZ, &ws);
    
    for(FSArgumentSignature *sig in argumentSigs.allValues)
        printf("%s",[[sig descriptionForHelpWithIndent:2 terminalWidth:ws.ws_col] UTF8String]);
}

-(void)parse
{
    if (package)
        [package release];
    
    package=[[[NSProcessInfo processInfo] fsargs_parseArgumentsWithSignatures:argumentSigs.allValues] retain];
}

@end
