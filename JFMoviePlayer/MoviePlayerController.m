//
//  MoviePlayerController.m
//  testingvideo
//
//  Created by Phoenikia on 5/5/15.
//  Copyright (c) 2015 jad. All rights reserved.
//

#import "MoviePlayerController.h"
#import <AVFoundation/AVFoundation.h>

@interface MoviePlayerController ()
{
    CGRect frame;
    BOOL isLoaded;
}

@end

@implementation MoviePlayerController

@synthesize delegate,url;

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:@"MoviePlayerController" bundle:nil];
    return self;
}

-(id)initWithFrame:(CGRect)_frame Url:(NSURL*)_url Delegate:(id<MoviePlayerDelegate>)_delegate
{
    self = [super init];
    frame = CGRectMake(0, 0, _frame.size.width, _frame.size.height);
    delegate = _delegate;
    url = _url;
    
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.view setFrame:frame];
    [self.loading setHidden:YES];
    [self.view.layer setBorderWidth:2];
    [self.view.layer setBorderColor:[[UIColor colorWithRed:154/255.0f green:28/255.0f blue:31/255.0f alpha:1]CGColor]];
    [self.playButton setHidden:YES];

    
}


-(void)prepareToPlay
{
    if(!isLoaded)
    {
        dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^(void){
        //Background Thread
        AVURLAsset *asset = [[AVURLAsset alloc] initWithURL:url options:nil];
        AVAssetImageGenerator *generate = [[AVAssetImageGenerator alloc] initWithAsset:asset];
        NSError *err = NULL;
        CMTime time = CMTimeMake(1, 60);
        CGImageRef imgRef = [generate copyCGImageAtTime:time actualTime:NULL error:&err];
        
        dispatch_async(dispatch_get_main_queue(), ^(void){
            self.movie = [[MPMoviePlayerController alloc]initWithContentURL:url];
            self.movie.shouldAutoplay = NO;
            [self.movie.view setFrame:CGRectMake(0, 0, self.videoContainer.frame.size.width, self.videoContainer.frame.size.height)];
            
            [self.videoContainer addSubview:self.movie.view];
             self.thumbnail.image = [UIImage imageWithCGImage:imgRef];
            CGImageRelease(imgRef);
            [self.loader setHidden:YES];
            [self.playButton setHidden:NO];
            
            });
        });
    isLoaded = YES;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)playAction:(id)sender
{
    NSLog(@"Play Action");
    [self.movie prepareToPlay];
    if (delegate)
    {
        [delegate videoDidStart:self];
    }
    [self.thumbnail setHidden:YES];
    [self.playButton setHidden:YES];
}

-(void)stopVideo
{
    [self.movie stop];
    [self.thumbnail setHidden:NO];
    [self.playButton setHidden:NO];
}

-(void)videoDidLoad:(NSNotification*)sender
{
    [self.loading setHidden:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
