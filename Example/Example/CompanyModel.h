//
//  CompanyModel.h
//  SortChineseOrNumber
//
//  Copyright © 2016年 ellmcz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SearchHeader.h"

@interface CompanyModel : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *month;
@property (nonatomic, assign) int rating;
Property_hSubFirstPinYin(Title)
Property_hAllPigYin(Title)
Property_hSubAllPigYin(Title)
Property_hAllPigYin(Name)
Property_hSubAllPigYin(Name)
Property_hSubFirstPinYin(Name)
Property_hSubFirstPinYin(Month)
Property_hBool(Rating)

@end
