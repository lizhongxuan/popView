//
//  LZXPopTableView.m
//  popTableTest
//
//  Created by 李仲玄 on 2017/2/25.
//  Copyright © 2017年 李仲玄. All rights reserved.
//

#import "LZXPopView.h"
#import "Masonry.h"
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
@interface LZXPopView()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *popArr;
@property(nonatomic,assign)CGSize popFrame;
@property(nonatomic,assign)Direction direction;
@property(nonatomic,strong)UIButton *btn;
@property(nonatomic,strong)UIButton *bg;
@end
@implementation LZXPopView
- (UIButton *)btn{
    if (_btn == nil) {
        _btn = [[UIButton alloc] init];
        
    }
    return _btn;
}

- (NSMutableArray *)popArr{
    if (_popArr == nil) {
        _popArr = [[NSMutableArray alloc] init];
        
    }
    return _popArr;
}

- (instancetype) initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        
    }
    return self;
}

- (void)initArr:(NSMutableArray *)arr withButton:(UIButton *)btn withSize:(CGSize)frame withDirection:(Direction)direction{
    _direction = direction;
    self.popArr = arr;
    _popFrame = frame;
    self.alpha = 0;
    self.btn = btn;
    //框
    UIImage *Image = [UIImage imageNamed:@"u1225.png"];
    CGFloat ImageW = Image.size.width * 0.5;
    CGFloat ImageH = Image.size.height * 0.5;
    UIImage *Image2 = [Image resizableImageWithCapInsets:UIEdgeInsetsMake(ImageH, ImageW, ImageH, ImageW) resizingMode:UIImageResizingModeStretch];
    //View背景
    UIImageView *imageView = [[UIImageView alloc] initWithImage:Image2];
    
    
    [self addSubview:imageView];
    if (_direction == top) {
        UIImageView *imageView3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrowTop.png"]];
        [self addSubview:imageView3];
        [imageView3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_offset(0);
            float x = self.offsetX;
            if (x > frame.width/2 - 20) {
                x = frame.width/2 - 20;
            }else if(x < -frame.width/2 + 20){
                x = -frame.width/2 + 20;
            }
            make.centerX.mas_offset(-x);
            make.width.mas_offset(20);
            make.height.mas_offset(13);
        }];
        
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.mas_offset(0);
            make.bottom.mas_offset(-10);
        }];
    } else if (_direction == bottom) {
        UIImageView *imageView3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrowBottom.png"]];
        [self addSubview:imageView3];
        [imageView3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_offset(0);
            float x = self.offsetX;
            if (x > frame.width/2 - 20) {
                x = frame.width/2 - 20;
            }else if(x < -frame.width/2 + 20){
                x = -frame.width/2 + 20;
            }
            make.centerX.mas_offset(-x);
            make.width.mas_offset(20);
            make.height.mas_offset(13);
        }];

        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.left.right.mas_offset(0);
            make.top.mas_offset(10);
        }];
    } else if (_direction == left) {
        UIImageView *imageView3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrowLeft.png"]];
        [self addSubview:imageView3];
        [imageView3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_offset(0);
            float y = self.offsetY;
            if (y > frame.height/2 - 20) {
                y = frame.height/2 - 20;
            }else if(y < -frame.width/2 + 20){
                y = -frame.height/2 + 20;
            }
            make.centerY.mas_offset(-y);
            make.width.mas_offset(12);
            make.height.mas_offset(20);
        }];
        
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.top.left.mas_offset(0);
            make.right.mas_offset(-10);
        }];
    } else if (_direction == right) {
        UIImageView *imageView3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrowRight.png"]];
        [self addSubview:imageView3];
        [imageView3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(0);
            float y = self.offsetY;
            if (y > frame.height/2 - 20) {
                y = frame.height/2 - 20;
            }else if(y < -frame.width/2 + 20){
                y = -frame.height/2 + 20;
            }
            make.centerY.mas_offset(-y);
            make.width.mas_offset(12);
            make.height.mas_offset(20);
        }];
        
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.top.right.mas_offset(0);
            make.left.mas_offset(10);
        }];
    }
    
    //View宽高
    if (_direction == top) {
        [self mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(btn.mas_top).offset(_offsetY);
            make.centerX.mas_equalTo(btn).offset(_offsetX);
            make.width.mas_offset(frame.width);
            make.height.mas_offset(30);
        }];
    } else if (_direction == bottom) {
        [self mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(btn.mas_bottom).offset(_offsetY);
            make.centerX.mas_equalTo(btn).offset(_offsetX);
            make.width.mas_offset(frame.width);
            make.height.mas_offset(30);
        }];
    } else if (_direction == left) {
        [self mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(btn.mas_left).offset(_offsetX);
            make.centerY.mas_equalTo(btn).offset(_offsetY);
            make.width.mas_offset(30);
            make.height.mas_offset(frame.height);
        }];
    } else if (_direction == right) {
        [self mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(btn.mas_right).offset(_offsetX);
            make.centerY.mas_equalTo(btn).offset(_offsetY);
            make.width.mas_offset(30);
            make.height.mas_offset(frame.height);
        }];
    }
    

    //tableView
    if (!_tableView) {
        _tableView=[[UITableView alloc]init];
        _tableView.backgroundColor=[UIColor clearColor];
        _tableView.showsVerticalScrollIndicator=NO;
        _tableView.dataSource=self;
        _tableView.delegate=self;
        _tableView.tableFooterView = [[UIView alloc] init];
        [self addSubview:_tableView];
        if (_direction == top) {
            [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.mas_equalTo(self).offset(-20);
                make.left.top.mas_equalTo(self).offset(10);
                make.right.mas_equalTo(self).offset(-10);
            }];
        } else if (_direction == bottom) {
            [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(self).offset(20);
                make.left.mas_equalTo(self).offset(10);
                make.right.bottom.mas_equalTo(self).offset(-10);
            }];
        } else if (_direction == left) {
            [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(self).offset(10);
                make.left.mas_equalTo(self).offset(10);
                make.right.mas_equalTo(self).offset(-20);
                make.bottom.mas_equalTo(self).offset(-10);
            }];
        } else if (_direction == right) {
            [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(self).offset(10);
                make.left.mas_equalTo(self).offset(20);
                make.right.mas_equalTo(self).offset(-10);
                make.bottom.mas_equalTo(self).offset(-10);
            }];
        }
        
    }
    
    
    NSLog(@"%f,%f",_offsetX,_offsetY);
}

- (void)openPop{
    
    _bg.alpha = 0.8;
    
    if (_direction == top) {

        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(_popFrame.height - 30);
        }];
    } else if (_direction == bottom) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(_popFrame.height - 30);
        }];
    } else if (_direction == left) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(_popFrame.width - 30);
        }];
    } else if (_direction == right) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(_popFrame.width - 30);
        }];
    }

    // 更新约束
    [UIView animateWithDuration:0.5 animations:^{
        self.alpha = 1;
        [self.superview layoutIfNeeded];
        
    }];
}

- (void)closePop{
    _bg.alpha = 0;
    if (_direction == top) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(30);
        }];
    } else if (_direction == bottom) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(30);
        }];
    } else if (_direction == left) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(30);
        }];
    } else if (_direction == right) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(30);
        }];
    }
    
    // 更新约束
    [UIView animateWithDuration:0.5 animations:^{
        self.alpha = 0;
        [self.superview layoutIfNeeded];
        
    }];
}

#pragma  mark - datasource
// 返回每组的行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.popArr.count;
    
}

// 返回每一行的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
        cell.backgroundColor = [UIColor clearColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.textLabel.text = self.popArr[indexPath.row];
    
    return cell;
}



// 选中某行
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.btn setTitle:self.popArr[indexPath.row] forState:UIControlStateNormal];
    [self closePop];
    _btn.selected = NO;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}



@end
