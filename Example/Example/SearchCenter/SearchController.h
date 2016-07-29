//
//  SearchController.h
//
//  Copyright © 2016年 ellmcz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchController : UIViewController
/// 数据数组
@property (nonatomic, strong) NSMutableArray *data;
/// 拼音数组
@property (nonatomic, strong) NSMutableArray *pinYinData;
///新数组
@property (nonatomic, strong) NSMutableArray *totalData;
/// 第一个搜索关键字（属性名类型：汉字）
@property (nonatomic, copy) NSString *titlePropertyName;
/// 第三个搜索关键字 （属性名：可选）
@property (nonatomic, copy) NSString *subPropertyName;
/// 第一个搜索关键字（属性名类型：汉字的拼音，如果系统系统返回，需要设置，如果使用自己设置，不需要设置）可选
@property (nonatomic, copy) NSString *titlePinYinPropertyName;
/// 第二个搜索关键字（属性名类型：汉字的拼音，如果系统系统返回，需要设置，如果使用自己设置，不需要设置）可选
@property (nonatomic, copy) NSString *subPinYinPropertyName;

@property (nonatomic, copy) NSString *titleSubPinYinPropertyName;
/// 第二个搜索关键字（属性名类型：汉字的拼音，如果系统系统返回，需要设置，如果使用自己设置，不需要设置）可选
@property (nonatomic, copy) NSString *subSubPinYinPropertyName;

/// 是不是开始搜索
@property (nonatomic, assign,getter=isActive) BOOL activie;

@property (nonatomic, strong) NSMutableArray *resultData ;

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
