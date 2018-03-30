//  您好，谢谢您参考我的项目，如果有问题请移步
//  https://github.com/manofit/BabyPigAnimation
//
//  GroupAnimationViewController.m
//  BabyPigAnimation
//
//  Created by 高军 on 2018/3/27.
//  Copyright © 2018年 Jun Gao. All rights reserved.
//

#import "GroupAnimationViewController.h"

@interface GroupAnimationViewController ()
@property(nonatomic,assign)GroupAniType aniType;
@end

@implementation GroupAnimationViewController

-(instancetype)initWithType:(GroupAniType)type{
    self = [super init];
    if (self){
        self.aniType = type;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSArray *array_3 = [NSArray arrayWithObjects:@"同时",@"连续", nil];
    self.navigationItem.title = array_3[self.aniType];
    
}

-(void)btnClicked:(UIButton *)btn{
    [super btnClicked:btn];
    switch (self.aniType) {
        case keyFrame:
            [self makeSameTimeAnimation];
            break;
        case path:
            [self makeGoOnAnimation];
            break;
        default:
            break;
    }
}

-(void)makeSameTimeAnimation{
    CAKeyframeAnimation *positionAni = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    NSValue *value_0 = [NSValue valueWithCGPoint:CGPointMake(50, SCREEN_HEIGHT/2-50)];
    NSValue *value_1 = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH/3, SCREEN_HEIGHT/2-50)];
    NSValue *value_2 = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH/3, SCREEN_HEIGHT/2+50)];
    NSValue *value_3 = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH*2/3, SCREEN_HEIGHT/2+50)];
    NSValue *value_4 = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH*2/3, SCREEN_HEIGHT/2-50)];
    NSValue *value_5 = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH-50, SCREEN_HEIGHT/2-50)];
    positionAni.values = [NSArray arrayWithObjects:value_0,value_1,value_2,value_3,value_4,value_5, nil];

    CABasicAnimation *scaleAni = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAni.fromValue = [NSNumber numberWithFloat:0.8f];
    scaleAni.toValue = [NSNumber numberWithFloat:2.0f];
    
    CABasicAnimation *rotateAni = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotateAni.toValue = [NSNumber numberWithFloat:M_PI*4];
    
    CAAnimationGroup *groupAni = [CAAnimationGroup animation];
    groupAni.animations = [NSArray arrayWithObjects:positionAni,scaleAni,rotateAni, nil];
    groupAni.duration = 4.0f;
    [self.babyView.layer addAnimation:groupAni forKey:@"groupAnimation"];
}

//连续动画要处理好时间的衔接
-(void)makeGoOnAnimation{
    //定义一个动画开始的时间
    CFTimeInterval currentTime = CACurrentMediaTime();
    
    CABasicAnimation *positionAni = [CABasicAnimation animationWithKeyPath:@"position"];
    positionAni.fromValue = [NSValue valueWithCGPoint:CGPointMake(50, SCREEN_HEIGHT/2)];
    positionAni.toValue = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH/2, SCREEN_HEIGHT/2)];
    positionAni.duration = 1.0f;
    positionAni.fillMode = kCAFillModeForwards;
    positionAni.removedOnCompletion = NO;
    positionAni.beginTime = currentTime;
    [self.babyView.layer addAnimation:positionAni forKey:@"positionAnimation"];
    
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.fromValue = [NSNumber numberWithFloat:0.8f];
    scaleAnimation.toValue = [NSNumber numberWithFloat:2.0f];
    scaleAnimation.duration = 1.0f;
    scaleAnimation.fillMode = kCAFillModeForwards;
    scaleAnimation.removedOnCompletion = NO;
    scaleAnimation.beginTime = currentTime + 1.0f;
    [self.babyView.layer addAnimation:scaleAnimation forKey:@"scaleAnimation"];
    
    CABasicAnimation *rotateAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotateAnimation.toValue = [NSNumber numberWithFloat:M_PI*4];
    rotateAnimation.duration = 1.0f;
    rotateAnimation.fillMode  = kCAFillModeForwards;
    rotateAnimation.removedOnCompletion = NO;
    rotateAnimation.beginTime = currentTime + 2.0f;
    [self.babyView.layer addAnimation:rotateAnimation forKey:@"rotateAnimation"];
}

@end
