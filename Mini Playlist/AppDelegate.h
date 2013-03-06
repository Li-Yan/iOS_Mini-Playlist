//
//  AppDelegate.h
//  Mini Playlist
//
//  Created by Li Yan on 2/5/13.
//  Copyright (c) 2013 Li Yan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Video.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate, NSXMLParserDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) Video *video;
@property (strong, nonatomic) NSMutableArray *videos;
@property (strong, nonatomic) NSString *currentString;

@end
