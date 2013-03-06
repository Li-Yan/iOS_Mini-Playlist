//
//  Video.h
//  Mini Playlist
//
//  Created by Li Yan on 2/5/13.
//  Copyright (c) 2013 Li Yan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Video : NSObject 

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *summary;
@property (strong, nonatomic) NSString *imageLink;

- (void) changeTitle: (NSString *) videoTitle;
- (void) changeSummary: (NSString *) videoSummary;
- (void) changeImageLink: (NSString *) videoImageLink;

- (NSString *) getSummary;

@end
