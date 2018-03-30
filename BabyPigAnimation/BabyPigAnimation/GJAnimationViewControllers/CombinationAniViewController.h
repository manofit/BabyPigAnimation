//  您好，谢谢您参考我的项目，如果有问题请移步
//  https://github.com/manofit/BabyPigAnimation
//
//  CombinationAniViewController.h
//  BabyPigAnimation
//
//  Created by 高军 on 2018/3/27.
//  Copyright © 2018年 Jun Gao. All rights reserved.
//

#import <UIKit/UIKit.h>

#define SCREEN_WIDTH self.view.frame.size.width
#define SCREEN_HEIGHT self.view.frame.size.height

typedef NS_ENUM(NSInteger, CombinationAniType){
    aPath = 0,
    dingding,
    dianzan,
    bezier,
};

@interface CombinationAniViewController : UIViewController

-(instancetype)initWithType:(CombinationAniType)type;

@end
