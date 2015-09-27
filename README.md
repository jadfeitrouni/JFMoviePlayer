# JFMoviePlayer
A movie player that plays local and online movie files

I created this component by using MediaPlayer and AVFoundation. It can play both local and online movie files.
Only the format supported by MPMoviePlayerController are supported for now.

How to use :
1- Add a view (videoView in my example) to your view controller and set it as an IBOutlet
2- Add a player property of type MoviePlayerController to your view controller with (strong, nonatomic) attribute
3- Add this code to play the video:

    NSString *filepath = [[NSBundle mainBundle] pathForResource:@"yourResourceName" ofType:@"yourResourceType"];
    NSURL *fileURL = [NSURL fileURLWithPath:filepath];
    _player = [[MoviePlayerController alloc]initWithFrame:self.videoView.frame Url:fileURL Delegate:nil];
    [_player prepareToPlay];
    [self.videoView addSubview:_player.view];

The prepareToPlay method sets up the video and  fetches its thumbnail.


To be done: 
1- Add videos to a UITableView
2- Support for more video formats
