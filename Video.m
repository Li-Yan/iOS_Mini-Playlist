//
//  Video.m
//  Mini Playlist
//
//  Created by Li Yan on 2/5/13.
//  Copyright (c) 2013 Li Yan. All rights reserved.
//

#import "Video.h"

@implementation Video

@synthesize title;
@synthesize summary;
@synthesize imageLink;

- (void) changeTitle: (NSString *) videoTitle {
    self.title = videoTitle;
}

- (void) changeSummary: (NSString *) videoSummary {
    self.summary = videoSummary;
}

- (void) changeImageLink: (NSString *) videoImageLink {
    self.imageLink = videoImageLink;
}

- (NSString *) getSummary {
    return self.summary;
}

@end
