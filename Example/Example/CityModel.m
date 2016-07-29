//
//  CityModel.m
//  搜索
//

//  Copyright © 2016年 ellmcz. All rights reserved.
//

#import "CityModel.h"

@implementation CityModel
- (void)setName:(NSString *)name{
    _name=name;
    _propertyFirstPinYinName=name.subFirstPinYinString;
    _propertyAllPinYinName=name.allUpperPinYinString;
    _propertySubAllPinYinName=name.subAllPinYinString;
}
@end
