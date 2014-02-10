//
//  CLKApplication.m
//  CommandLineKit
//
//  Created by Jon Gilkison on 2/11/14.
//  Copyright (c) 2014 Interfacelab LLC. All rights reserved.
//

#import "CLKApplication.h"
#include <sys/ioctl.h>

@interface CLKApplication()
{
    NSString *appName;
    NSString *version;
}

-(void)printHelp;
-(void)printVersion;

@end

@implementation CLKApplication

#pragma mark - Init/Dealloc

-(id)init
{
    if ((self=[super init]))
    {
        _arguments=[[CLKArguments alloc] init];
    }
    
    return self;
}

-(id)initWithAppName:(NSString *)_appName version:(NSString *)_version
{
    if ((self=[self init]))
    {
        appName=[_appName copy];
        version=[_version copy];
        
        if (appName && version)
        {
            [_arguments registerArgument:@"help"
                         signatureFormat:@"[-h --help -?]"
                              helpString:@"-h --help -?\tShow help"];

            [_arguments registerArgument:@"version"
                         signatureFormat:@"[-v --version]"
                              helpString:@"-v --version -?\tShow version information"];
        }
    }
    
    return self;
}

-(void)dealloc
{
    [appName release];
    [version release];
    [_arguments release];
    
    [super dealloc];
}

#pragma mark - Help/Version

-(void)printHelp
{
    [self printVersion];
    printf("\n");   
    [_arguments printHelp];
}

-(void)printVersion
{
    printf("%s %s\n",[appName UTF8String],[version UTF8String]);
}

#pragma mark - Main/Run

-(int)main
{
    return 0;
}

+(int)run
{
    return [self runWithAppName:nil version:nil];
}

+(int)runWithAppName:(NSString *)appName version:(NSString *)version
{
    CLKApplication *app=[[[self class] alloc] initWithAppName:appName version:version];
    
    if ([app.arguments booleanArgument:@"help"])
    {
        [app printHelp];
        return 0;
    }
    
    if ([app.arguments booleanArgument:@"version"])
    {
        [app printVersion];
        return 0;
    }
    
    return [app main];
}

@end
