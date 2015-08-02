//
//  ViewController.m
//  HaLan
//
//  Created by ios31 on 02/08/2015.
//  Copyright (c) Năm 2015 ios31. All rights reserved.
//

#import "ViewController.h"
#import "FLAnimatedImage.h"
#import "FLAnimatedImageView.h"
#import "AVFoundation/AVFoundation.h"
@interface ViewController ()

@end

@implementation ViewController{
    AVAudioPlayer* audioPlayer;
    UIImageView* may1;
        UIImageView* may2;
    FLAnimatedImageView* chimBay;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self playSong];
    [self addSprite];
    [self mayBay1];
    [self mayBay2];
    chimBay.frame=CGRectMake(0, 250, 50, 50);
    chimBay.alpha=0.2;
    [UIView animateWithDuration:8 animations:^{
        chimBay.frame=CGRectMake(200, 340, 200, 200);
        chimBay.alpha=1;
    } completion:^(BOOL finished) {
        [self runningBay];
    }];
}
-(void) mayBay1{
    may1.frame=CGRectMake(-100, 100, 100, 59);
    [UIView animateWithDuration:7 animations:^{
        may1.frame=CGRectMake(400, 100  , 100, 59);
    } completion:^(BOOL finished) {
        [self mayBay1];
    }];
}
-(void) mayBay2{
    may2.frame=CGRectMake(-100, 120, 100, 59);
    may2.alpha=0.2;
    [UIView animateWithDuration:8 animations:^{
        may2.frame=CGRectMake(400, 120  , 100, 59);
        may2.alpha=1;
    } completion:^(BOOL finished) {
        [self mayBay2];
    }];
}
-(void) addSprite{
    UIImageView* vImgHouse=[[UIImageView alloc] initWithFrame:CGRectMake(200, 470, 200, 186)];
    vImgHouse.animationImages=@[
                                [UIImage imageNamed:@"house1"],
                                [UIImage imageNamed:@"house2"],
                                [UIImage imageNamed:@"house3"],
                                [UIImage imageNamed:@"house4"],
                                [UIImage imageNamed:@"house5"],
                                [UIImage imageNamed:@"house6"],
                                [UIImage imageNamed:@"house7"],
                                [UIImage imageNamed:@"house8"],
                                [UIImage imageNamed:@"house9"],
                                [UIImage imageNamed:@"house10"],
                                [UIImage imageNamed:@"house11"],
                                ];
    vImgHouse.animationDuration=2;
    [self.view addSubview:vImgHouse];
    [vImgHouse startAnimating];
    
    UIImageView* vImgWindmil=[[UIImageView alloc] initWithFrame:CGRectMake(20, 380, 100, 100)];
    vImgWindmil.animationImages=@[
                                [UIImage imageNamed:@"windmill1"],
                                [UIImage imageNamed:@"windmill2"],
                                [UIImage imageNamed:@"windmill3"],
                                [UIImage imageNamed:@"windmill4"],
                                [UIImage imageNamed:@"windmill5"],
                                [UIImage imageNamed:@"windmill6"],
                                [UIImage imageNamed:@"windmill7"],
                                [UIImage imageNamed:@"windmill8"],
                                [UIImage imageNamed:@"windmill9"],
                                ];
    vImgWindmil.animationDuration=7;
    [self.view addSubview:vImgWindmil];
    [vImgWindmil startAnimating];
    may1=[UIImageView new];
    may1.image=[UIImage imageNamed:@"may1"];
    [self.view addSubview:may1];
    may2=[UIImageView new];
    may2.image=[UIImage imageNamed:@"may1"];
    [self.view addSubview:may2];
    
    FLAnimatedImage *image = [FLAnimatedImage animatedImageWithGIFData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://orig05.deviantart.net/2fa8/f/2015/020/7/0/pixel_dragonbunny_by_dunceneygak-d8eoxj2.gif"]]];
    chimBay = [[FLAnimatedImageView alloc] init];
    chimBay.animatedImage = image;
    [self.view addSubview:chimBay];
}
-(void) runningBay{
    [UIView animateWithDuration:5 animations:^{
        chimBay.frame=CGRectMake(-50, 340, 200, 200);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:5 animations:^{
            chimBay.frame=CGRectMake(200, 340, 200, 200);
        } completion:^(BOOL finished) {
            [self runningBay];
        }];
    }];
}
- (void) playSong {
    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"dance_with_the_devil" ofType:@"mp3"];
    NSURL *url = [NSURL fileURLWithPath:filePath];
    NSError *error;
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url
                                                         error:&error];
    [audioPlayer prepareToPlay];
    [audioPlayer play];
}

@end
