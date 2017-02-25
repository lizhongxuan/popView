# popView
This is similar to the wheels of the PopTableViewController in iPad .


# English
## Introduce
This is a similar popTableView of Ipad.The difference is the screen of the limitations of the iphone.So, Define a UIView contains the TableView.Make popView can slide up and down, to display the content of more than screen space.


## USE
One of the most important line of code : [self.popView initArr:arr withButton:_btn withSize:popFrame withDirection:right];

The corresponding argument parsing:

 1  The content of the tableview. <br />
 2  Determine which button will pop up after clicking popView. <br />
 3  Determine the popView show wide high. <br />
 4  Determine popView show direction. <br />
typedef NS_ENUM (NSUInteger, Direction) { <br />
>   top,//Display in the button top <br />
  >  bottom,//Display in the button bottom <br />
  >  left,//Display in the button left <br />
    right,//Display in the button right <br />
};

 PopView attributes: used to modify popView offset (popView alignment among the button by default) <br />
offsetY <br />
offsetX

[the self popView openPop];/ / open popView <br />
[the self popView closePop];/ / close popView

Note that the documents need to use Masonry constraints, and LZXPopTableView. m of didSelectRowAtIndexPath to demand changes.

The specific use the demo. <br />
Welcome to modify my code. <br />

# 中文
## 介绍
这是一个类似ipad中的popTableView  ,不同的是iphone的屏幕有限,所以定义一个UIView包含了TableView.使popView可以上下滑动,能展示比屏幕空间还多的内容.


## 使用
最重要的一行代码:[self.popView initArr:arr withButton:_btn withSize:popFrame withDirection:right]; <br />
对应的参数: <br />
1.用NSMutableArray存放tableview的内容. <br />
2.确定哪个button点击后会弹出popView. <br />
3.确定popView展现的宽高. <br />
4.确定popView展现的方向. <br />
typedef NS_ENUM (NSUInteger, Direction) { <br />
> top,//button上方展现  <br />
>  bottom,//button下方展现 <br />
>  left,//button左方展现 <br />
>   right,//button右方展现 <br />
};

popView属性:用来修改popView的偏移(popView默认对齐button中间) <br />
offsetY <br />
offsetX

[self.popView openPop];//打开popView <br />
[self.popView closePop];//关闭popView

要注意的是,文件需要用到Masonry的约束,还有LZXPopTableView.m中的didSelectRowAtIndexPath可供需求自行修改. <br />
具体使用看demo吧. <br />
欢迎大家修改我的代码.
