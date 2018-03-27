//  您好，谢谢您参考我的项目，如果有问题请移步
//  https://github.com/manofit/BabyPigAnimation
//
//  BaseAnimationViewController.h
//  BabyPigAnimation
//
//  Created by 高军 on 2018/3/27.
//  Copyright © 2018年 Jun Gao. All rights reserved.
//

#import "BaseViewController.h"


@interface BaseAnimationViewController : BaseViewController

@property(nonatomic,assign)BaseAniType aniType;

-(instancetype)initWithType:(BaseAniType)type;

@end
