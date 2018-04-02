//  您好，谢谢您参考我的项目，如果有问题请移步
//  https://github.com/manofit/BabyPigAnimation
//
//  CombinationAniViewController.m
//  BabyPigAnimation
//
//  Created by 高军 on 2018/3/27.
//  Copyright © 2018年 Jun Gao. All rights reserved.
//

#import "CombinationAniViewController.h"
#import "DCPathButton.h"
#import "DWBubbleMenuButton.h"
#import "MCFireworksButton.h"

@interface CombinationAniViewController ()<DCPathButtonDelegate>
@property(nonatomic,assign)CombinationAniType aniType;
@end

@implementation CombinationAniViewController
-(instancetype)initWithType:(CombinationAniType)type{
    self = [super init];
    if (self){
        self.aniType = type;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSArray *array_5 = [NSArray arrayWithObjects:@"path",@"钉钉",@"点赞",@"贝塞尔曲线", nil];
    self.navigationItem.title = array_5[self.aniType];
    
    [self loadAnimationWithType:self.aniType];
}

-(void)loadAnimationWithType:(NSInteger)type{
    switch (type) {
        case 0:
            [self makeAPathAnimation];
            break;
        case 1:
            [self makeDingdingAnimation];
            break;
        case 2:
            [self makeDianzanAnimation];
            break;
        case 3:
            [self makeBezierPathAnimation];
            break;
        default:
            break;
    }
}

-(void)makeAPathAnimation{
    // Configure center button
    //
    DCPathButton *dcPathButton = [[DCPathButton alloc]initWithCenterImage:[UIImage imageNamed:@"chooser-button-tab"]
                                                           hilightedImage:[UIImage imageNamed:@"chooser-button-tab-highlighted"]];
    
    dcPathButton.delegate = self;
    
    // Configure item buttons
    //
    DCPathItemButton *itemButton_1 = [[DCPathItemButton alloc]initWithImage:[UIImage imageNamed:@"chooser-moment-icon-music"]
                                                           highlightedImage:[UIImage imageNamed:@"chooser-moment-icon-music-highlighted"]
                                                            backgroundImage:[UIImage imageNamed:@"chooser-moment-button"]
                                                 backgroundHighlightedImage:[UIImage imageNamed:@"chooser-moment-button-highlighted"]];
    
    DCPathItemButton *itemButton_2 = [[DCPathItemButton alloc]initWithImage:[UIImage imageNamed:@"chooser-moment-icon-place"]
                                                           highlightedImage:[UIImage imageNamed:@"chooser-moment-icon-place-highlighted"]
                                                            backgroundImage:[UIImage imageNamed:@"chooser-moment-button"]
                                                 backgroundHighlightedImage:[UIImage imageNamed:@"chooser-moment-button-highlighted"]];
    
    DCPathItemButton *itemButton_3 = [[DCPathItemButton alloc]initWithImage:[UIImage imageNamed:@"chooser-moment-icon-camera"]
                                                           highlightedImage:[UIImage imageNamed:@"chooser-moment-icon-camera-highlighted"]
                                                            backgroundImage:[UIImage imageNamed:@"chooser-moment-button"]
                                                 backgroundHighlightedImage:[UIImage imageNamed:@"chooser-moment-button-highlighted"]];
    
    DCPathItemButton *itemButton_4 = [[DCPathItemButton alloc]initWithImage:[UIImage imageNamed:@"chooser-moment-icon-thought"]
                                                           highlightedImage:[UIImage imageNamed:@"chooser-moment-icon-thought-highlighted"]
                                                            backgroundImage:[UIImage imageNamed:@"chooser-moment-button"]
                                                 backgroundHighlightedImage:[UIImage imageNamed:@"chooser-moment-button-highlighted"]];
    
    DCPathItemButton *itemButton_5 = [[DCPathItemButton alloc]initWithImage:[UIImage imageNamed:@"chooser-moment-icon-sleep"]
                                                           highlightedImage:[UIImage imageNamed:@"chooser-moment-icon-sleep-highlighted"]
                                                            backgroundImage:[UIImage imageNamed:@"chooser-moment-button"]
                                                 backgroundHighlightedImage:[UIImage imageNamed:@"chooser-moment-button-highlighted"]];
    
    // Add the item button into the center button
    //
    [dcPathButton addPathItems:@[itemButton_1, itemButton_2, itemButton_3, itemButton_4, itemButton_5]];
    
    [self.view addSubview:dcPathButton];
    
}

-(void)itemButtonTappedAtIndex:(NSUInteger)index{
    NSLog(@"you did click btn in %ld",index);
}

//===================================================================================================================

-(void)makeDingdingAnimation{
    UILabel *homeLabel = [self createHomeButtonView];
    
    DWBubbleMenuButton *upMenuView = [[DWBubbleMenuButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width - homeLabel.frame.size.width - 20.f,
                                                                                          self.view.frame.size.height - homeLabel.frame.size.height - 20.f,
                                                                                          homeLabel.frame.size.width,
                                                                                          homeLabel.frame.size.height)
                                                            expansionDirection:DirectionUp];
    upMenuView.homeButtonView = homeLabel;
    [upMenuView addButtons:[self createDemoButtonArray]];
    
    [self.view addSubview:upMenuView];
}

- (UILabel *)createHomeButtonView {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0.f, 0.f, 40.f, 40.f)];
    
    label.text = @"Tap";
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.layer.cornerRadius = label.frame.size.height / 2.f;
    label.backgroundColor =[UIColor colorWithRed:0.f green:0.f blue:0.f alpha:0.5f];
    label.clipsToBounds = YES;
    
    return label;
}

- (NSArray *)createDemoButtonArray {
    NSMutableArray *buttonsMutable = [[NSMutableArray alloc] init];
    
    int i = 0;
    for (NSString *title in @[@"A", @"B", @"C", @"D", @"E", @"F"]) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button setTitle:title forState:UIControlStateNormal];
        
        button.frame = CGRectMake(0.f, 0.f, 30.f, 30.f);
        button.layer.cornerRadius = button.frame.size.height / 2.f;
        button.backgroundColor = [UIColor colorWithRed:0.f green:0.f blue:0.f alpha:0.5f];
        button.clipsToBounds = YES;
        button.tag = i++;
        
        [button addTarget:self action:@selector(dwBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [buttonsMutable addObject:button];
    }
    
    return [buttonsMutable copy];
}

- (void)dwBtnClick:(UIButton *)sender {
    NSLog(@"DWButton tapped, tag: %ld", (long)sender.tag);
}

//===================================================================================================================

-(void)makeDianzanAnimation{
    MCFireworksButton *btn = [[MCFireworksButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-25, SCREEN_HEIGHT/2-25, 50, 50)];
    btn.particleImage = [UIImage imageNamed:@"Sparkle"];
    btn.particleScale = 0.05;
    btn.particleScaleRange = 0.02;
    btn.selected = NO;
    [btn setImage:[UIImage imageNamed:@"Like"] forState:UIControlStateNormal];
    
    [btn addTarget:self action:@selector(handleButtonPress:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

-(void)handleButtonPress:(MCFireworksButton *)btn{
    btn.selected = !btn.selected;
    if (btn.selected){
        [btn popOutsideWithDuration:0.5];
        [btn setImage:[UIImage imageNamed:@"Like-Blue"] forState:UIControlStateNormal];
        [btn animate];
    }else{
        [btn popInsideWithDuration:0.4];
        [btn setImage:[UIImage imageNamed:@"Like"] forState:UIControlStateNormal];
    }
}

//===================================================================================================================
- (void)makeBezierPathAnimation{

    UIBezierPath *path = [UIBezierPath bezierPath];
    // 首先设置一个起始点
    CGPoint startPoint = CGPointMake(self.view.frame.size.width/2, 120);
    // 以起始点为路径的起点
    [path moveToPoint:CGPointMake(self.view.frame.size.width/2, 120)];
    // 设置一个终点
    CGPoint endPoint = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height-400);
    // 设置第一个控制点
    CGPoint controlPoint1 = CGPointMake(100, 20);
    // 设置第二个控制点
    CGPoint controlPoint2 = CGPointMake(0, 180);
    // 添加二次贝塞尔曲线
    [path addCurveToPoint:endPoint controlPoint1:controlPoint1 controlPoint2:controlPoint2];
    // 设置另一个起始点
    [path moveToPoint:endPoint];
    // 设置第三个控制点
    CGPoint controlPoint3 = CGPointMake(self.view.frame.size.width, 180);
    // 设置第四个控制点
    CGPoint controlPoint4 = CGPointMake(self.view.frame.size.width-100, 20);
    // 添加二次贝塞尔曲线
    [path addCurveToPoint:startPoint controlPoint1:controlPoint3 controlPoint2:controlPoint4];
    // 设置线断面类型
    path.lineCapStyle = kCGLineCapRound;
    // 设置连接类型
    path.lineJoinStyle = kCGLineJoinRound;
    
    CAShapeLayer *animLayer = [CAShapeLayer layer];
    animLayer.path = path.CGPath;
    animLayer.lineWidth = 2.f;
    animLayer.strokeColor = [UIColor blackColor].CGColor;
    animLayer.fillColor = [UIColor clearColor].CGColor;
    animLayer.strokeStart = 0;
    animLayer.strokeEnd = 1.;
    [self.view.layer addSublayer:animLayer];
    
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.fromValue = @(0);
    animation.toValue = @(1.f);
    animation.duration = 2.0f;
    animation.removedOnCompletion = NO;
    animation.fillMode  = kCAFillModeForwards;
    [animLayer addAnimation:animation forKey:@"strokeEnd"];
    
}

@end
