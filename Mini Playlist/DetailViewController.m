//
//  DetailViewController.m
//  Mini Playlist
//
//  Created by Li Yan on 2/5/13.
//  Copyright (c) 2013 Li Yan. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
- (void)configureView;
@end

@implementation DetailViewController

@synthesize video;

#pragma mark - Managing the detail item

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.detailTextView.text = video.summary;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) changeVideo: (Video *) newVideo {
    self.video = newVideo;
}

@end
