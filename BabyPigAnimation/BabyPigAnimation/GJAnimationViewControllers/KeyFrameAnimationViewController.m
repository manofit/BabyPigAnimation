//  您好，谢谢您参考我的项目，如果有问题请移步
//  https://github.com/manofit/BabyPigAnimation
//
//  KeyFrameAnimationViewController.m
//  BabyPigAnimation
//
//  Created by 高军 on 2018/3/27.
//  Copyright © 2018年 Jun Gao. All rights reserved.
//

#import "KeyFrameAnimationViewController.h"

@interface KeyFrameAnimationViewController ()
@property(nonatomic,assign)KeyAniType aniType;
@end

@implementation KeyFrameAnimationViewController

-(instancetype)initWithType:(KeyAniType)type{
    self = [super init];
    if (self){
        self.aniType = type;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    NSArray *array_2 = [NSArray arrayWithObjects:@"关键帧",@"路径",@"抖动", nil];
    self.navigationItem.title = array_2[self.aniType];
    
}

-(void)btnClicked:(UIButton *)btn{
    [super btnClicked:btn];
    switch (self.aniType) {
        case keyFrame:
            [self makeKeyFrameAnimation];
            break;
        case path:
            [self makePathAnimation];
            break;
        case shake:
            [self makeShakeAnimation];
            break;
        default:
            break;
    }
}

//关键帧动画
-(void)makeKeyFrameAnimation{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    NSValue *value_0 = [NSValue valueWithCGPoint:CGPointMake(50, SCREEN_HEIGHT/2-50)];
    NSValue *value_1 = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH/3, SCREEN_HEIGHT/2-50)];
    NSValue *value_2 = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH/3, SCREEN_HEIGHT/2+50)];
    NSValue *value_3 = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH*2/3, SCREEN_HEIGHT/2+50)];
    NSValue *value_4 = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH*2/3, SCREEN_HEIGHT/2-50)];
    NSValue *value_5 = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH-50, SCREEN_HEIGHT/2-50)];
    animation.values = [NSArray arrayWithObjects:value_0,value_1,value_2,value_3,value_4,value_5, nil];
    animation.duration = 2.0f;
    [self.babyView.layer addAnimation:animation forKey:@"keyFrameAnimation"];
}

//路径
-(void)makePathAnimation{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(SCREEN_WIDTH/2, SCREEN_HEIGHT/2) radius:60 startAngle:0.0f endAngle:M_PI*2 clockwise:YES];
    animation.duration = 2.0f;
    animation.path = path.CGPath;
    [self.babyView.layer addAnimation:animation forKey:@"pathAnimation"];
}

//抖动动画
-(void)makeShakeAnimation{
    CAKeyframeAnimation *anima = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];
    NSValue *value_0 = [NSNumber numberWithFloat:-M_PI/180*4];
    NSValue *value_1 = [NSNumber numberWithFloat:M_PI/180*4];
    NSValue *value_3 = [NSNumber numberWithFloat:-M_PI/180*4];
    anima.values = @[value_0,value_1,value_3];
    anima.repeatCount = MAXFLOAT;
    [self.babyView.layer addAnimation:anima forKey:@"shakeAnimation"];
}

@end
