//
//  NSAttributedString+LinkBlock.m
//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "LinkBlock.h"

@implementation NSObject(NSAttributedStringLinkBlock)
- (CGRect (^)(CGFloat))attr_strSize
{
    return ^(CGFloat maxWidth){
        LinkHandle_VAL_IFNOT(NSAttributedString){
            return CGRectZero;
        }
        LinkGroupHandle_VAL(attr_strSize,maxWidth)
        return [_self boundingRectWithSize:CGSizeMake(maxWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading context:nil];
    };
}
- (void)setAttr_strSize:(CGRect (^)(CGFloat))blockSize{};

- (CGRect (^)(CGFloat, NSStringDrawingOptions))attr_strSizeWithOptions
{
    return ^(CGFloat maxWidth,NSStringDrawingOptions options ){
        LinkHandle_VAL_IFNOT(NSAttributedString){
            return CGRectZero;
        }
        LinkGroupHandle_VAL(attr_strSizeWithOptions,maxWidth,options)
        return [_self boundingRectWithSize:CGSizeMake(maxWidth, MAXFLOAT) options:options context:nil];
    };
}
- (void)setAttr_strSizeWithOptions:(CGRect (^)(CGFloat, NSStringDrawingOptions))blockSizeWithOptions{};

- (BOOL (^)(NSAttributedString *))attr_strIsEqualToAttrStr
{
    return ^(NSAttributedString* attrStr){
        LinkHandle_VAL_IFNOT(NSAttributedString){
            return NO;
        }
        LinkGroupHandle_VAL(attr_strIsEqualToAttrStr,attrStr)
        return [_self isEqualToAttributedString:attrStr];
    };
}
- (void)setAttr_strIsEqualToAttrStr:(BOOL (^)(NSAttributedString *))blockIsEqualToAttrStr{};

- (UIImage *(^)(UIImage *, CGRect))attr_strDrawImgRect
{
    return ^id(UIImage* image, CGRect rect){
        LinkHandle_REF(UIImage , NSAttributedString)
        LinkGroupHandle_REF(attr_strDrawImgRect,image,rect)
        UIGraphicsBeginImageContext(image.size);
        [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
        [_self drawInRect:rect];
        UIImage *newImg = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return newImg;
    };
}
- (void)setAttr_strDrawImgRect:(UIImage *(^)(UIImage *, CGRect))attr_strDrawImgRect{};
@end
