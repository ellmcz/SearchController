//
//  SearchHeader.h
//  sssss
//
//  Created by 王钱宝 on 16/6/28.
//  Copyright © 2016年 ellmcz. All rights reserved.
//

#ifndef SearchHeader_h
#define SearchHeader_h

#import "NSArray+Sort.h"
#import "NSString+Chinese.h"
#import "SortedProperty.h"
#import "NSMutableArray+Only.h"
#import "NSMutableArray+Sort.h"
#import "NSString+Pure.h"
#import "SearchController.h"

//
#define Property_hSubFirstPinYin(Name)  @property (nonatomic, copy) NSString *propertyFirstPinYin##Name;
#define Property_hBool(Name)    @property (nonatomic, assign) BOOL is##Name;
#define Property_hAllPigYin(Name)  @property (nonatomic, copy) NSString *propertyAllPinYin##Name;
#define Property_hSubAllPigYin(Name)  @property (nonatomic, copy) NSString *propertySubAllPinYin##Name;
//

#endif /* SearchHeader_h */
