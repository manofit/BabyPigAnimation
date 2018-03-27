//  您好，谢谢您参考我的项目，如果有问题请移步
//  https://github.com/manofit/BabyPigAnimation
//
//  BaseViewController.h
//  BabyPigAnimation
//
//  Created by 高军 on 2018/3/27.
//  Copyright © 2018年 Jun Gao. All rights reserved.
//

#import <UIKit/UIKit.h>

#define SCREEN_WIDTH self.view.frame.size.width
#define SCREEN_HEIGHT self.view.frame.size.height

typedef NS_ENUM(NSInteger, BaseAniType){
    position = 0,
    opacity,
    scale,
    rotate,
    background
};

typedef NS_ENUM(NSInteger, KeyAniType){
    keyFrame = 0,
    path,
    shake
};

typedef NS_ENUM(NSInteger, GroupAniType){
    sameTime = 0,
    goOn
};

typedef NS_ENUM(NSInteger, TransitionAniType){
    fade = 0,
    moveIn,
    push,
    reveal,
    cube,
    suck,
    oglFile,
    ripple,
    curl,
    unCurl,
    caOpen,
    caClose
};

@interface BaseViewController : UIViewController

@property(nonatomic,strong)UIView *babyView;

-(void)btnClicked:(UIButton *)btn;

@end
