//
//  SearchHeader.h
//  sssss
//
//  Created by 王钱宝 on 16/6/28.
//  Copyright © 2016年 ellmcz. All rights reserved.
//

#ifndef SearchHeader_h
#define SearchHeader_h
#if __has_include(<SearchHeader/SearchHeader.h>)
FOUNDATION_EXPORT double SortPropertyVersion;
FOUNDATION_EXPORT const unsigned char SortPropertyVersionString[];
#import <SearchHeader/NSArray+Sort.h>
#import <SearchHeader/NSString+Chinese.h>
#import <SearchHeader/NSMutableArray+Only.h>
#import <SearchHeader/NSString+Pure.h>
#import <SearchHeader/NSString+Property.h>
#import <SearchHeader/SortedProperty.h>
#import <SearchHeader/NSMutableArray+Sort.h>
#else
#import "NSArray+Sort.h"
#import "NSString+Chinese.h"
#import "SortedProperty.h"
#import "NSMutableArray+Only.h"
#import "NSMutableArray+Sort.h"
#import "NSString+Pure.h"
#import "NSString+Property.h"
#endif

#if __has_include(<SearchHeader/SearchHeader.h>)
#import <SearchHeader/SearchHeader.h>
#elif __has_include(<SearchHeader/SearchHeader.h>)
#import <SearchHeader/NSArray+Sort.h>
#import <SearchHeader/NSString+Chinese.h>
#import <SearchHeader/NSMutableArray+Only.h>
#import <SearchHeader/NSString+Pure.h>
#import <SearchHeader/NSString+Property.h>
#import <SearchHeader/SortedProperty.h>
#import <SearchHeader/NSMutableArray+Sort.h>
#import <SearchHeader/SearchController.h>
#else
#import "NSArray+Sort.h"
#import "NSString+Chinese.h"
#import "SortedProperty.h"
#import "NSMutableArray+Only.h"
#import "NSMutableArray+Sort.h"
#import "NSString+Pure.h"
#import "NSString+Property.h"
#import "SearchController.h"
#endif

#if __has_include(<SearchHeader/SearchHeader.h>)
#import <SearchHeader/SearchHeader.h>
#elif __has_include(<SearchHeader/SearchHeader.h>)
#import <SearchHeader/NSArray+Sort.h>
#import <SearchHeader/NSString+Chinese.h>
#import <SearchHeader/NSMutableArray+Only.h>
#import <SearchHeader/NSString+Pure.h>
#import <SearchHeader/NSString+Property.h>
#import <SearchHeader/SortedProperty.h>
#import <SearchHeader/NSMutableArray+Sort.h>
#import <SearchHeader/SearchController.h>
#else
#import "NSArray+Sort.h"
#import "NSString+Chinese.h"
#import "SortedProperty.h"
#import "NSMutableArray+Only.h"
#import "NSMutableArray+Sort.h"
#import "NSString+Pure.h"
#import "NSString+Property.h"
#import "SearchController.h"
#endif

//
#define Property_hSubFirstPinYin(Name)  @property (nonatomic, copy) NSString *propertyFirstPinYin##Name;
#define Property_hBool(Name)    @property (nonatomic, assign) BOOL is##Name;
#define Property_hAllPigYin(Name)  @property (nonatomic, copy) NSString *propertyAllPinYin##Name;
#define Property_hSubAllPigYin(Name)  @property (nonatomic, copy) NSString *propertySubAllPinYin##Name;
//

#endif /* SearchHeader_h */
