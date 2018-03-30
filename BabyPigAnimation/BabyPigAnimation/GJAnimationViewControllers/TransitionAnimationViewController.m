//  您好，谢谢您参考我的项目，如果有问题请移步
//  https://github.com/manofit/BabyPigAnimation
//
//  TransitionAnimationViewController.m
//  BabyPigAnimation
//
//  Created by 高军 on 2018/3/27.
//  Copyright © 2018年 Jun Gao. All rights reserved.
//

#import "TransitionAnimationViewController.h"

@interface TransitionAnimationViewController ()
@property(nonatomic,strong)UILabel *numLabel;
@property(nonatomic,assign)NSInteger index;
@property(nonatomic,assign)TransitionAniType aniType;
@end

@implementation TransitionAnimationViewController

-(instancetype)initWithType:(TransitionAniType)type{
    self = [super init];
    if (self){
        self.aniType = type;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSArray *array_4 = [NSArray arrayWithObjects:@"fade",@"moveIn",@"push",@"reveal",@"cube",@"suck",@"oglFile",@"ripple",@"curl",@"unCurl",@"caOpen",@"caClose", nil];
    self.navigationItem.title = array_4[self.aniType];
    
    _index = 0;
    
    self.numLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.babyView.frame)/2-12.5, CGRectGetHeight(self.babyView.frame)/2-20, 25, 40)];
    self.numLabel.textAlignment = NSTextAlignmentCenter;
    self.numLabel.font = [UIFont systemFontOfSize:40];
    [self.babyView addSubview:self.numLabel];
    
    [self addNumToLabel];
}

-(void)addNumToLabel{
    if (_index > 3){
        _index = 0;
    }
    
    NSArray *colors = [NSArray arrayWithObjects:[UIColor cyanColor],[UIColor magentaColor],[UIColor greenColor],[UIColor purpleColor], nil];
    NSArray *numArray = @[@"1",@"2",@"3",@"4"];
    
    self.babyView.backgroundColor = colors[_index];
    self.numLabel.text = numArray[_index];
    
    _index++;
}

-(void)btnClicked:(UIButton *)btn{
    [super btnClicked:btn];
    switch (self.aniType) {
        case fade:
            [self fade];
            break;
        case moveIn:
            [self moveIn];
            break;
        case push:
            [self push];
            break;
        case reveal:
            [self reveal];
            break;
        case cube:
            [self cube];
            break;
        case suck:
            [self suck];
            break;
        case oglFile:
            [self oglFile];
            break;
        case ripple:
            [self ripple];
            break;
        case curl:
            [self curl];
            break;
        case unCurl:
            [self unCurl];
            break;
        case caOpen:
            [self caOpen];
            break;
        case caClose:
            [self caClose];
            break;
        default:
            break;
    }
}

-(void)fade{
    [self addNumToLabel];
    
    CATransition *transitionAni = [CATransition animation];
    transitionAni.type = kCATransitionFade;
    transitionAni.duration = 1.0f;
    [self.babyView.layer addAnimation:transitionAni forKey:@"fadeAnimation"];
}

-(void)moveIn{
    [self addNumToLabel];
    
    CATransition *transitionAni = [CATransition animation];
    transitionAni.type = kCATransitionMoveIn;
    transitionAni.subtype = kCATransitionFromRight;
    transitionAni.duration = 1.0f;
    [self.babyView.layer addAnimation:transitionAni forKey:@"moveInAnimation"];
}

-(void)push{
    [self addNumToLabel];
    
    CATransition *transitionAni = [CATransition animation];
    transitionAni.type = kCATransitionPush;
    transitionAni.subtype = kCATransitionFromRight;
    transitionAni.duration = 1.0f;
    [self.babyView.layer addAnimation:transitionAni forKey:@"pushAnimation"];
}

-(void)reveal{
    [self addNumToLabel];
    
    CATransition *transitionAni = [CATransition animation];
    transitionAni.type = kCATransitionReveal;
    transitionAni.subtype = kCATransitionFromRight;
    transitionAni.duration = 1.0f;
    [self.babyView.layer addAnimation:transitionAni forKey:@"revealAnimation"];
}

-(void)cube{
    [self addNumToLabel];
    
    CATransition *transitionAni = [CATransition animation];
    transitionAni.type = @"cube";
    transitionAni.subtype = kCATransitionFromRight;
    transitionAni.duration = 1.0f;
    [self.babyView.layer addAnimation:transitionAni forKey:@"cubeAnimation"];
}

-(void)suck{
    [self addNumToLabel];
    
    CATransition *transitionAni = [CATransition animation];
    transitionAni.type = @"suckEffect";
    transitionAni.subtype = kCATransitionFromRight;
    transitionAni.duration = 1.0f;
    [self.babyView.layer addAnimation:transitionAni forKey:@"suckAnimation"];
}

-(void)oglFile{
    [self addNumToLabel];
    
    CATransition *transitionAni = [CATransition animation];
    transitionAni.type = @"oglFlip";
    transitionAni.subtype = kCATransitionFromRight;
    transitionAni.duration = 1.0f;
    [self.babyView.layer addAnimation:transitionAni forKey:@"oglFileAnimation"];
}

-(void)ripple{
    [self addNumToLabel];
    
    CATransition *transitionAni = [CATransition animation];
    transitionAni.type = @"rippleEffect";
    transitionAni.subtype = kCATransitionFromRight;
    transitionAni.duration = 1.0f;
    [self.babyView.layer addAnimation:transitionAni forKey:@"rippleAnimation"];
}

-(void)curl{
    [self addNumToLabel];
    
    CATransition *transitionAni = [CATransition animation];
    transitionAni.type = @"pageCurl";
    transitionAni.subtype = kCATransitionFromRight;
    transitionAni.duration = 1.0f;
    [self.babyView.layer addAnimation:transitionAni forKey:@"curlAnimation"];
}

-(void)unCurl{
    [self addNumToLabel];
    
    CATransition *transitionAni = [CATransition animation];
    transitionAni.type = @"pageUnCurl";
    transitionAni.subtype = kCATransitionFromRight;
    transitionAni.duration = 1.0f;
    [self.babyView.layer addAnimation:transitionAni forKey:@"unCurlAnimation"];
}

-(void)caOpen{
    [self addNumToLabel];
    
    CATransition *transitionAni = [CATransition animation];
    transitionAni.type = @"cameraIrisHollowOpen";
    transitionAni.subtype = kCATransitionFromRight;
    transitionAni.duration = 1.0f;
    [self.babyView.layer addAnimation:transitionAni forKey:@"caOpenAnimation"];
}

-(void)caClose{
    [self addNumToLabel];
    
    CATransition *transitionAni = [CATransition animation];
    transitionAni.type = @"cameraIrisHollowClose";
    transitionAni.subtype = kCATransitionFromRight;
    transitionAni.duration = 1.0f;
    [self.babyView.layer addAnimation:transitionAni forKey:@"caCloseAnimation"];
}



@end
