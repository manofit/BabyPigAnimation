# BabyPigAnimation

从简单的基础动画到复杂的组动画，原理一目了然。最后再加上几个常见动画，举一反三。
### 效果图
![gif_1](https://github.com/manofit/BabyPigAnimation/blob/master/gif_1.gif)![gif_2](https://github.com/manofit/BabyPigAnimation/blob/master/gif_2.gif)![gif_3](https://github.com/manofit/BabyPigAnimation/blob/master/gif_3.gif)![love](https://github.com/manofit/BabyPigAnimation/blob/master/love.gif)


### 使用
- 基础动画
```
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
```
- 关键帧动画
```
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
```
- 组动画
```
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
```
- 过渡动画
```
CATransition *transitionAni = [CATransition animation];
transitionAni.type = kCATransitionMoveIn;
transitionAni.subtype = kCATransitionFromRight;
transitionAni.duration = 1.0f;
[self.babyView.layer addAnimation:transitionAni forKey:@"moveInAnimation"];
```
