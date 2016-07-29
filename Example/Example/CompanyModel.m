//
//  CompanyModel.m
//  SortChineseOrNumber
//
//  Copyright © 2016年 ellmcz. All rights reserved.
//

#import "CompanyModel.h"

@implementation CompanyModel
-(void)setTitle:(NSString *)title{
    _title=title;
    _propertyFirstPinYinTitle=title.subFirstPinYinString;
    _propertyAllPinYinTitle=title.allUpperPinYinString;
    _propertySubAllPinYinTitle=title.subAllPinYinString;
    
}
- (void)setMonth:(NSString *)month{
    _month=month;
    _propertyFirstPinYinMonth=[SortedProperty settingPropertyNameDateWithDateTpye:(DateTypeChineseYear) PropertyName:month];
    
   
   
}
- (void)setRating:(int)rating{
    _rating=rating;
    _isRating=[SortedProperty settingPropertyNameWithRating:rating Min:8];
}
-(void)setName:(NSString *)name{
    _name=name;
    _propertyFirstPinYinName=name.subFirstPinYinString;
    _propertyAllPinYinName=name.allUpperPinYinString;
    _propertySubAllPinYinName=name.subAllPinYinString;
   
}
-(BOOL)isEqual:(CompanyModel *)otherCompanyModel{
    return [self.propertyFirstPinYinName isEqualToString:otherCompanyModel.propertyFirstPinYinName];
}
@end
