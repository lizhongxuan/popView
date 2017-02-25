//
//  ViewController.m
//  popTableTest
//
//  Created by 李仲玄 on 2017/2/25.
//  Copyright © 2017年 李仲玄. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "LZXPopView.h"



@interface ViewController ()
@property (nonatomic,strong)LZXPopView *popView;
@property (nonatomic,strong)UIButton *btn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 50)];
    _btn.backgroundColor = [UIColor blackColor];
    [_btn setTitle:@"点击" forState:UIControlStateNormal];
    [_btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btn];

    NSArray *arr2 = @[@"aaa",@"bbb",@"ccc",@"ddd",@"eee",@"fff"];
    NSMutableArray *arr = [[NSMutableArray alloc] initWithArray:arr2 copyItems:YES];
    CGSize popFrame = CGSizeMake(140, 200);
    
    _popView = [[LZXPopView alloc] init];
    [self.view addSubview:_popView];
    _popView.offsetY = 0;
    [self.popView initArr:arr withButton:_btn withSize:popFrame withDirection:right];
    
    
}
//点击空白处回收键盘
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    _btn.selected = NO;
    [self.popView closePop];
    NSLog(@"1");
}
- (void)btnClick{
    if (_btn.isSelected) {
        _btn.selected = NO;
        [self.popView closePop];
        NSLog(@"2");
    } else {
        _btn.selected = YES;
        [self.popView openPop];
        NSLog(@"3");
        
    }
    
}


@end
