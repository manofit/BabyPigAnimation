//  您好，谢谢您参考我的项目，如果有问题请移步
//  https://github.com/manofit/BabyPigAnimation
//
//  KeyFrameAnimationViewController.h
//  BabyPigAnimation
//
//  Created by 高军 on 2018/3/27.
//  Copyright © 2018年 Jun Gao. All rights reserved.
//

#import "BaseViewController.h"


@interface KeyFrameAnimationViewController : BaseViewController

@property(nonatomic,assign)KeyAniType aniType;

-(instancetype)initWithType:(KeyAniType)type;

@end
