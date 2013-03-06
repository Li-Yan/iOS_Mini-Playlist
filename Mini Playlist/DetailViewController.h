//
//  DetailViewController.h
//  Mini Playlist
//
//  Created by Li Yan on 2/5/13.
//  Copyright (c) 2013 Li Yan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Video.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (strong, nonatomic) Video *video;

@property (weak, nonatomic) IBOutlet UITextView *detailTextView;

- (void) changeVideo: (Video *) newVideo;

@end
