//
//  ViewController.m
//  WoodFish
//
//  Created by rano on 15-3-30.
//  Copyright (c) 2015年 zovon. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,strong)NSURL *url;
@property(nonatomic)int count;
@end
static SystemSoundID soundID = 0;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.url = [[NSBundle mainBundle] URLForResource:@"du.wav" withExtension:nil];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)(_url), &soundID);
    self.count = 0;
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)woodFishTap:(UITapGestureRecognizer *)sender {
    AudioServicesPlaySystemSound(soundID);
    [self animate];
}
-(void)animate
{
    
    float beganY = 960.0f;
    float endY = 150.0f;

    
    UIImageView *iv = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 59, 49)];
    iv.image = [UIImage imageNamed:[NSString stringWithFormat:@"img_%02d.png",self.count % 9 + 1] ];
    self.count++;
    iv.center = CGPointMake(self.view.bounds.size.width * 0.5, self.view.bounds.size.height * beganY / 2208 - 30);
    [self.view addSubview:iv];
    

    [UIView animateWithDuration:1.6 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        iv.center = CGPointMake(iv.center.x, self.view.bounds.size.height * endY / 2208);
        iv.alpha = 0.0f;
    } completion:^(BOOL finished) {
        [iv removeFromSuperview];
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
