//
//  NSAttributedString+LinkBlock.h
//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSObject(NSAttributedStringLinkBlock)
/** 默认情况下计算尺寸，如支持UILable文字排版计算 */
@property (nonatomic,copy) CGRect   (^attr_strSize)(CGFloat maxWidth);
@property (nonatomic,copy) CGRect   (^attr_strSizeWithOptions)(CGFloat maxWidth, NSStringDrawingOptions optoins);
@property (nonatomic,copy) BOOL     (^attr_strIsEqualToAttrStr)(NSAttributedString* attrStr);
/** 加水印 */
@property (nonatomic,copy) UIImage* (^attr_strDrawImgRect)(UIImage* image, CGRect rect);
@end
