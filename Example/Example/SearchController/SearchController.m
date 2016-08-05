//
//  SearchController.m

//  Copyright © 2016年 ellmcz. All rights reserved.
//

#import "SearchController.h"
#import "NSString+Chinese.h"
#import "NSString+Property.h"
@interface SearchController ()<UISearchBarDelegate,UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *searchTop;

@property (weak, nonatomic) IBOutlet UIView *coverView;

/// 第二个搜索关键字 （第一个关键字的拼音）
@property (nonatomic, copy) NSString *titleSelfPinYinPropertyName;
@property (nonatomic, copy) NSString *subSelfPinYinPropertyName;

@property (nonatomic, copy) NSString *titleSelfSubPinYinPropertyName;
/// 第二个搜索关键字（属性名类型：汉字的拼音，如果系统系统返回，需要设置，如果使用自己设置，不需要设置）可选
@property (nonatomic, copy) NSString *subSelfSubPinYinPropertyName;

@end
@implementation SearchController
-(NSMutableArray *)data{
    if (!_data ) {
        _data = [[NSMutableArray alloc] init];
    }
    return _data;
}
-(NSMutableArray *)pinYinData{
    if (!_pinYinData ) {
        _pinYinData = [[NSMutableArray alloc] init];
    }
    return _pinYinData;
}
- (NSMutableArray *)totalData{
    if (!_totalData ) {
        _totalData = [[NSMutableArray alloc] init];
    }
    return _totalData;
}
- (NSMutableArray *)resultData{
    if (!_resultData ) {
        _resultData = [[NSMutableArray alloc] init];
    }
    return _resultData;
}
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if (self=[super initWithNibName:@"SearchController" bundle:nil]) {
        
    }
    return self;
}
- (void)setTitlePropertyName:(NSString *)titlePropertyName{
    _titlePropertyName=titlePropertyName;
    _titleSelfPinYinPropertyName=titlePropertyName.propertyAllPinYin;
    _titleSelfSubPinYinPropertyName=titlePropertyName.propertySubAllPinYin;

}
-  (void)setSubPropertyName:(NSString *)subPropertyName{
    _subPropertyName=subPropertyName;
    _subSelfPinYinPropertyName=subPropertyName.propertyAllPinYin;
    _subSelfSubPinYinPropertyName=subPropertyName.propertySubAllPinYin;
}
- (void)setTitlePinYinPropertyName:(NSString *)titlePinYinPropertyName{
    _titlePinYinPropertyName=titlePinYinPropertyName;
    _titleSelfPinYinPropertyName=_titlePinYinPropertyName;
}
- (void)setSubPinYinPropertyName:(NSString *)subPinYinPropertyName{
    _subPinYinPropertyName=subPinYinPropertyName;
    _subSelfPinYinPropertyName=_subPinYinPropertyName;
}
- (void)setTitleSubPinYinPropertyName:(NSString *)titleSubPinYinPropertyName{
    _titleSubPinYinPropertyName=titleSubPinYinPropertyName;
    _titleSubPinYinPropertyName=titleSubPinYinPropertyName.propertySubAllPinYin;
}
-(void)setSubSubPinYinPropertyName:(NSString *)subSubPinYinPropertyName{
    _subSubPinYinPropertyName=subSubPinYinPropertyName;
    _subSubPinYinPropertyName=subSubPinYinPropertyName.propertySubAllPinYin;
}
- (void)viewDidLoad {
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"SearchContoller.bundle/navigationBar"] forBarMetrics:(UIBarMetricsDefault)];
    self.tableView.sectionIndexColor=[UIColor blackColor];
    
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark ---------------------  搜索代理方法  ---------------------------
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
    [self.navigationController setNavigationBarHidden:YES animated:YES];
   
   self.searchTop.constant=20;
    [UIView animateWithDuration:0.25 animations:^{
        self.searchBar.showsCancelButton=YES;
        self.activie=NO;
        self.coverView.hidden=NO;
      [self.tableView reloadData];
        
    }];
}
- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar{
    self.searchTop.constant=0;
   
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [UIView animateWithDuration:0.25 animations:^{
        [self.view layoutIfNeeded];
        self.searchBar.showsCancelButton=NO;
        self.coverView.hidden=YES;
       
        [self.resultData removeAllObjects];
        [self.tableView reloadData];
        
    }];
}
-  (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    if (searchText.length >0) {
        [self.navigationController setNavigationBarHidden:YES animated:YES];
        self.searchTop.constant=20;

        [self updateSearchResultWithSearchText:searchText];
         self.activie=YES;
        [UIView animateWithDuration:0.25 animations:^{

            self.coverView.hidden=YES;
            [self.tableView reloadData];
        }];
    }else{
        [UIView animateWithDuration:0 animations:^{
            [self.resultData removeAllObjects];
             self.activie=NO;
            self.coverView.hidden=NO;
           [self.tableView reloadData];
        }];
    }
}
-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    self.searchBar.text=nil;
    [self.resultData removeAllObjects];
    self.activie=NO;
    [self.tableView reloadData];
    [self.view endEditing:YES];
}
#pragma mark ---------------------  蒙板手势点击 ---------------------------
- (IBAction)tap:(UITapGestureRecognizer *)sender {
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    self.searchTop.constant=64;
    [UIView animateWithDuration:0.25 animations:^{
        self.coverView.hidden=YES;
        self.searchBar.showsCancelButton=NO;
        [self.resultData removeAllObjects];
        [self.tableView reloadData];
        [self.view endEditing:YES];
        
    } completion:^(BOOL finished) {
        
        [self.view layoutIfNeeded];
    }];
    
}
#pragma mark ---------------------  更新搜索结果  ---------------------------
- (void)updateSearchResultWithSearchText:(NSString *)searchText{
    searchText=searchText.uppercaseString;
    [self.resultData removeAllObjects];
    if (self.subPropertyName) {
        for (id model in self.data) {
            if ([[model valueForKey:self.titlePropertyName] containsString:searchText]||[[model valueForKey:self.titleSelfPinYinPropertyName] containsString:searchText]||[[model valueForKey:self.titleSelfSubPinYinPropertyName] containsString:searchText]||[[model valueForKey:self.subPropertyName] containsString:searchText]||[[model valueForKey:self.subSelfPinYinPropertyName] containsString:searchText]||[[model valueForKey:self.subSelfSubPinYinPropertyName] containsString:searchText]) {
                [self.resultData addObject:model];
            }
        }
       
    }else{
        for (id model in self.data) {
            if ([[model valueForKey:self.titlePropertyName] containsString:searchText]||[[model valueForKey:self.titleSelfPinYinPropertyName] containsString:searchText]||[[model valueForKey:self.titleSelfSubPinYinPropertyName] containsString:searchText]) {
                [self.resultData addObject:model];
            }
        }
    }
}

#pragma mark --------------------- TableView代理方法  ---------------------------
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.isActive?1:self.totalData.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.isActive?self.resultData.count:[self.totalData[section] count];
}
#pragma mark --------------------- TableView数据源方法 ---------------------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *Cell=@"Cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:Cell];
    
    id model=self.isActive?self.resultData[indexPath.row]:self.totalData[indexPath.section][indexPath.row];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:Cell];
    }
    cell.textLabel.text=[model valueForKey:self.titlePropertyName];
    return cell;
}
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
     return self.isActive?nil:[self.pinYinData copy];
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return self.isActive?[NSString stringWithFormat:@"共有%ld条数据",(unsigned long)self.resultData.count]:self.pinYinData[section];
    
}


@end
