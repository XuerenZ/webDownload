//
//  HMPictureModel.m
//  loadPictureUseWeb01
//
//  Created by mac on 16/8/20.
//  Copyright © 2016年 itheima. All rights reserved.
//

#import "HMPictureModel.h"

@implementation HMPictureModel
+(instancetype)getModelWithDict:(NSDictionary *)dict
{
    HMPictureModel *model = [[HMPictureModel alloc]init];
    [model setValuesForKeysWithDictionary:dict];
    return model;
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{}
@end
