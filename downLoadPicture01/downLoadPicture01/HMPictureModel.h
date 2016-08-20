//
//  HMPictureModel.h
//  loadPictureUseWeb01
//
//  Created by mac on 16/8/20.
//  Copyright © 2016年 itheima. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMPictureModel : NSObject
//名称
@property (nonatomic,copy) NSString *name;
//下载量
@property (nonatomic,copy) NSString *download;
//图标
@property (nonatomic,copy) NSString *icon;
+(instancetype)getModelWithDict:(NSDictionary *)dict;
@end
