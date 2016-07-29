//
//  ViewController.m
//  ss
//
//  Copyright © 2016/ ellmcz. All rights reserved.
//
#import "ViewController.h"
#import "CompanyModel.h"
#import "CityModel.h"
#import "MJExtension.H"
#import "SearchHeader.h"


@interface ViewController ()

@end

@implementation ViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"公司搜索";
    CompanyModel *companyModel=[[CompanyModel alloc]init];
    companyModel.title=@"搜狐";
    companyModel.month=@"2016年06月22日";
    companyModel.name=@"张朝阳";
    companyModel.rating=10;
    CompanyModel *companyModel1=[[CompanyModel alloc]init];
    companyModel1.title=@"百度";
    companyModel1.month=@"2016年03月22日";
    companyModel1.name=@"李彦宏";
    companyModel1.rating=9;
    CompanyModel *companyModel2=[[CompanyModel alloc]init];
    companyModel2.title=@"腾讯";
    companyModel2.month=@"2016年04月22日";
    companyModel2.rating=4;
    companyModel2.name=@"马化腾";
    CompanyModel *companyModel3=[[CompanyModel alloc]init];
    companyModel3.title=@"阿里巴巴";
    companyModel3.month=@"2016年02月22日";
    companyModel3.name=@"马云";
    companyModel3.rating=3;
    CompanyModel *companyModel4=[[CompanyModel alloc]init];
    companyModel4.title=@"网易";
    companyModel4.month=@"2016年01月22日";
    companyModel4.name=@"丁磊";
    companyModel4.rating=1;
    CompanyModel *companyModel5=[[CompanyModel alloc]init];
    companyModel5.title=@"苹果";
    companyModel5.rating=3;
    companyModel5.month=@"2016年02月22日";
    companyModel5.name=@"乔布斯";
    CompanyModel *companyModel6=[[CompanyModel alloc]init];
    companyModel6.title=@"微软";
    companyModel6.rating=3;
    companyModel6.month=@"2016年02月22日";
    companyModel6.name=@"比尔.盖茨";
    CompanyModel *companyModel7=[[CompanyModel alloc]init];
    companyModel7.title=@"伯克希尔.哈撒韦";
    companyModel7.rating=3;
    companyModel7.month=@"2016年03月22日";
    companyModel7.name=@"巴菲特";
    CompanyModel *companyModel8=[[CompanyModel alloc]init];
    companyModel8.title=@"万科";
    companyModel8.rating=5;
    companyModel8.month=@"2016年09月22日";
    companyModel8.name=@"王石";
    CompanyModel *companyModel9=[[CompanyModel alloc]init];
    companyModel9.title=@"中石油";
    companyModel9.rating=5;
    companyModel9.month=@"2016年09月22日";
    companyModel9.name=@"傅成玉";
    CompanyModel *companyModel10=[[CompanyModel alloc]init];
    companyModel10.title=@"比亚迪";
    companyModel10.rating=5;
    companyModel10.month=@"2015年12月22日";
    companyModel10.name=@"王传福";
    CompanyModel *companyModel11=[[CompanyModel alloc]init];
    companyModel11.title=@"华为";
    companyModel11.rating=5;
    companyModel11.month=@"2015年12月22日";
    companyModel11.name=@"任正非";
   
    [self.data addObjectsFromArray:@[companyModel,companyModel1,companyModel2,companyModel3,companyModel4,companyModel5,companyModel6,companyModel7,companyModel8,companyModel9,companyModel10,companyModel11]];
   
   
        self.pinYinData=[SortedProperty sortedTitleStringWithArray:self.data PropertyName:@"title"];
    self.totalData=[SortedProperty sortedModelStringWithArray:self.data PinYinData:self.pinYinData PropertyName:@"title"];
//    self.pinYinData=[SortedProperty sortedTitleSameDateWithArray:self.data PropertyName:@"month"];
//    self.totalData=[SortedProperty sortedModelSameDateWithArray:self.data PinYinData:self.pinYinData PropertyName:@"month"];

    self.searchBar.placeholder=@"我想去上班的公司";
    self.titlePropertyName=@"title";
//    self.titleSubPinYinPropertyName=@"title";
    self.subPropertyName=@"name";
//    self.subSubPinYinPropertyName=@"name";
   
    
    
    
    
////
//
//    CityModel *cityModel=[[CityModel alloc]init];
//    cityModel.name=@"甘谷";
//    cityModel.code=@"1111";
//    cityModel.spell=@"gangu";
//    NSArray *arrayM=@[cityModel];
//    self.data=[CityModel mj_objectArrayWithFilename:@"chinacities.plist"];
//    self.pinYinData=[SortedProperty sortedSelfTitleCityWithStringFirstTitle:@"" SecondTitle:@"热"];
//    self.totalData=[SortedProperty sortedSelfCityModelCityWithArray:self.data PinYinData:self.pinYinData PropertyName:@"name" FirstArray:(NSMutableArray *)arrayM SecondArray:(NSMutableArray *)arrayM];
//    self.title=@"城市切换";
//    self.titlePropertyName=@"name";
//    self.titleSubPinYinPropertyName=@"name";
//    self.subPropertyName=@"code";
//    self.subPinYinPropertyName=@"code";
//    
//    NSLog(@"%@",[[NSDate date] constellation]);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *Cell=@"Cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:Cell];
    
    id model=self.isActive?self.resultData[indexPath.row]:self.totalData[indexPath.section][indexPath.row];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleSubtitle) reuseIdentifier:Cell];
    }
    cell.textLabel.text=[model valueForKey:self.titlePropertyName];
   cell.detailTextLabel.text=[model valueForKey:self.subPropertyName];
    return cell;
}

@end
