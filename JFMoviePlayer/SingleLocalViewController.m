//
//  SingleLocalViewController.m
//  JFMoviePlayer
//
//  Created by Phoenikia on 9/27/15.
//  Copyright © 2015 jad. All rights reserved.
//

#import "SingleLocalViewController.h"


@interface SingleLocalViewController ()

@end

@implementation SingleLocalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *filepath = [[NSBundle mainBundle] pathForResource:@"small" ofType:@"mp4"];
    NSURL *fileURL = [NSURL fileURLWithPath:filepath];
    _player = [[MoviePlayerController alloc]initWithFrame:self.videoView.frame Url:fileURL Delegate:nil];
    [_player prepareToPlay];
    [self.videoView addSubview:_player.view];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
