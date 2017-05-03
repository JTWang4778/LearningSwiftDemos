//
//  NSMutableAttributedString+LinkBlock.h

//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define NSMutableAttributedStringNew ([NSMutableAttributedString new])
@interface NSObject(NSMutableAttributedStringLinkBlock)
@property (nonatomic,copy) NSMutableAttributedString* (^m_attr_strAppendAttrStr)(NSAttributedString* attrStr);
@property (nonatomic,copy) NSMutableAttributedString* (^m_attr_strAppendStr)(NSString* str);
@property (nonatomic,copy) NSMutableAttributedString* (^m_attr_strAppendStrAndAttr)(NSString *str,NSString *attrName, id attrValue);
@property (nonatomic,copy) NSMutableAttributedString* (^m_attr_strAppendStrWithAttrDict)(NSString* str, NSDictionary* attrDic);

@property (nonatomic,copy) NSMutableAttributedString* (^m_attr_strInsertAttrStrAtIndex)(NSAttributedString* attrStr, NSUInteger index);
@property (nonatomic,copy) NSMutableAttributedString* (^m_attr_strInsertStrAtIndex)(NSString* str , NSUInteger index);
@property (nonatomic,copy) NSMutableAttributedString* (^m_attr_strInsertStrWithAttrAtIndex)(NSString *str,NSString *attrName, id attrValue,NSUInteger idx);
@property (nonatomic,copy) NSMutableAttributedString* (^m_attr_strInsertStrWithAttrDict)(NSString* str, NSDictionary* attrDic, NSUInteger index);

/** 注意：需要计算大小时必须设置的属性 */
@property (nonatomic,copy) NSMutableAttributedString* (^m_attr_strAddAttrFont)(UIFont* font);
/** 注意：需要计算大小时必须设置的属性 */
@property (nonatomic,copy) NSMutableAttributedString* (^m_attr_strAddAttrTextColor)(UIColor* color);

@property (nonatomic,copy) NSMutableAttributedString* (^m_attr_strAddAttrInRange)(NSString*attrName, id attrValue, NSRange range);
@property (nonatomic,copy) NSMutableAttributedString* (^m_attr_strAddAttr)(NSString*attrName, id attrValue);
@property (nonatomic,copy) NSMutableAttributedString* (^m_attr_strAddAttrDict)(NSDictionary* attrDict);

@property (nonatomic,copy) NSMutableAttributedString* (^m_attr_strAddAttrBGColor)(UIColor* bgColor);

@property (nonatomic,copy) NSMutableAttributedString* (^m_attr_strRemoveAttr)(NSString* attrName);
@property (nonatomic,copy) NSMutableAttributedString* (^m_attr_strRemoveAttrInRange)(NSString* attrName, NSRange range);

@property (nonatomic,copy) NSMutableAttributedString* (^m_attr_strDeleteStrInRange)(NSRange range);
@property (nonatomic,copy) NSMutableAttributedString* (^m_attr_strReplaceStrWithStrInRange)(NSString *str,NSRange range);

/** 给匹配的内容设置属性 */
@property (nonatomic,copy) NSMutableAttributedString* (^m_attr_strSetAttrForStr)(NSString *forStr,NSDictionary* attrDict);
/** 给匹配的内容设置属性 */
@property (nonatomic,copy) NSMutableAttributedString* (^m_attr_strSetAttrForStrInRange)(NSString *forStr,NSDictionary* attrDict, NSRange);

@property (nonatomic,copy) NSMutableAttributedString* (^m_attr_strSetAttrDictInRange)(NSDictionary *attrDict, NSRange range);
@property (nonatomic,copy) NSMutableAttributedString* (^m_attr_strSetAttrDict)(NSDictionary* attrDict);


/** 默认情况下计算尺寸，如支持UILable文字排版计算 */
@property (nonatomic,copy) CGRect   (^m_attr_strSize)(CGFloat maxWidth);
@property (nonatomic,copy) CGRect   (^m_attr_strSizeWithOptions)(CGFloat maxWidth, NSStringDrawingOptions optoins);
@property (nonatomic,copy) BOOL     (^m_attr_strIsEqualToAttrStr)(NSAttributedString* attrStr);
/** 加水印 */
@property (nonatomic,copy) UIImage* (^m_attr_strDrawImgRect)(UIImage* image, CGRect rect);
@end
