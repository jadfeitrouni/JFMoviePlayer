//
//  MoviePlayerController.h
//  testingvideo
//
//  Created by Phoenikia on 5/5/15.
//  Copyright (c) 2015 jad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@protocol MoviePlayerDelegate <NSObject>

-(void)videoDidStart:(id)sender;

@end

@interface MoviePlayerController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *videoContainer;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loading;
@property (retain) MPMoviePlayerController *movie;
@property (weak, nonatomic) IBOutlet UIImageView *thumbnail;
@property (weak, nonatomic) IBOutlet UIButton *playButton;

@property (strong,nonatomic) NSURL *url;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loader;

@property id<MoviePlayerDelegate> delegate;

-(id)initWithFrame:(CGRect)_frame Url:(NSURL*)_url Delegate:(id<MoviePlayerDelegate>)_delegate;

-(void)stopVideo;

-(void)prepareToPlay;

@end
