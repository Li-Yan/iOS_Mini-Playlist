//
//  AppDelegate.m
//  Mini Playlist
//
//  Created by Li Yan on 2/5/13.
//  Copyright (c) 2013 Li Yan. All rights reserved.
//

#import "AppDelegate.h"
#import "Video.h"
#import "MasterViewController.h"

@implementation AppDelegate

@synthesize currentString;
@synthesize video;
@synthesize videos;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    video = [[Video alloc] init];
    videos = [[NSMutableArray alloc] init];
    
    // Override point for customization after application launch.
    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] init];
    NSString *urlString = @"https://gdata.youtube.com/feeds/api/channels?q=sport&v=2";
    NSURL *url = [[NSURL alloc] initWithString:urlString];
    [urlRequest setURL:url];
    [urlRequest setHTTPMethod:@"GET"];
    NSData *data = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:nil error:nil];
    
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:data];
    [parser setDelegate:self];
    [parser parse];
    
    UINavigationController * navController = (UINavigationController *) self.window.rootViewController;
    MasterViewController * masterController = [navController.viewControllers objectAtIndex:0];
    masterController.videos = videos;
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
    if ([elementName isEqualToString:@"media:thumbnail"]) {
        [video changeImageLink:[attributeDict objectForKey:@"url"]];
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    currentString = string;
}


- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    if ([elementName isEqualToString:@"title"]) {
        [video changeTitle:currentString];
    }
    else if ([elementName isEqualToString:@"summary"]) {
        [video changeSummary:currentString];
    }
    else if ([elementName isEqualToString:@"media:"]) {
        //NSLog(elementName);
        //NSLog(currentString);
    }
    else if ([elementName isEqualToString:@"entry"]) {
        [videos addObject:video];
        video = [[Video alloc] init];
    }
}


@end
