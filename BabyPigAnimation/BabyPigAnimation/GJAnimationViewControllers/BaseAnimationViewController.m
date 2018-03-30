//  您好，谢谢您参考我的项目，如果有问题请移步
//  https://github.com/manofit/BabyPigAnimation
//
//  BaseAnimationViewController.m
//  BabyPigAnimation
//
//  Created by 高军 on 2018/3/27.
//  Copyright © 2018年 Jun Gao. All rights reserved.
//

#import "BaseAnimationViewController.h"

@interface BaseAnimationViewController ()
@property(nonatomic,assign)BaseAniType aniType;
@end

@implementation BaseAnimationViewController

-(instancetype)initWithType:(BaseAniType)type{
    self = [super init];
    if (self){
        self.aniType = type;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    NSArray *array_1 = [NSArray arrayWithObjects:@"位移",@"透明度",@"缩放",@"旋转",@"背景色", nil];
    self.navigationItem.title = array_1[self.aniType];
    
}

-(void)btnClicked:(UIButton *)btn{
    [super btnClicked:btn];
    switch (self.aniType) {
        case position:
            [self makePositionAnimation];
            break;
        case opacity:
            [self makeOpacityAnimation];
            break;
        case scale:
            [self makeScaleAnimation];
            break;
        case rotate:
            [self makeRotateAnimation];
            break;
        case background:
            [self makeBackgroundAnimation];
            break;
        default:
            break;
    }
}

//位移
-(void)makePositionAnimation{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(50, SCREEN_HEIGHT/2-75)];
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH-50, SCREEN_HEIGHT/2-75)];
    animation.duration = 1.0f;
    //animation.fillMode = kCAFillModeForwards;
    //animation.removedOnCompletion = NO;
    [self.babyView.layer addAnimation:animation forKey:@"positionAnimation"];
}

//透明度
-(void)makeOpacityAnimation{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    animation.fromValue = [NSNumber numberWithFloat:1.0f];
    animation.toValue = [NSNumber numberWithFloat:0.5f];
    animation.duration = 1.0f;
    [self.babyView.layer addAnimation:animation forKey:@"opacityAnimation"];
}

//缩放
-(void)makeScaleAnimation{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.toValue = [NSNumber numberWithFloat:2.0f];
    animation.duration = 1.0f;
    [self.babyView.layer addAnimation:animation forKey:@"scaleAnimation"];
}

//旋转
-(void)makeRotateAnimation{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.toValue = [NSNumber numberWithFloat:M_PI];
    animation.duration = 1.0f;
    [self.babyView.layer addAnimation:animation forKey:@"rotateAnimation"];
}

//背景色变化
-(void)makeBackgroundAnimation{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    animation.toValue = (id)[UIColor greenColor].CGColor;
    animation.duration = 1.0f;
    [self.babyView.layer addAnimation:animation forKey:@"backgroundAnimation"];
}


@end
