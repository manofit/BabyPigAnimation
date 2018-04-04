//  您好，谢谢您参考我的项目，如果有问题请移步
//  https://github.com/manofit/BabyPigAnimation
//
//  GJProgressAniView.m
//  BabyPigAnimation
//
//  Created by 高军 on 2018/4/2.
//  Copyright © 2018年 Jun Gao. All rights reserved.
//

#import "GJProgressAniView.h"

@interface GJProgressAniView()
@property(nonatomic,strong)UILabel *proLabel;
@property(nonatomic,assign)NSInteger proLabelNum;
@property(nonatomic,assign)NSInteger progress;
@property(nonatomic,strong)CAGradientLayer *gradient;
@property(nonatomic,strong)CAShapeLayer *backPathLayer;
@property(nonatomic,strong)CAShapeLayer *mainPathLayer;
@property(nonatomic,strong)NSTimer *proLabelTimer;
@end

@implementation GJProgressAniView
- (UILabel *)proLabel{
    if (_proLabel == nil){
        _proLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
        _proLabel.center = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
        _proLabel.textAlignment = NSTextAlignmentCenter;
        _proLabel.font = [UIFont systemFontOfSize:self.bounds.size.width / 6];
        _proLabel.text = @"";
        [self addSubview:_proLabel];
    }
    return _proLabel;
}

- (CAShapeLayer *)backPathLayer{
    if (_backPathLayer == nil){
        _backPathLayer = [[CAShapeLayer alloc] init];
        _backPathLayer.fillColor = [UIColor clearColor].CGColor;
        _backPathLayer.strokeColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5].CGColor;
        _backPathLayer.lineWidth = self.mainPathWidth;
        [self.layer addSublayer:_backPathLayer];
    }
    return _backPathLayer;
}

- (CAShapeLayer *)mainPathLayer{
    if (_mainPathLayer == nil){
        _mainPathLayer = [[CAShapeLayer alloc] init];
        _mainPathLayer.fillColor = [UIColor clearColor].CGColor;
        _mainPathLayer.strokeColor = [UIColor whiteColor].CGColor;
        _mainPathLayer.lineWidth = self.mainPathWidth;
        [self.layer addSublayer:_mainPathLayer];
    }
    return _mainPathLayer;
}

- (CAGradientLayer *)gradient{
    if (_gradient == nil){
        _gradient = [[CAGradientLayer alloc] init];
        _gradient.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
        [_gradient setColors:[NSArray arrayWithObjects:(id)[[self switchHexStringToColor:@"f31414"] CGColor], (id)[[self switchHexStringToColor:@"f27200"] CGColor],(id)[[self switchHexStringToColor:@"ffff00"] CGColor],(id)[[self switchHexStringToColor:@"2bee22"] CGColor],(id)[[self switchHexStringToColor:@"32a7eb"] CGColor],nil]];
        [_gradient setLocations:@[@0,@0.3,@0.7,@1]];
        [_gradient setStartPoint:CGPointMake(0, 0)];
        [_gradient setEndPoint:CGPointMake(1, 0)];
        _gradient.type = kCAGradientLayerAxial;
        [self.layer addSublayer:_gradient];
    }
    return _gradient;
}

- (UIColor *)switchHexStringToColor:(NSString *)hexString{
    NSString *cString = [[hexString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    //r
    NSString *rString = [cString substringWithRange:range];
    
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}

- (void)drawCircleWithProgress:(NSInteger)progress{
    self.progress = progress;
    self.proLabelNum = 0;
    
    UIBezierPath *backPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2) radius:self.bounds.size.width/2 - self.mainPathWidth startAngle:M_PI endAngle:M_PI*3 clockwise:YES];
    
    UIBezierPath *mainPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2) radius:self.bounds.size.width/2 - self.mainPathWidth + 3 startAngle:M_PI endAngle:M_PI*3 clockwise:YES];
    
    self.backPathLayer.path = backPath.CGPath;
    self.mainPathLayer.path = mainPath.CGPath;
    
    [self.gradient setMask:self.mainPathLayer];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.duration = progress/100.0f;
    animation.fromValue = [NSNumber numberWithFloat:0.0f];
    animation.toValue = [NSNumber numberWithFloat:progress/100.0f];
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    [self.mainPathLayer addAnimation:animation forKey:@"strokeEndAnimation"];
    
    if (self.progress > 0){
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            self.proLabelTimer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(proLabelTimerAction) userInfo:nil repeats:YES];
            [[NSRunLoop currentRunLoop] run];
        });
    }else{
        self.proLabel.text = @"0%";
    }
}

- (void)proLabelTimerAction{
    dispatch_async(dispatch_get_main_queue(), ^{
        self.proLabel.text = [NSString stringWithFormat:@"%ld%%",(long)self.proLabelNum];
    });
    
    if (self.proLabelNum >= self.progress){
        [self.proLabelTimer invalidate];
        self.proLabelTimer = nil;
    }else{
        self.proLabelNum++;
    }
}

@end
