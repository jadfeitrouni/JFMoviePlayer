//
//  SingleOnlineViewController.h
//  JFMoviePlayer
//
//  Created by Phoenikia on 9/27/15.
//  Copyright © 2015 jad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MoviePlayerController.h"

@interface SingleOnlineViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *videoView;
@property (strong, nonatomic) MoviePlayerController *player;

@end
