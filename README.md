# LLFMDB
高度二次封装FMDB 一键调用缓存 傻瓜式操作 让您再也不用因为缓存而烦恼

![LLFMDB.Gif](https://github.com/liuniuliuniu/LLFMDB/blob/master/LLFMDB.gif)

## 导航

* [实现功能](#function)
* [如何添加](#add)
* [使用详情](#detail)
* [Hope](#hope)


## <a id="function"></a>实现功能
* 写入数据  value类型包括：NSString, NSNumber, NSDictionary和NSArray 操作完成会自动关闭数据库
* 读取数据  value类型包括：NSString, NSNumber, NSDictionary和NSArray
* 删除指定key的数据
* 批量删除一组key数组的数据

## <a id="add"></a>如何添加

* 待支持cocoapod

* 手动添加
 - 把`LLFMDB`文件夹拉到项目中
 - 添加头文件`#import "LLKeyValueStore.h"`
 - 还要添加一些依赖库 `pod 'FMDB' ,'~> 2.7.2'`


## <a id="detail"></a>使用详情（具体看 `LLFMDBDemo` 示例）

```
// 1 建表  内部已经处理好 如果已经有此表就不会重复创建
 [[LLKeyValueStore shareStore] createDBWithTableName:LLTableViewControllerTabName];

// 2 保存对象  指定id
 [[LLKeyValueStore shareStore]putObject:self.dataArr withId:LLTableViewControllerTabID intoTable:LLTableViewControllerTabName];

// 3 获取对象 指定id
    self.dataArr = [[LLKeyValueStore shareStore]getObjectById:LLTableViewControllerTabID fromTable:LLTableViewControllerTabName];

// 4 删除对象 指定id
[[LLKeyValueStore shareStore]deleteObjectById:LLTableViewControllerTabID fromTable:LLTableViewControllerTabName];
 
```
> 此处如果往数据库存数组 不要存模型数组 可以存网络请求回来的数据数组  然后使用的时候从数据库取出数组在进行json转模型数组使用
> 
>更多其他使用方法 详见demo



## <a id="hope"></a>Hope
* 代码使用过程中，发现任何问题，可以随时issue
* 如果有更多建议或者想法也可以直接联系我 QQ:416997919
* 本人简书地址  也可随时在简书留言[LLFMDB](http://www.jianshu.com/p/8f9465413e70)
* 觉得框架对你有一点点帮助的，就请支持下，点个赞。


