//  您好，谢谢您参考我的项目，如果有问题请移步
//  https://github.com/manofit/BabyPigAnimation
//
//  GJProgressAniView.h
//  BabyPigAnimation
//
//  Created by 高军 on 2018/4/2.
//  Copyright © 2018年 Jun Gao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GJProgressAniView : UIView

@property(nonatomic,assign)CGFloat mainPathWidth;

- (void)drawCircleWithProgress:(NSInteger)progress;

@end
