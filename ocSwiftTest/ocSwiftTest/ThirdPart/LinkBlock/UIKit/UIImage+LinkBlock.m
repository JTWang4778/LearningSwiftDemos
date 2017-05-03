//
//  UIImage+LinkBlock.m

//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//
#import "LinkBlock.h"
#import <Accelerate/Accelerate.h>

@implementation NSObject(UIImageLinkBlockLinkBlock)

- (NSData *(^)(float))imgToData
{
    return ^id(float ratio){
        LinkHandle_REF(NSData, UIImage)
        LinkGroupHandle_REF(imgToData,ratio)
        NSData* reIsData = UIImageJPEGRepresentation(_self, ratio);
        if(!reIsData){
            reIsData= UIImagePNGRepresentation(_self);
        }
        return reIsData;
    };
}
- (void)setImgToData:(NSData *(^)(float))imgToData{};

- (UIImage *(^)(CGSize))imgResizeAspect
{
    return ^id(CGSize maxSize){
        LinkHandle_REF(UIImage, UIImage)
        LinkGroupHandle_REF(imgResizeAspect,maxSize)
        CGFloat originWidth= _self.size.width;
        CGFloat originHeight= _self.size.height;
        CGFloat originRatio = originWidth / originHeight;//宽长比
        if(originWidth > maxSize.width || originHeight > maxSize.height)
        {
            CGFloat toRatio = maxSize.width / maxSize.height;//将要压缩到的宽长比
            if(originRatio > toRatio){//横向压，固定宽
                originRatio = maxSize.width / originWidth;
                originHeight = originRatio * originHeight;
                originWidth = maxSize.width;
            } else {//竖向压，固定高
                originRatio = maxSize.height / originHeight;
                originWidth = originRatio * originWidth;
                originHeight = maxSize.height;
            }
        }
        CGRect rect = CGRectMake(0.0, 0.0, originWidth, originHeight);
        UIGraphicsBeginImageContext(rect.size);
        [_self drawInRect:rect];  // scales image to rect
        UIImage* re = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return re;
    };
}
- (void)imgResizeAspect:(UIImage *(^)(CGSize))imgResize{};

- (UIImage *(^)(CGRect))imgCut
{
    return ^id(CGRect frame){
        LinkHandle_REF(UIImage, UIImage)
        LinkGroupHandle_REF(imgCut,frame)
        CGImageRef cgImgRef= CGImageCreateWithImageInRect(_self.CGImage, frame);
        UIImage* re= [UIImage imageWithCGImage:cgImgRef];
        CGImageRelease(cgImgRef);
        return re;
    };
}
- (void)setImgCut:(UIImage *(^)(CGRect))imgCut{};

- (UIImage *(^)(float))imgBlur
{
    return ^id(float percent){
        LinkHandle_REF(UIImage, UIImage)
        LinkGroupHandle_REF(imgBlur,percent)
        if ((percent < 0.0f) || (percent > 1.0f)) {
            percent = 0.5f;
        }
        
        int boxSize = (int)(percent * 100);
        boxSize -= (boxSize % 2) + 1;
        
        CGImageRef img = _self.CGImage;
        
        vImage_Buffer inBuffer, outBuffer;//图像缓存,输入缓存，输出缓存
        vImage_Error error;
        void *pixelBuffer;//像素缓存
        
        CGDataProviderRef inProvider = CGImageGetDataProvider(img);
        CFDataRef inBitmapData = CGDataProviderCopyData(inProvider);
        
        inBuffer.width = CGImageGetWidth(img);
        inBuffer.height = CGImageGetHeight(img);
        inBuffer.rowBytes = CGImageGetBytesPerRow(img);
        inBuffer.data = (void*)CFDataGetBytePtr(inBitmapData);
        
        pixelBuffer = malloc(CGImageGetBytesPerRow(img) * CGImageGetHeight(img));//像数缓存，字节行*图片高
        
        outBuffer.data = pixelBuffer;
        outBuffer.width = CGImageGetWidth(img);
        outBuffer.height = CGImageGetHeight(img);
        outBuffer.rowBytes = CGImageGetBytesPerRow(img);
        
        //第三个中间的缓存区,抗锯齿的效果
        void *pixelBuffer2 = malloc(CGImageGetBytesPerRow(img) * CGImageGetHeight(img));
        vImage_Buffer outBuffer2;
        outBuffer2.data = pixelBuffer2;
        outBuffer2.width = CGImageGetWidth(img);
        outBuffer2.height = CGImageGetHeight(img);
        outBuffer2.rowBytes = CGImageGetBytesPerRow(img);
        
        //Convolves a region of interest within an ARGB8888 source image by an implicit M x N kernel that has the effect of a box filter.
        error = vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer2, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
        error = vImageBoxConvolve_ARGB8888(&outBuffer2, &inBuffer, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
        error = vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
        
        if (error) {
            NSLog(@"blur error（高斯模糊错误 %ld\r\nCode in:[%@.m line%d >> %s]\r\n",
                  error,
                  NSStringFromClass([_self class]),__LINE__,__FUNCTION__);
        }
        
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        CGContextRef ctx = CGBitmapContextCreate(
                                                 outBuffer.data,
                                                 outBuffer.width,
                                                 outBuffer.height,
                                                 8,
                                                 outBuffer.rowBytes,
                                                 colorSpace,
                                                 CGImageGetBitmapInfo(_self.CGImage));
        
        CGImageRef imageRef = CGBitmapContextCreateImage (ctx);
        UIImage *returnImage = [UIImage imageWithCGImage:imageRef];
        
        CGContextRelease(ctx);
        CGColorSpaceRelease(colorSpace);
        free(pixelBuffer);
        free(pixelBuffer2);
        CFRelease(inBitmapData);
        CGImageRelease(imageRef);
        return returnImage;
    };
}
- (void)setImgBlur:(UIImage *(^)(float))imgBlur{};

- (UIImage *(^)(UIImageRenderingMode))imgRenderingMode
{
    return ^id(UIImageRenderingMode mode){
        LinkHandle_REF(UIImage, UIImage)
        LinkGroupHandle_REF(imgRenderingMode,mode)
        return [_self imageWithRenderingMode:mode];
    };
}
- (void)setImgRenderingMode:(UIImage *(^)(UIImageRenderingMode))imgRenderingMode{};

- (UIImage *(^)(UIImage *, CGRect))imgAddImg
{
    return ^id(UIImage* aImg , CGRect rect){
        LinkHandle_REF(UIImage, UIImage)
        LinkGroupHandle_REF(imgAddImg,aImg,rect)
        UIGraphicsBeginImageContext(_self.size);
        [_self drawInRect:CGRectMake(0, 0, _self.size.width, _self.size.height)];
        [aImg drawInRect:rect];
        UIImage* reImg = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return reImg;
    };
}
- (void)setImgAddImg:(UIImage *(^)(UIImage *, CGRect))imgAddImg{};

- (UIColor *(^)())imgGetPatternColor
{
    return ^id(){
        LinkHandle_REF(UIColor, UIImage)
        LinkGroupHandle_REF(imgGetPatternColor)
        return [UIColor colorWithPatternImage:_self];
    };
}
- (void)setImgGetPatternColor:(UIColor *(^)())imgGetPatternColor{};
@end
