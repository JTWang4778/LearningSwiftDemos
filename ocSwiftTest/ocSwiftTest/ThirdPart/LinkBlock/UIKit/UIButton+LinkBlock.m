//
//  UIButton+LinkBlock.m
//
//  Created by NOVO on 15/8/19.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "LinkBlock.h"

@implementation NSObject(UIButtonLinkBlock)
- (UIButton *(^)(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right))btnTitleEdgeInsets
{
    return ^id(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right){
        LinkHandle_REF(UIButton, UIButton)
        LinkGroupHandle_REF(btnTitleEdgeInsets,top,left,bottom,right)
        _self.titleEdgeInsets = UIEdgeInsetsMake(top, left, bottom, right);
        return _self;
    };
}
- (void)setBtnTitleEdgeInsets:(UIButton *(^)(CGFloat, CGFloat, CGFloat, CGFloat))blockTitleEdgeInsets{};

- (UIButton *(^)(CGFloat, CGFloat, CGFloat, CGFloat))btnImageEdgeInsets
{
    return ^id(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right){
        LinkHandle_REF(UIButton, UIButton)
        LinkGroupHandle_REF(btnImageEdgeInsets,top,left,bottom,right)
        _self.imageEdgeInsets = UIEdgeInsetsMake(top, left, bottom, right);
        return _self;
    };
}
- (void)setBtnImageEdgeInsets:(UIButton *(^)(CGFloat, CGFloat, CGFloat, CGFloat))blockImageEdgeInsets{};

- (UIButton *(^)(NSString *, UIControlState))btnTitle
{
    return ^id(NSString* title, UIControlState state){
        LinkHandle_REF(UIButton, UIButton)
        LinkGroupHandle_REF(btnTitle,title,state)
        [_self setTitle:title forState:state];
        return _self;
    };
}
- (void)setBtnTitle:(UIButton *(^)(NSString *, UIControlState))blockSetTitle{};

- (UIButton *(^)(UIColor *, UIControlState))btnTitleColor
{
    return ^id(UIColor* color, UIControlState state){
        LinkHandle_REF(UIButton, UIButton)
        LinkGroupHandle_REF(btnTitleColor,color,state)
        [_self setTitleColor:color forState:state];
        return _self;
    };
}
- (void)setBtnTitleColor:(UIButton *(^)(UIColor *, UIControlState))btnTitleColor{};

- (UIButton *(^)(UIImage *, UIControlState))btnImage
{
    return ^id(UIImage* img, UIControlState state){
        LinkHandle_REF(UIButton, UIButton)
        LinkGroupHandle_REF(btnImage,img,state)
        [_self setImage:img forState:state];
        return _self;
    };
}
- (void)setBtnImage:(UIButton *(^)(UIImage *, UIControlState))blockSetImage{};

- (UIButton *(^)(UIImage *, UIControlState))btnBGImage
{
    return ^id(UIImage* img, UIControlState state){
        LinkHandle_REF(UIButton, UIButton)
        LinkGroupHandle_REF(btnBGImage,img,state)
        [_self setBackgroundImage:img forState:state];
        return _self;
    };
}
- (void)setBtnBGImage:(UIButton *(^)(UIImage *, UIControlState))blockSetBGImage{};

- (UIButton *(^)(UIFont *))btnTitleFont
{
    return ^id(UIFont* font){
        LinkHandle_REF(UIButton, UIButton)
        LinkGroupHandle_REF(btnTitleFont,font)
        _self.titleLabel.labFont(font);
        return _self;
    };
}
- (void)setBtnTitleFont:(UIButton *(^)(UIFont *))blockTitleFontSet{};

- (UIButton *(^)(CGFloat))btnTitleFontSystemSizeSet
{
    return ^id(CGFloat size){
        LinkHandle_REF(UIButton, UIButton)
        LinkGroupHandle_REF(btnTitleFontSystemSizeSet,size)
        _self.titleLabel.labFontSystemSizeSet(size);
        return _self;
    };
}
- (void)setBtnTitleFontSystemSizeSet:(UIButton *(^)(CGFloat))btnTitleFontSystemSizeSet{};

- (UIButton *(^)(NSAttributedString *, UIControlState))btnAttributeTitle
{
    return ^id(NSAttributedString* attrStr , UIControlState state){
        LinkHandle_REF(UIButton, UIButton)
        LinkGroupHandle_REF(btnAttributeTitle,attrStr,state)
        [_self setAttributedTitle:attrStr forState:state];
        return _self;
    };
}
- (void)setBtnAttributeTitle:(UIButton *(^)(NSAttributedString *, UIControlState))blockAttributeTitleSet{};

- (CGFloat (^)())btnTitleFontSystemSizeGet
{
    return ^(){
        LinkHandle_VAL_IFNOT(UIButton){
            return (CGFloat)0.0;
        }
        LinkGroupHandle_VAL(btnTitleFontSystemSizeGet)
        return _self.titleLabel.font.pointSize;
    };
}
- (void)setBtnTitleFontSystemSizeGet:(CGFloat (^)())btnTitleFontSystemSizeGet{};
@end
