//
//  LZXPopTableView.h
//  popTableTest
//
//  Created by 李仲玄 on 2017/2/25.
//  Copyright © 2017年 李仲玄. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM (NSUInteger, Direction) {
    top,
    bottom,
    left,
    right,
};
@interface LZXPopView : UIView
@property(nonatomic,assign)float offsetX;
@property(nonatomic,assign)float offsetY;
- (void)openPop;
- (void)closePop;
- (void)initArr:(NSMutableArray *)arr withButton:(UIButton *)btn withSize:(CGSize)frame withDirection:(Direction)direction;
@end
