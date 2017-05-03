//
//  NSString+LinkBlock.m

//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "LinkBlock.h"

@implementation NSObject(NSStringLinkBlock)

- (NSMutableString *(^)())strMutableCopy
{
    return ^id(){
        LinkHandle_REF(NSMutableString, NSString)
        LinkGroupHandle_REF(strMutableCopy)
        return (NSMutableString*)_self.mutableCopy;
    };
}
- (void)setStrMutableCopy:(NSMutableString *(^)())strMutableCopy{};

- (BOOL (^)(NSString *))strIsEqualStr
{
    return ^(NSString* str){
        LinkHandle_VAL_IFNOT(NSString){
            return NO;
        }
        LinkGroupHandle_VAL(strIsEqualStr,str)
        return [_self isEqualToString:str];
    };
}

- (void)setStrIsEqualStr:(BOOL (^)(NSString *))strIsEqualStr{};

- (NSString *(^)(NSString *))strAppend
{
    return ^id(NSString *str){
        LinkHandle_REF(NSString, NSString)
        LinkGroupHandle_REF(strAppend,str)
        if([str isKindOfClass:[NSString class]]){
            return [_self stringByAppendingString:str];
        }else{
            return _self;
        }
    };
}
- (void)setStrAppend:(NSString *(^)(NSString *))strAppend{};

- (NSString *(^)(NSString *, NSString *))strReplace
{
    return ^id(NSString* replaceStr, NSString* withStr){
        LinkHandle_REF(NSString, NSString)
        LinkGroupHandle_REF(strReplace,replaceStr,withStr)
        if([replaceStr isKindOfClass:[NSString class]] &&
           [withStr isKindOfClass:[NSString class]] ){
            return [_self stringByReplacingOccurrencesOfString:replaceStr withString:withStr];
        }
        else{
            return _self;
        }
    };
}
- (void)setStrReplace:(NSString *(^)(NSString *, NSString *))strReplace{};

- (NSString *(^)(NSString *, NSUInteger))strInsertAt
{
    return ^id(NSString* str, NSUInteger index){
        LinkHandle_REF(NSString, NSString)
        LinkGroupHandle_REF(strInsertAt,str,index)
        if([str isKindOfClass:[NSString class]]){
            NSMutableString *tNewMStr= [NSMutableString stringWithString: _self];
            [tNewMStr insertString:str atIndex:index];
            return (NSString*)[tNewMStr copy];
        }else{
            return _self;
        }
    };
}
- (void)setStrInsertAt:(NSString *(^)(NSString *, NSUInteger))strInsertAt{};

- (NSString *(^)(NSRange))strDeleteInRange
{
    return ^id(NSRange range){
        LinkHandle_REF(NSString, NSString)
        LinkGroupHandle_REF(strDeleteInRange,range)
        NSMutableString *tNewMStr= [NSMutableString stringWithString: _self];
        [tNewMStr deleteCharactersInRange:range];
        return (NSString*)[tNewMStr copy];
    };
}
- (void)setStrDeleteInRange:(NSString *(^)(NSRange))strDeleteInRange{};

- (NSString *(^)(NSUInteger))strAt
{
    return ^id(NSUInteger index){
        LinkHandle_REF(NSString, NSString)
        LinkGroupHandle_REF(strAt,index)
        if(index > _self.length - 1)
            return @"";
        unichar ch = [_self characterAtIndex:index];
        return [NSString stringWithCharacters:&ch length:1];
    };
}
- (void)setStrAt:(NSString *(^)(NSUInteger))strAt{};

- (NSString *(^)(NSString *, NSRange))strReplaceInRange
{
    return ^id(NSString* str, NSRange range){
        LinkHandle_REF(NSString, NSString)
        LinkGroupHandle_REF(strReplaceInRange,str,range)
        if([str isKindOfClass:[NSString class]]){
            return [_self stringByReplacingCharactersInRange:range withString:str];
        }else{
            return _self;
        }
    };
}
- (void)setStrReplaceInRange:(NSString *(^)(NSString *, NSRange))strReplaceInRange{};

- (NSString *(^)(NSString *))strDeleteStr
{
    return ^id(NSString *str){
        LinkHandle_REF(NSString, NSString)
        LinkGroupHandle_REF(strDeleteStr,str)
        if([str isKindOfClass:[NSString class]]){
            return [_self stringByReplacingOccurrencesOfString:str withString:@""];
        }else{
            return _self;
        }
    };
}
- (void)setStrDeleteStr:(NSString *(^)(NSString *))strDeleteStr{};

- (BOOL (^)(NSString *))strIsContain
{
    return ^(NSString* str){
        LinkHandle_VAL_IFNOT(NSString){
            return NO;
        }
        LinkGroupHandle_VAL(strIsContain,str)
        return [_self containsString:str];
    };
}
- (void)setStrIsContain:(BOOL (^)(NSString *))strIsContain{};

- (NSInteger (^)(NSString *))strIndexOfStr
{
    return ^(NSString* str){
        LinkHandle_VAL_IFNOT(NSString){
            return (NSInteger)0;
        }
        LinkGroupHandle_VAL(strIndexOfStr,str)
        if([str isKindOfClass:[NSString class]]){
            return (NSInteger)([_self rangeOfString:str].location);
        }else{
            return (NSInteger)NSNotFound;
        }
    };
}
- (void)setStrIndexOfStr:(NSInteger (^)(NSString *))strIndexOfStr{};

- (BOOL (^)())strIsContainzh_CN
{
    return ^(){
        LinkHandle_VAL_IFNOT(NSString){
            return NO;
        }
        LinkGroupHandle_VAL(strIsContainzh_CN)
        for(int i=0; i<_self.length; i++){
            int charS = [_self characterAtIndex:i];
            if(charS >= 0x4e00 && charS <= 0x9fff){
                return YES;
            }
        }
        return NO;
    };
}
- (void)setStrIsContainzh_CN:(BOOL (^)())strIsContainzh_CN{};

- (BOOL (^)(NSRange))strIszh_CNInRange
{
    return ^(NSRange range){
        LinkHandle_VAL_IFNOT(NSString){
            return NO;
        }
        LinkGroupHandle_VAL(strIszh_CNInRange,range)
        if( range.location>_self.length-1 || range.location+range.length>_self.length )
            return NO;
        
        for(NSUInteger i=range.location; i<range.location+range.length; i++){
            int charS = [_self characterAtIndex:i];
            if(charS < 0x4e00 || charS > 0x9fff){//不是汉字
                return NO;
            }
        }
        return YES;
    };
}
- (void)setStrIszh_CNInRange:(BOOL (^)(NSRange))strIszh_CNInRange{};

- (NSInteger (^)(NSString *, NSUInteger))strIndexOfStrStartAt
{
    return ^(NSString* str, NSUInteger startIndex){
        LinkHandle_VAL_IFNOT(NSString){
            return (NSInteger)0;
        }
        LinkGroupHandle_VAL(strIndexOfStrStartAt,str,startIndex)
        if([str isKindOfClass:[NSString class]]){
            return (NSInteger)([_self rangeOfString:str options:NSCaseInsensitiveSearch range:NSMakeRange(startIndex, _self.length- startIndex)].location);
        }else{
            return (NSInteger)NSNotFound;
        }
    };
}
- (void)setStrIndexOfStrStartAt:(NSInteger (^)(NSString *, NSUInteger))strIndexOfStrStartAt{};

- (NSRange (^)(NSString *))strRangeOfStr
{
    return ^(NSString* str){
        LinkHandle_VAL_IFNOT(NSString){
            return NSMakeRange(NSNotFound, 0);
        }
        LinkGroupHandle_VAL(strRangeOfStr,str)
        if([str isKindOfClass:[NSString class]]){
            return [_self rangeOfString:str];
        }else{
            return NSMakeRange(NSNotFound, 0);
        }
    };
}
- (void)setStrRangeOfStr:(NSRange (^)(NSString *))strRangeOfStr{};

- (NSString *(^)(NSString *, ...))strAppendFormat
{
    return ^id(NSString *formatStr, ...){
        LinkHandle_REF(NSString, NSString)
        
        if([self isKindOfClass:[LinkGroup class]]){
            LinkGroup* group = (LinkGroup*)self;
            NSMutableArray* returnObjs = [NSMutableArray new];
            va_list args;
            va_start(args, formatStr);
            for (int i=0; i<group.linkObjects.count; i++) {
                id re = group.linkObjects[i].strAppend([[NSString alloc] initWithFormat:formatStr arguments:args]);
                [returnObjs addObject:re];
            }
            va_end(args);
            [group.linkObjects setArray:returnObjs];
            return (id)group;
        }
        
        if([formatStr isKindOfClass:[NSString class]]){
            va_list args;
            va_start(args, formatStr);
            NSString *re= [_self stringByAppendingString:[[NSString alloc] initWithFormat:formatStr arguments:args]];
            va_end(args);
            return re;
        }
        return _self;
    };
}
- (void)setStrAppendFormat:(NSString *(^)(NSString *, ...))strAppendFormat{};

- (NSString *(^)(NSString *))strAppendLine
{
    return ^id(NSString* str){
        LinkHandle_REF(NSString, NSString)
        LinkGroupHandle_REF(strAppendLine,str)
        return [_self stringByAppendingFormat:@"%@%@", @"\r\n", str];
    };
}
- (void)setStrAppendLine:(NSString *(^)(NSString *))strAppendLine{};

- (BOOL (^)())strIsEmoji
{
    return ^(){
        LinkHandle_VAL_IFNOT(NSString){
            return NO;
        }
        LinkGroupHandle_VAL(strIsEmoji)
        // 判断是否是 emoji表情
        BOOL returnValue = NO;
        
        const unichar hs = [_self characterAtIndex:0];
        // surrogate pair
        if (0xd800 <= hs && hs <= 0xdbff) {
            if (_self.length > 1) {
                const unichar ls = [_self characterAtIndex:1];
                const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                if (0x1d000 <= uc && uc <= 0x1f77f) {
                    returnValue = YES;
                }
            }
        } else if (_self.length > 1) {
            const unichar ls = [_self characterAtIndex:1];
            if (ls == 0x20e3) {
                returnValue = YES;
            }
        } else {
            // non surrogate
            if (0x2100 <= hs && hs <= 0x27ff) {
                returnValue = YES;
            } else if (0x2B05 <= hs && hs <= 0x2b07) {
                returnValue = YES;
            } else if (0x2934 <= hs && hs <= 0x2935) {
                returnValue = YES;
            } else if (0x3297 <= hs && hs <= 0x3299) {
                returnValue = YES;
            } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50) {
                returnValue = YES;
            }
        }
        return returnValue;
    };
}
- (void)setStrIsEmoji:(BOOL (^)())strIsEmoji{};

- (CGSize (^)(UIFont *))strSizeWithFont
{
    return ^(UIFont* font){
        LinkHandle_VAL_IFNOT(NSString){
            return CGSizeZero;
        }
        LinkGroupHandle_VAL(strSizeWithFont,font)
        return _self.strSizeWithFontAndMaxWidth(font , MAXFLOAT);
    };
}
- (void)setStrSizeWithFont:(CGSize (^)(UIFont *))strSizeWithFont{};

- (CGSize (^)(UIFont *, CGFloat))strSizeWithFontAndMaxWidth
{
    return ^(UIFont* font, CGFloat maxWidth){
        LinkHandle_VAL_IFNOT(NSString){
            return CGSizeZero;
        }
        LinkGroupHandle_VAL(strSizeWithFontAndMaxWidth,font,maxWidth)
        return _self.strSizeWithFontAndMaxSize(font , CGSizeMake(maxWidth, MAXFLOAT));
    };
}
- (void)setStrSizeWithFontAndMaxWidth:(CGSize (^)(UIFont *, CGFloat))strSizeWithFontAndMaxWidth{};

- (CGSize (^)(UIFont *, CGSize))strSizeWithFontAndMaxSize
{
    return ^(UIFont* font, CGSize maxSize){
        LinkHandle_VAL_IFNOT(NSString){
            return CGSizeZero;
        }
        LinkGroupHandle_VAL(strSizeWithFontAndMaxSize,font,maxSize)
        NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
        attrs[NSFontAttributeName] = font;
        
        //        if ([[UIDevice currentDevice].systemVersion floatValue]>= 7.0) {
        return [_self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:attrs context:nil].size;
        //        }
        //        else {
        //            return [_self sizeWithFont:font constrainedToSize:maxSize];
        //        }
    };
}
- (void)setStrSizeWithFontAndMaxSize:(CGSize (^)(UIFont *, CGSize))strSizeWithFontAndMaxSize{};

- (double (^)(NSDictionary *))strHeight
{
    return ^(NSDictionary* attrDict){
        
        LinkHandle_VAL_IFNOT(NSString){
            return 0.0;
        }
        LinkGroupHandle_VAL(strHeight,attrDict)
        CGRect rect = [_self boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT)
                                          options:NSStringDrawingUsesDeviceMetrics
                                       attributes:attrDict
                                          context:nil];
        return (double)rect.size.height;
    };
}
- (void)setStrHeight:(double (^)(NSDictionary *))strHeight{};

- (double (^)(NSDictionary *))strLineHeight
{
    return ^(NSDictionary* attrDict){
        
        LinkHandle_VAL_IFNOT(NSString){
            return 0.0;
        }
        LinkGroupHandle_VAL(strLineHeight,attrDict)
        CGRect rect = [_self boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT)
                                          options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading
                                       attributes:attrDict
                                          context:nil];
        return (double)rect.size.height;
    };
}
- (void)setStrLineHeight:(double (^)(NSDictionary *))strLineHeight{};

- (NSInteger (^)(CGFloat, NSDictionary *))strLinesCountAboutView
{
    return ^(CGFloat maxWidth,NSDictionary* attrDict){
        LinkHandle_VAL_IFNOT(NSString){
            return (NSInteger)0;
        }
        LinkGroupHandle_VAL(strLinesCountAboutView,maxWidth,attrDict)
        NSString* originStr= _self;
        
        NSInteger enterCount=0;
        for(int i=0;i<originStr.length;i++)
            if([originStr characterAtIndex:i] == '\n')
                enterCount++;
        
        originStr = [originStr stringByReplacingOccurrencesOfString:@"\n" withString:@""];//去换行符
        originStr = [originStr stringByReplacingOccurrencesOfString:@"\r" withString:@""];
        CGFloat lineHeight = [originStr boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT)
                                                     options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading
                                                  attributes:attrDict
                                                     context:nil].size.height;
        //无换行符
        CGFloat allHeight = [originStr boundingRectWithSize:CGSizeMake(maxWidth, MAXFLOAT)
                                                    options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading
                                                 attributes:attrDict
                                                    context:nil].size.height;
        
        return (NSInteger)(allHeight/lineHeight + enterCount);
    };
}
- (void)setStrLinesCountAboutView:(NSInteger (^)(CGFloat, NSDictionary *))strLinesCountAboutView{};

- (NSString* (^)(NSInteger, CGFloat,NSDictionary*))strSubToLineAboutView
{
    return ^id(NSInteger toLine, CGFloat maxWidth,NSDictionary* attrDict){
        
        LinkHandle_REF(NSString, NSString)
        LinkGroupHandle_REF(strSubToLineAboutView,toLine,maxWidth,attrDict)
        //折半查找
        NSRange forRange = NSMakeRange(0 , _self.length);
        NSInteger start,mid,end,midLineCount;
        
        if(!forRange.length||toLine<1){
            
            return @"";
        }else if (forRange.length==1){
            
            if(_self.strLinesCountAboutView(maxWidth,attrDict) > toLine){//1 123
                return @"";
            }
        }else{
            
            while (forRange.length>1) {//范围缩小至1前
                
                start=forRange.location;
                end=start+forRange.length-1;
                mid=(start+end)/2;
                midLineCount = [_self substringToIndex:mid+1].strLinesCountAboutView(maxWidth,attrDict);
                if(midLineCount<toLine){//不包含当前，向右区间
                    
                    forRange=NSMakeRange(mid+1, end-mid);
                    continue;
                }else if (midLineCount>toLine){//不包含当前，向左区间
                    
                    forRange=NSMakeRange(start, mid-start);
                    continue;
                }else{//==
                    
                    if(midLineCount<[_self substringToIndex:mid+2].strLinesCountAboutView(maxWidth,attrDict)){//临界
                        
                        forRange=NSMakeRange(mid, 1);
                        break;
                    }else{//不包含当前，向右区间
                        
                        forRange=NSMakeRange(mid+1, end-mid);
                        continue;
                    }
                }
            }
        }
        return [_self substringToIndex:forRange.location+1];
    };
}
- (void)setStrSubToLineAboutView:(NSString *(^)(NSInteger, CGFloat, NSDictionary *))strSubToLineAboutView{};

- (BOOL (^)())strIsBlank{
    return ^(){
        LinkHandle_VAL_IFNOT(NSString){
            return NO;
        }
        LinkGroupHandle_VAL(strIsBlank)
        if ([[_self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length]==0) {
            return YES;
        }
        if ([_self isEqualToString:@"<null>"]) {
            return YES;
        }
        if ([_self isEqualToString:@"(null)"]) {
            return YES;
        }
        return NO;
    };
}
- (void)setStrIsBlank:(BOOL (^)())strIsBlank{};

- (NSUInteger (^)())strLength
{
    return ^(){
        LinkHandle_VAL_IFNOT(NSString){
            return (NSUInteger)0;
        }
        LinkGroupHandle_VAL(strLength)
        return _self.length;
    };
}
- (void)setStrLength:(NSUInteger (^)())strLength{};

- (NSUInteger (^)())strLengthASCII
{
    return ^(){
        LinkHandle_VAL_IFNOT(NSString){
            return (NSUInteger)0;
        }
        LinkGroupHandle_VAL(strLengthASCII)
        NSUInteger asciiLength = 0;
        for (NSUInteger i = 0; i < _self.length; i++)
        {
            unichar uc = [_self characterAtIndex: i];
            asciiLength += isascii(uc) ? 1 : 2;
        }
        return asciiLength;
    };
}
- (void)setStrLengthASCII:(NSUInteger (^)())strLengthASCII{};

- (NSUInteger (^)())strLengthUnicode
{
    return ^(){
        LinkHandle_VAL_IFNOT(NSString){
            return (NSUInteger)0;
        }
        LinkGroupHandle_VAL(strLengthUnicode)
        NSUInteger asciiLength = 0;
        for (NSUInteger i = 0; i < _self.length; i++)
        {
            unichar uc = [_self characterAtIndex: i];
            asciiLength += isascii(uc) ? 1 : 2;
        }
        NSUInteger unicodeLength = asciiLength / 2;
        if(asciiLength % 2)
        {
            unicodeLength++;
        }
        return unicodeLength;
    };
}
- (void)setStrLengthUnicode:(NSUInteger (^)())strLengthUnicode{};

- (NSUInteger (^)())strLengthComposed
{
    return ^(){
        LinkHandle_VAL_IFNOT(NSString){
            return (NSUInteger)0;
        }
        LinkGroupHandle_VAL(strLengthComposed)
        NSUInteger re=0; NSRange range;
        for(int i=0; i<_self.length; i+=range.length){
            range = [_self rangeOfComposedCharacterSequenceAtIndex:i];
            re++;
        }
        return re;
    };
}
- (void)setStrLengthComposed:(NSUInteger (^)())strLengthComposed{};

- (NSUInteger (^)(NSString *))strLengthComposedAndCustom
{
    return ^(NSString* reg){
        LinkHandle_VAL_IFNOT(NSString){
            return (NSUInteger)0;
        }
        LinkGroupHandle_VAL(strLengthComposedAndCustom,reg)
        NSError* error = nil;
        NSUInteger re = 0;
        NSMutableString* tempString = [_self mutableCopy];
        NSRegularExpression* regExp = [[NSRegularExpression alloc] initWithPattern:reg options:0 error:&error];
        if(!error){
            
            re += [regExp replaceMatchesInString:tempString options:0 range:NSMakeRange(0, tempString.length) withTemplate:@""];
            NSRange range;
            for(int i=0; i<tempString.length; i+=range.length){
                range = [tempString rangeOfComposedCharacterSequenceAtIndex:i];
                re++;
            }
        }
        return re;
    };
}
- (void)setStrLengthComposedAndCustom:(NSUInteger (^)(NSString *))strLengthComposedAndCustom{};

- (BOOL (^)())strIsContainEmoji
{
    return ^(){
        LinkHandle_VAL_IFNOT(NSString){
            return NO;
        }
        LinkGroupHandle_VAL(strIsContainEmoji)
        __block BOOL hasEomji = NO;
        
        [_self enumerateSubstringsInRange:NSMakeRange(0, _self.length) options:NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
            const unichar hs = [substring characterAtIndex:0];
            // surrogate pair
            if (0xd800 <= hs && hs <= 0xdbff) {
                if (substring.length > 1) {
                    const unichar ls = [substring characterAtIndex:1];
                    const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                    if (0x1d000 <= uc && uc <= 0x1f77f) {
                        hasEomji = YES;
                    }
                }
            } else if (substring.length > 1) {
                const unichar ls = [substring characterAtIndex:1];
                if (ls == 0x20e3) {
                    hasEomji = YES;
                }
            } else {
                // non surrogate
                if (0x2100 <= hs && hs <= 0x27ff && hs != 0x263b) {
                    hasEomji = YES;
                } else if (0x2B05 <= hs && hs <= 0x2b07) {
                    hasEomji = YES;
                } else if (0x2934 <= hs && hs <= 0x2935) {
                    hasEomji = YES;
                } else if (0x3297 <= hs && hs <= 0x3299) {
                    hasEomji = YES;
                } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50|| hs == 0x231a ) {
                    hasEomji = YES;
                }
            }
            if(hasEomji){*stop = YES;}
        }];
        return hasEomji;
    };
}
- (void)setStrIsContainEmoji:(BOOL (^)())strIsContainEmoji{};

- (NSString* (^)())strClearSpaceAndWrap
{
    return ^id(){
        LinkHandle_REF(NSString, NSString)
        LinkGroupHandle_REF(strClearSpaceAndWrap)
        NSString *noWrap = [_self stringByReplacingOccurrencesOfString:@"\n" withString:@""];
        noWrap = [noWrap stringByReplacingOccurrencesOfString:@"\r" withString:@""];
        noWrap = [noWrap stringByReplacingOccurrencesOfString:@" " withString:@""];
        return noWrap;
    };
}
- (void)setStrClearSpaceAndWrap:(NSString *(^)())strClearSpaceAndWrap{};

- (NSComparisonResult (^)(NSString *))strCompareNumberSensitive
{
    return ^(NSString* str ){
        LinkHandle_VAL_IFNOT(NSString){
            return (NSComparisonResult)NSNotFound;
        }
        LinkGroupHandle_VAL(strCompareNumberSensitive,str)
        return [_self compare:str options: NSNumericSearch | NSWidthInsensitiveSearch ];
    };
}
- (void)setStrCompareNumberSensitive:(NSComparisonResult (^)(NSString *))strCompareNumberSensitive{};

- (NSComparisonResult (^)(NSString *))strCompare
{
    return ^(NSString* str){
        LinkHandle_VAL_IFNOT(NSString){
            return (NSComparisonResult)NSNotFound;
        }
        LinkGroupHandle_VAL(strCompare,str)
        return [_self compare:str options: NSWidthInsensitiveSearch | NSForcedOrderingSearch];
    };;
}
- (void)setStrCompare:(NSComparisonResult (^)(NSString *))strCompare{};

- (BOOL (^)())strIsInteger
{
    return ^(){
        LinkHandle_VAL_IFNOT(NSString){
            return NO;
        }
        LinkGroupHandle_VAL(strIsInteger)
        NSScanner *scaner= [[NSScanner alloc] initWithString:_self];
        NSInteger intVal;
        return (BOOL)([scaner scanInteger:&intVal] && [scaner isAtEnd]);
    };
}
- (void)setStrIsInteger:(BOOL (^)())strIsInteger{};

- (BOOL (^)())strIsFloating
{
    return ^(){
        LinkHandle_VAL_IFNOT(NSString){
            return NO;
        }
        LinkGroupHandle_VAL(strIsFloating)
        NSScanner *scaner= [[NSScanner alloc] initWithString:_self];
        double doubleVal;
        return (BOOL)([scaner scanDouble:&doubleVal] && [scaner isAtEnd]);
    };
}
- (void)setStrIsFloating:(BOOL (^)())strIsFloating{};

- (BOOL (^)())strIsNumber
{
    return ^(){
        LinkHandle_VAL_IFNOT(NSString){
            return NO;
        }
        LinkGroupHandle_VAL(strIsNumber)
        return (BOOL)(_self.strIsInteger() || _self.strIsFloating());
    };
}
- (void)setStrIsNumber:(BOOL (^)())blockIsNumber{};

- (NSString *(^)(NSString *))strDeleteLeft
{
    return ^id(NSString* str){
        LinkHandle_REF(NSString, NSString)
        LinkGroupHandle_REF(strDeleteLeft,str)
        NSMutableString * reIsStrM= [_self mutableCopy];
        NSRange range = [str rangeOfString:str];
        if(range.location == 0){
            [reIsStrM deleteCharactersInRange:range];
        }
        return (NSString*)[reIsStrM copy];
    };
}
- (void)setStrDeleteLeft:(NSString *(^)(NSString *))strDeleteLeft{};

- (NSString *(^)(NSString *))strDeleteRight
{
    return ^id(NSString* str){
        LinkHandle_REF(NSString, NSString)
        LinkGroupHandle_REF(strDeleteRight,str)
        NSString* re = _self;
        NSString* lastStr = [re substringWithRange:NSMakeRange(_self.length- str.length, str.length)];
        if([str isEqualToString:lastStr]){
            re= [_self substringWithRange:NSMakeRange(0, _self.length - str.length)];
        }
        return re;
    };
}
- (void)setStrDeleteRight:(NSString *(^)(NSString *))strDeleteRight{};

- (NSString *(^)(NSString*))strTrimLeft
{
    return ^id(NSString* str){
        LinkHandle_REF(NSString, NSString)
        LinkGroupHandle_REF(strTrimLeft,str)
        NSMutableString * reIsStrM= _self.strMutableCopy();
        [reIsStrM replaceOccurrencesOfString:str
                                  withString:@""
                                     options:NSAnchoredSearch
                                       range:NSMakeRange(0, _self.length)];
        return (NSString*)[reIsStrM copy];
    };
}
- (void)setStrTrimLeft:(NSString *(^)(NSString *))strTrimLeft{};

- (NSString *(^)(NSString*))strTrimRight
{
    return ^id(NSString* str){
        LinkHandle_REF(NSString, NSString)
        LinkGroupHandle_REF(strTrimRight,str)
        NSMutableString * reIsStrM= [_self mutableCopy];
        [reIsStrM replaceOccurrencesOfString:str
                                  withString:@""
                                     options:NSBackwardsSearch|NSAnchoredSearch
                                       range:NSMakeRange(0, _self.length)];
        return (NSString*)reIsStrM.objCopy();
    };
}
- (void)setStrTrimRight:(NSString *(^)(NSString *))strTrimRight{};

- (NSString *(^)(NSString *))strTrim
{
    return ^id(NSString* str){
        LinkHandle_REF(NSString, NSString)
        LinkGroupHandle_REF(strTrim,str)
        NSMutableString * reIsStrM= _self.strMutableCopy();
        [reIsStrM replaceOccurrencesOfString:str
                                  withString:@""
                                     options:NSAnchoredSearch
                                       range:NSMakeRange(0, _self.length)];
        [reIsStrM replaceOccurrencesOfString:str
                                  withString:@""
                                     options:NSBackwardsSearch|NSAnchoredSearch
                                       range:NSMakeRange(0, _self.length)];
        return (NSString*)reIsStrM.objCopy();
    };
}
- (void)setStrTrim:(NSString *(^)(NSString *))strTrim{};

- (UIColor *(^)())strToUIColorFromHexStr
{
    return ^id(){
        LinkHandle_REF(UIColor, NSString)
        LinkGroupHandle_REF(strToUIColorFromHexStr)
        NSString *newString = [[_self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
        if ([newString length] < 6)
            return [UIColor whiteColor];
        if ([newString hasPrefix:@"0X"])
            newString = [newString substringFromIndex:2];
        if ([newString hasPrefix:@"#"])
            newString = [newString substringFromIndex:1];
        if ([newString length] != 6)
            return [UIColor whiteColor];
        
        NSRange range;
        range.location = 0;
        range.length = 2;
        NSString *rString = [newString substringWithRange:range];
        range.location = 2;
        NSString *gString = [newString substringWithRange:range];
        range.location = 4;
        NSString *bString = [newString substringWithRange:range];
        unsigned int r, g, b;
        [[NSScanner scannerWithString:rString] scanHexInt:&r];
        [[NSScanner scannerWithString:gString] scanHexInt:&g];
        [[NSScanner scannerWithString:bString] scanHexInt:&b];
        return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
    };
}
- (void)setStrToUIColorFromHexStr:(UIColor *(^)())strToColorFromHexStr{};

- (double (^)())strToDoubleFromHexStr
{
    return ^(){
        LinkHandle_VAL_IFNOT(NSString){
            return 0.0;
        }
        LinkGroupHandle_VAL(strToDoubleFromHexStr)
        NSString *newString = [[_self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
        if ([newString hasPrefix:@"0X"])
            newString = [newString substringFromIndex:2];
        if ([newString hasPrefix:@"#"])
            newString = [newString substringFromIndex:1];
        double re=0.0;
        [[NSScanner scannerWithString:newString] scanHexDouble:&re];
        return re;
    };
}
- (void)setStrToDoubleFromHexStr:(double (^)())strToDoubleFromHexStr{};

- (unsigned int (^)())strToIntFromHexStr
{
    return ^(){
        LinkHandle_VAL_IFNOT(NSString){
            return (unsigned int)0;
        }
        LinkGroupHandle_VAL(strToIntFromHexStr)
        NSString *newString = [[_self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
        if ([newString hasPrefix:@"0X"])
            newString = [newString substringFromIndex:2];
        if ([newString hasPrefix:@"#"])
            newString = [newString substringFromIndex:1];
        unsigned int re = 0;
        [[NSScanner scannerWithString:newString] scanHexInt:&re];
        return re;
    };
}
- (void)setStrToIntFromHexStr:(unsigned int (^)())strToIntFromHexStr{};

- (CGRect (^)())strToCGRect
{
    return ^(){
        LinkHandle_VAL_IFNOT(NSString){
            return CGRectZero;
        }
        LinkGroupHandle_VAL(strToCGRect)
        return CGRectFromString(_self);
    };
}
- (void)setStrToCGRect:(CGRect (^)())strToCGRect{};
- (CGPoint (^)())strToCGPoint
{
    return ^(){
        LinkHandle_VAL_IFNOT(NSString){
            return CGPointZero;
        }
        LinkGroupHandle_VAL(strToCGPoint)
        return CGPointFromString(_self);
    };
}
- (void)setStrToCGPoint:(CGPoint (^)())strToCGPoint{};

- (CGVector (^)())strToCGVector
{
    return ^(){
        LinkHandle_VAL_IFNOT(NSString){
            return CGVectorMake(0, 0);
        }
        LinkGroupHandle_VAL(strToCGVector)
        return CGVectorFromString(_self);
    };
}
- (void)setStrToCGVector:(CGVector (^)())strToCGVector{};

- (CGSize (^)())strToCGSize
{
    return ^(){
        LinkHandle_VAL_IFNOT(NSString){
            return CGSizeZero;
        }
        LinkGroupHandle_VAL(strToCGSize)
        return CGSizeFromString(_self);
    };
}
- (void)setStrToCGSize:(CGSize (^)())strToCGSize{};

- (CGAffineTransform (^)())strToCGAffineTransform
{
    return ^(){
        LinkHandle_VAL_IFNOT(NSString){
            return CGAffineTransformMake(0, 0, 0, 0, 0, 0);
        }
        LinkGroupHandle_VAL(strToCGAffineTransform)
        return CGAffineTransformFromString(_self);
    };
}
- (void)setStrToCGAffineTransform:(CGAffineTransform (^)())strToCGAffineTransform{};

- (UIEdgeInsets (^)())strToUIEdgeInsets
{
    return ^(){
        LinkHandle_VAL_IFNOT(NSString){
            return UIEdgeInsetsZero;
        }
        LinkGroupHandle_VAL(strToUIEdgeInsets)
        return UIEdgeInsetsFromString(_self);
    };
}
- (void)setStrToUIEdgeInsets:(UIEdgeInsets (^)())strToUIEdgeInsets{};
- (UIOffset (^)())strToUIOffset
{
    return ^(){
        LinkHandle_VAL_IFNOT(NSString){
            return UIOffsetZero;
        }
        LinkGroupHandle_VAL(strToUIOffset)
        return UIOffsetFromString(_self);
    };
}
- (void)setStrToUIOffset:(UIOffset (^)())strToUIOffset{};
- (NSData *(^)())strToNSDataWithContentsOfFile
{
    return ^id(){
        LinkHandle_REF(NSData, NSString)
        LinkGroupHandle_REF(strToNSDataWithContentsOfFile)
        return [NSData dataWithContentsOfFile:_self];
    };
}
- (void)setStrToNSDataWithContentsOfFile:(NSData *(^)())strToNSDataFromContents{};

- (NSData *(^)(NSStringEncoding))strToNSDataUseEncoding
{
    return ^id(NSStringEncoding encoding){
        LinkHandle_REF(NSData, NSString)
        LinkGroupHandle_REF(strToNSDataUseEncoding,encoding)
        return [_self dataUsingEncoding:encoding];
    };
}
- (void)setStrToNSDataUseEncoding:(NSData *(^)(NSStringEncoding))strToNSDataUseEncoding{};

- (NSDate *(^)(NSString *))strToNSDateWithFormat
{
    return ^id(NSString* formatStr){
        LinkHandle_REF(NSDate, NSString)
        LinkGroupHandle_REF(strToNSDateWithFormat,formatStr)
        NSDateFormatter* fmt = [NSDateFormatter new];
        fmt.dateFormat = formatStr;
        return [fmt dateFromString:_self];
    };
}
- (void)setStrToNSDateWithFormat:(NSDate *(^)(NSString *))strToNSDateWithFormat{};

- (NSDate *(^)())strToNSDateSince1970
{
    return ^id(){
        LinkHandle_REF(NSDate, NSString)
        LinkGroupHandle_REF(strToNSDateSince1970)
        return [NSDate dateWithTimeIntervalSince1970:[_self doubleValue]];
    };
}
- (void)setStrToNSDateSince1970:(NSDate *(^)())strToNSDateSince1970{};

- (NSDictionary *(^)(NSStringEncoding))strToNSDictionary
{
    return ^id(NSStringEncoding encoding){
        LinkHandle_REF(NSDictionary, NSString)
        LinkGroupHandle_REF(strToNSDictionary,encoding)
        NSString* newStr = [_self stringByReplacingOccurrencesOfString:@" "
                                                            withString:@""];
        
        newStr = [newStr stringByReplacingOccurrencesOfString:@"\n"
                                                   withString:@""];
        
        newStr = [newStr stringByReplacingOccurrencesOfString:@"\r"
                                                   withString:@""];
        
        NSData* strIsData = [newStr dataUsingEncoding:encoding];
        
        
        NSDictionary* re = [NSJSONSerialization JSONObjectWithData:strIsData
                                                           options:NSJSONReadingMutableContainers
                                                             error:nil];
        if([re isKindOfClass:[NSDictionary class]]){
            return re;
        }
        return @{};
    };
}
- (void)setStrToNSDictionary:(NSDictionary *(^)(NSStringEncoding))strToNSDictionary{};

- (NSArray *(^)(NSStringEncoding))strToNSArrary
{
    return ^id(NSStringEncoding encoding){
        LinkHandle_REF(NSArray, NSString)
        LinkGroupHandle_REF(strToNSArrary,encoding)
        NSString* newStr = [_self stringByReplacingOccurrencesOfString:@" "
                                                            withString:@""];
        newStr = [newStr stringByReplacingOccurrencesOfString:@"\n"
                                                   withString:@""];
        newStr = [newStr stringByReplacingOccurrencesOfString:@"\r"
                                                   withString:@""];
        
        NSData* strIsData = [newStr dataUsingEncoding:encoding];
        NSArray* re = [NSJSONSerialization JSONObjectWithData:strIsData
                                                      options:NSJSONReadingMutableContainers
                                                        error:nil];
        if([re isKindOfClass:[NSArray class]]){
            return re;
        }
        return @[];
    };
}
- (void)setStrToNSArrary:(NSArray *(^)(NSStringEncoding))strToNSArrary{};


-(NSURL *(^)())strToNSURL
{
    return ^id(){
        LinkHandle_REF(NSURL, NSString)
        LinkGroupHandle_REF(strToNSURL)
        return [NSURL URLWithString:_self];
    };
}
- (void)setStrToNSURL:(NSURL *(^)())strToNSURL{};

- (UIImage *(^)())strToUIImage
{
    return ^id(){
        LinkHandle_REF(UIImage, NSString)
        LinkGroupHandle_REF(strToUIImage)
        UIImage* reImg = [UIImage imageNamed:_self];
        if(!reImg){
            
            reImg = [UIImage imageWithContentsOfFile:_self.strPathWithName(nil)];
        }
        return reImg;
    };
}
- (void)setStrToUIImage:(UIImage *(^)())strToUIImage{};

- (NSInteger (^)())strToInteger
{
    return ^(){
        LinkHandle_VAL_IFNOT(NSString){
            return (NSInteger)0;
        }
        LinkGroupHandle_VAL(strToInteger)
        return [_self integerValue];
    };
}
- (void)setStrToInteger:(NSInteger (^)())strToInteger{};

- (long long (^)())strToLongLong
{
    return ^(){
        LinkHandle_VAL_IFNOT(NSString){
            return (long long)0;
        }
        LinkGroupHandle_VAL(strToLongLong)
        return [_self longLongValue];
    };
}
- (void)setStrToLongLong:(long long (^)())strToLongLong{};

- (BOOL (^)())strToBOOL
{
    return ^(){
        LinkHandle_VAL_IFNOT(NSString){
            return NO;
        }
        LinkGroupHandle_VAL(strToBOOL)
        return [_self boolValue];
    };
}
- (void)setStrToBOOL:(BOOL (^)())strToBOOL{};

- (double (^)())strToDouble
{
    return ^(){
        LinkHandle_VAL_IFNOT(NSString){
            return (double)0.0;
        }
        LinkGroupHandle_VAL(strToDouble)
        return [_self doubleValue];
    };
}
- (void)setStrToDouble:(double (^)())strToDouble{};

- (float (^)())strToFloat
{
    return ^(){
        LinkHandle_VAL_IFNOT(NSString){
            return (float)0.0;
        }
        LinkGroupHandle_VAL(strToFloat)
        return [_self floatValue];
    };
}
- (void)setStrToFloat:(float (^)())strToFloat{};

- (NSArray<NSString*> *(^)(NSString *))strSplitWithStr
{
    return ^id(NSString* splitStr){
        LinkHandle_REF(NSArray<NSString*>, NSString)
        LinkGroupHandle_REF(strSplitWithStr,splitStr)
        return [_self componentsSeparatedByString:splitStr];
    };
}
- (void)setStrSplitWithStr:(NSArray<NSString*> *(^)(NSString *))blockSplitStrWithStr{};

- (NSArray<NSString*> *(^)(NSString *))strSplitWithCharsStr
{
    return ^id(NSString* splitStrs){
        LinkHandle_REF(NSArray<NSString*>, NSString)
        LinkGroupHandle_REF(strSplitWithCharsStr,splitStrs)
        NSCharacterSet *charSet= [NSCharacterSet characterSetWithCharactersInString:splitStrs];
        return [_self componentsSeparatedByCharactersInSet:charSet];
    };
}
- (void)setStrSplitWithCharsStr:(NSArray<NSString*> *(^)(NSString *))blockSplitStrWithCharsStr{};

- (BOOL (^)(NSString *))strHasPrefix
{
    return ^(NSString* prefix){
        LinkHandle_VAL_IFNOT(NSString){
            return NO;
        }
        LinkGroupHandle_VAL(strHasPrefix,prefix)
        return [_self hasPrefix:prefix];
    };
}
- (void)setStrHasPrefix:(BOOL (^)(NSString *))strHasPrefix{};

- (BOOL (^)(NSString *))strHasSuffix
{
    return ^(NSString* suffix){
        LinkHandle_VAL_IFNOT(NSString){
            return NO;
        }
        LinkGroupHandle_VAL(strHasSuffix,suffix)
        return [_self hasSuffix:suffix];
    };
}
- (void)setStrHasSuffix:(BOOL (^)(NSString *))strHasSuffix{};

- (NSString *(^)(NSUInteger))strSubFrom
{
    return ^id(NSUInteger idx){
        LinkHandle_REF(NSString, NSString)
        LinkGroupHandle_REF(strSubFrom,idx)
        return [_self substringFromIndex:idx];
    };
}
- (void)setStrSubFrom:(NSString *(^)(NSUInteger))strSubFrom{};

- (NSString *(^)(NSUInteger))strSubTo
{
    return ^id(NSUInteger idx){
        LinkHandle_REF(NSString, NSString)
        LinkGroupHandle_REF(strSubTo,idx)
        return [_self substringToIndex:idx];
    };
}
- (void)setStrSubTo:(NSString *(^)(NSUInteger))strSubTo{};

- (NSString *(^)(NSUInteger, NSUInteger))strSubFromTo
{
    return ^id(NSUInteger from, NSUInteger to){
        LinkHandle_REF(NSString, NSString)
        LinkGroupHandle_REF(strSubFromTo,from,to)
        if( from> to || to>_self.length)
            return _self;
        return [_self substringWithRange:NSMakeRange(from, to- from)];
    };
}
- (void)setStrSubFromTo:(NSString *(^)(NSUInteger, NSUInteger))strSubFromTo{};

- (NSObject *(^)())strCreateObj
{
    return ^id(){
        LinkHandle_REF(NSObject, NSString)
        LinkGroupHandle_REF(strCreateObj)
        Class class= NSClassFromString(_self);
        if(class){
            return (NSObject*)[class new];
        }else{
            return (NSObject*)[LinkError new];
        }
    };
}
- (void)setStrCreateObj:(NSObject *(^)())strCreateObj{};

- (UILabel *(^)(CGRect))strCreateLab
{
    return ^id(CGRect frame){
        LinkHandle_REF(UILabel, NSString)
        LinkGroupHandle_REF(strCreateLab,frame)
        UILabel* re= [[UILabel alloc] initWithFrame:frame];
        re.text= _self;
        return re;
    };
}
- (void)setStrCreateLab:(UILabel *(^)(CGRect))strCreateLab{};

- (UIImageView *(^)(CGFloat, CGFloat, CGFloat, CGFloat))strCreateImgView
{
    return ^id(CGFloat x, CGFloat y, CGFloat w, CGFloat h){
        LinkHandle_REF(UIImageView, NSString)
        LinkGroupHandle_REF(strCreateImgView,x,y,w,h)
        UIImageView* re = [[UIImageView alloc] initWithFrame:CGRectMake(x, y, w, h)];
        re.image = _self.strToUIImage();
        return re;
    };
}
- (void)setStrCreateImgView:(UIImageView *(^)(CGFloat, CGFloat, CGFloat, CGFloat))strCreateImgView{};

- (BOOL (^)(NSString *))strRegexIsMatch
{
    return ^(NSString* regex){
        LinkHandle_VAL_IFNOT(NSString){
            return NO;
        }
        LinkGroupHandle_VAL(strRegexIsMatch,regex)
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
        if([predicate evaluateWithObject:_self] == YES){
            return YES;
        }
        return NO;
    };
}
- (void)setStrRegexIsMatch:(BOOL (^)(NSString *))strRegexIsMatch{};


- (NSString *(^)(NSString *, NSString*))strRegexReplace
{
    return ^id(NSString* regexStr, NSString* replaceTemplate){
        LinkHandle_REF(NSString, NSString)
        LinkGroupHandle_REF(strRegexReplace,regexStr,replaceTemplate)
        NSError* error = nil;
        NSRegularExpression* regex = [[NSRegularExpression alloc]
                                      initWithPattern:regexStr
                                      options:0
                                      error:&error];
        if(error)
            return _self;
        return [regex stringByReplacingMatchesInString:[_self mutableCopy]
                                               options:0
                                                 range:NSMakeRange(0, _self.length)
                                          withTemplate:replaceTemplate];
    };
}
- (void)setStrRegexReplace:(NSString *(^)(NSString *, NSString *))strRegexReplace{};

- (NSString *(^)(NSArray *))strSetTextToControls
{
    return ^id(NSArray* controls){
        LinkHandle_REF(NSString, NSString)
        LinkGroupHandle_REF(strSetTextToControls,controls)
        [controls enumerateObjectsUsingBlock:^(UIView *view, NSUInteger idx, BOOL *stop) {
            if([view isKindOfClass:[UIView class]]){
                if([view isKindOfClass:[UIButton class]]){
                    [((UIButton*)view) setTitle:_self forState:UIControlStateNormal];
                }else if([view isKindOfClass:[UILabel class]] ||
                         [view isKindOfClass:[UITextField class]] ||
                         [view isKindOfClass:[UITextView class]]){
                    [view setValue:_self forKey:@"text"];
                }
            }
        }];
        return _self;
    };
}
- (void)setStrSetTextToControls:(NSString *(^)(NSArray *))strSetTextToControls{};

- (NSString *(^)(NSArray *))strSetTextColorToControls
{
    return ^id(NSArray* controls){
        LinkHandle_REF(NSString, NSString)
        LinkGroupHandle_REF(strSetTextColorToControls,controls)
        UIColor* color = _self.strToUIColorFromHexStr();
        [controls enumerateObjectsUsingBlock:^(UIView *v, NSUInteger idx, BOOL *stop) {
            if([v isKindOfClass:[UIButton class]]){
                [((UIButton*)v) setTitleColor:color forState:UIControlStateNormal];
            }else if ([v isKindOfClass:[UILabel class]] ||
                      [v isKindOfClass:[UITextField class]] ||
                      [v isKindOfClass:[UITextView class]]
                      ){
                [v setValue:color forKey:@"textColor"];
            }
            
        }];
        return _self;
    };
}
- (void)setStrSetTextColorToControls:(NSString *(^)(NSArray *))strSetTextColorToControls{};

- (NSString *(^)(NSArray *))strSetBGColorHexToViews
{
    return ^id(NSArray* views){
        LinkHandle_REF(NSString, NSString)
        LinkGroupHandle_REF(strSetBGColorHexToViews,views)
        UIColor* color = _self.strToUIColorFromHexStr();
        [views enumerateObjectsUsingBlock:^(UIView* v, NSUInteger idx, BOOL *stop) {
            if([v isKindOfClass:[UIView class]])
                v.backgroundColor = color;
        }];
        return _self;
    };
}
- (void)setStrSetBGColorHexToViews:(NSString *(^)(NSArray *))strSetBgColorToViews{};

- (double (^)())strFindNumber
{
    return ^(){
        double re = 0.0;
        LinkHandle_VAL_IFNOT(NSString){
            return re;
        }
        LinkGroupHandle_VAL(strFindNumber)
        NSScanner* scaner= [[NSScanner alloc] initWithString:_self];
        [scaner scanDouble:&re];
        return re;
    };
}
- (void)setStrFindNumber:(double (^)())strFindNumber{};

- (NSString *(^)())strReversed
{
    return ^id(){
        LinkHandle_REF(NSString, NSString)
        LinkGroupHandle_REF(strReversed)
        NSUInteger start = 0;
        NSUInteger end = _self.length - 1;
        NSString *tempStr;
        NSString *re = _self;
        NSLog(@"%@", self);
        while (start < end) {
            tempStr = [re substringWithRange:NSMakeRange(start, 1)];
            re = [re stringByReplacingCharactersInRange:NSMakeRange(start, 1) withString:[_self substringWithRange:NSMakeRange(end, 1)]];
            re = [re stringByReplacingCharactersInRange:NSMakeRange(end, 1) withString:tempStr];
            start++;
            end--;
        }
        return re;
    };
}
- (void)setStrReversed:(NSString *(^)())strReversed{};



- (NSUInteger (^)())strLinesCount
{
    return ^(){
        LinkHandle_VAL_IFNOT(NSString){
            return (NSUInteger)0;
        }
        LinkGroupHandle_VAL(strLinesCount)
        return [[_self componentsSeparatedByString:@"\n"] count];
    };
}
- (void)setStrLinesCount:(NSUInteger (^)())strLinesCount{};

- (NSString *(^)(NSUInteger))strSubToLine
{
    return ^id(NSUInteger toLine){
        LinkHandle_REF(NSString, NSString)
        LinkGroupHandle_REF(strSubToLine,toLine)
        NSMutableString* re = [NSMutableString new];
        NSArray<NSString*>* linesArr = [_self componentsSeparatedByString:@"\n"];
        [linesArr enumerateObjectsUsingBlock:^(NSString * _Nonnull str, NSUInteger idx, BOOL * _Nonnull stop) {
            if(idx < toLine){
                [re appendString:str];
                [re appendString:@"\n"];
            }
        }];
        return (NSString*)[re copy];
    };
}
- (void)setStrSubToLine:(NSString *(^)(NSUInteger))strSubToLine{};

- (NSString *(^)(NSStringEncoding))strURLEncode
{
    return ^id(NSStringEncoding encode){
        LinkHandle_REF(NSString, NSString)
        LinkGroupHandle_REF(strURLEncode,encode)
        return [_self stringByAddingPercentEscapesUsingEncoding:encode];
    };
}
- (void)setStrURLEncode:(NSString *(^)(NSStringEncoding))strURLEncode{};

- (NSString *(^)(NSStringEncoding))strURLDecode
{
    return ^id(NSStringEncoding encode){
        LinkHandle_REF(NSString, NSString)
        LinkGroupHandle_REF(strURLDecode,encode)
        return [_self stringByReplacingPercentEscapesUsingEncoding:encode];
    };
}
- (void)setStrURLDecode:(NSString *(^)(NSStringEncoding))strURLDecode{};

- (NSString *(^)())strURLEncodeUTF8
{
    return ^id(){
        LinkHandle_REF(NSString, NSString)
        LinkGroupHandle_REF(strURLEncodeUTF8)
        return _self.strURLEncode(NSUTF8StringEncoding);
    };
}
- (void)setStrURLEncodeUTF8:(NSString *(^)())strURLEncodeUTF8{};

- (NSString *(^)())strURLDecodeUTF8
{
    return ^id(){
        LinkHandle_REF(NSString, NSString)
        LinkGroupHandle_REF(strURLDecodeUTF8)
        return _self.strURLDecode(NSUTF8StringEncoding);
    };
}
- (void)setStrURLDecodeUTF8:(NSString *(^)())strURLDecodeUTF8{};

- (NSString *(^)())strURLBeforeKeyValues
{
    return ^id(){
        LinkHandle_REF(NSString, NSString)
        LinkGroupHandle_REF(strURLBeforeKeyValues)
        return [[_self componentsSeparatedByString:@"?"] firstObject];
    };
}
- (void)setStrURLBeforeKeyValues:(NSString *(^)())strURLBeforeKeyValues{};

- (NSDictionary *(^)())strURLKeyValues
{
    return ^id(){
        LinkHandle_REF(NSDictionary, NSString)
        LinkGroupHandle_REF(strURLKeyValues)
        NSArray<NSString*>* splitedArr = [_self componentsSeparatedByString:@"?"];
        if(splitedArr.count!=2)
            return @{};
        NSArray<NSString*>* kvStrArr = [splitedArr[1] componentsSeparatedByString:@"&"];
        NSMutableDictionary* kvDict = [NSMutableDictionary new];
        [kvStrArr enumerateObjectsUsingBlock:^(NSString * _Nonnull kvStr, NSUInteger idx, BOOL * _Nonnull stop) {
            
            NSArray<NSString*>* kvArr = [kvStr componentsSeparatedByString:@"="];
            if(kvArr.count==2)
                kvDict[kvArr[0]] = kvArr[1];
        }];
        return (NSDictionary*)[kvDict copy];
    };
}
- (void)setStrURLKeyValues:(NSDictionary *(^)())strURLKeyValues{};

- (NSString *(^)(NSString *))strURLValueForKey
{
    return ^id(NSString* key){
        LinkHandle_REF(NSString, NSString)
        LinkGroupHandle_REF(strURLValueForKey,key)
        NSDictionary* kvs = _self.strURLKeyValues();
        if(!kvs)
            return _self;
        return (NSString*)[kvs objectForKey:key];
    };
}
- (void)setStrURLValueForKey:(NSString *(^)(NSString *))strURLValueForKey{};

- (NSString *(^)(NSString *, NSString *))strURLSetValueForKey
{
    return ^id(NSString* value , NSString* key){
        LinkHandle_REF(NSString, NSString)
        LinkGroupHandle_REF(strURLSetValueForKey,value,key)
        NSArray<NSString*>* splitedArr = [_self componentsSeparatedByString:@"?"];
        if(splitedArr.count==1 && ![_self isEqualToString:@""]){
            return [NSString stringWithFormat:@"%@?%@=%@",splitedArr[0],key,value];
        }else if(splitedArr.count!=2){//0,3..
            return _self;
        }
        
        NSArray<NSString*>* kvStrArr = [splitedArr[1] componentsSeparatedByString:@"&"];//abc=abc
        
        NSMutableArray<NSString*>* kvStrArrM = [kvStrArr mutableCopy];
        __block BOOL hasKey = NO;
        [kvStrArr enumerateObjectsUsingBlock:^(NSString * _Nonnull kvStr, NSUInteger idx, BOOL * _Nonnull stop) {
            
            NSArray<NSString*>* kvArr = [kvStr componentsSeparatedByString:@"="];
            if(kvArr.count==2){
                if([kvArr[0] isEqualToString:key]){
                    
                    hasKey = YES;
                    kvStrArrM[idx] = [[kvArr[0] stringByAppendingString:@"="] stringByAppendingString:value];
                }
            }
        }];
        if(!hasKey){
            [kvStrArrM addObject:[[key stringByAppendingString:@"="] stringByAppendingString:value]];
        }
        //合
        NSMutableString* reURL = [NSMutableString new];
        [reURL appendString:splitedArr[0]];
        [reURL appendString:@"?"];//http//:www.abc.com/abc?
        [kvStrArrM enumerateObjectsUsingBlock:^(NSString * _Nonnull kvStr, NSUInteger idx, BOOL * _Nonnull stop) {
            
            [reURL appendString:kvStr];
            if(idx!=kvStrArrM.count-1)
                [reURL appendString:@"&"];//http//:www.abc.com/abc?abc=abc&...
        }];
        
        return (NSString*)[reURL copy];
    };
}
- (void)setStrURLSetValueForKey:(NSString *(^)(NSString *, NSString *))strURLSetValueForKey{};

- (NSString *(^)(NSDictionary<NSString*,NSString*> *))strURLSetKeyValueWithDict
{
    return ^id(NSDictionary<NSString*,NSString*>* keyValues){
        LinkHandle_REF(NSString, NSString)
        LinkGroupHandle_REF(strURLSetKeyValueWithDict,keyValues)
        NSArray<NSString*>* splitedArr = [_self componentsSeparatedByString:@"?"];
        if(splitedArr.count==1 && ![_self isEqualToString:@""]){
            
            NSMutableString* re = [NSMutableString stringWithFormat:@"%@?",splitedArr[0]];
            __block NSInteger idx = 0;
            [keyValues enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, NSString * _Nonnull value, BOOL * _Nonnull stop) {
                
                [re appendString:key];
                [re appendString:@"="];
                [re appendString:value];
                if(idx!=keyValues.count-1)
                    [re appendString:@"&"];
                idx++;
            }];
            return (NSString*)[re copy];
        }else if(splitedArr.count!=2){//0,3..
            return _self;
        }
        
        NSArray<NSString*>* kvStrArr = [splitedArr[1] componentsSeparatedByString:@"&"];//abc=abc,...
        NSMutableArray<NSString*>* kvStrArrM = [kvStrArr mutableCopy];
        
        [keyValues enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, NSString * _Nonnull value, BOOL * _Nonnull stop) {
            
            __block BOOL hasKey = NO;
            [kvStrArr enumerateObjectsUsingBlock:^(NSString * _Nonnull kvStr, NSUInteger idx, BOOL * _Nonnull stop) {
                
                NSArray<NSString*>* kvArr = [kvStr componentsSeparatedByString:@"="];
                if(kvArr.count==2){
                    if([kvArr[0] isEqualToString:key]){
                        
                        hasKey = YES;
                        kvStrArrM[idx] = [[kvArr[0] stringByAppendingString:@"="] stringByAppendingString:value];
                    }
                }
            }];
            if(!hasKey){
                [kvStrArrM addObject:[[key stringByAppendingString:@"="] stringByAppendingString:value]];
            }
        }];
        
        //合
        NSMutableString* reURL = [NSMutableString new];
        [reURL appendString:splitedArr[0]];
        [reURL appendString:@"?"];//http//:www.abc.com/abc?
        [kvStrArrM enumerateObjectsUsingBlock:^(NSString * _Nonnull kvStr, NSUInteger idx, BOOL * _Nonnull stop) {
            
            [reURL appendString:kvStr];
            if(idx!=kvStrArrM.count-1)
                [reURL appendString:@"&"];//http//:www.abc.com/abc?abc=abc&...
        }];
        
        return (NSString*)[reURL copy];
    };
}
- (void)setStrURLSetKeyValueWithDict:(NSString *(^)(NSDictionary<NSString *,NSString *> *))strURLSetKeyValueWithDict{};

- (NSArray *(^)())strURLAllKeys
{
    return ^id(){
        LinkHandle_REF(NSArray, NSString)
        LinkGroupHandle_REF(strURLAllKeys)
        NSDictionary* kvs = _self.strURLKeyValues();
        if(!kvs)
            return (NSArray *)nil;
        return [kvs allKeys];
    };
}
- (void)setStrURLAllKeys:(NSArray *(^)())strURLAllKeys{};

- (NSArray *(^)())strURLAllValues
{
    return ^id(){
        LinkHandle_REF(NSArray, NSString)
        LinkGroupHandle_REF(strURLAllValues)
        NSDictionary* kvs = _self.strURLKeyValues();
        if(!kvs)
            return (NSArray *)nil;
        return [kvs allValues];
    };
}
- (void)setStrURLAllValues:(NSArray *(^)())strURLAllValues{};

- (NSString *(^)(NSString *))strURLRemoveValueForKey
{
    return ^id(NSString* key){
        LinkHandle_REF(NSString, NSString)
        LinkGroupHandle_REF(strURLRemoveValueForKey,key)
        NSArray<NSString*>* splitedArr = [_self componentsSeparatedByString:@"?"];
        if(splitedArr.count!=2)
            return (NSString*)nil;
        
        NSArray<NSString*>* kvStrArr = [splitedArr[1] componentsSeparatedByString:@"&"];//abc=abc
        
        NSMutableArray<NSString*>* kvStrArrM = [kvStrArr mutableCopy];
        
        [kvStrArr enumerateObjectsUsingBlock:^(NSString * _Nonnull kvStr, NSUInteger idx, BOOL * _Nonnull stop) {
            
            NSArray<NSString*>* kvArr = [kvStr componentsSeparatedByString:@"="];
            if(kvArr.count==2){
                if([kvArr[0] isEqualToString:key]){
                    [kvStrArrM removeObjectAtIndex:idx];
                }
            }
        }];
        //合
        NSMutableString* reURL = [NSMutableString new];
        [reURL appendString:splitedArr[0]];
        [reURL appendString:@"?"];//http//:www.abc.com/abc?
        [kvStrArrM enumerateObjectsUsingBlock:^(NSString * _Nonnull kvStr, NSUInteger idx, BOOL * _Nonnull stop) {
            
            [reURL appendString:kvStr];
            if(idx!=kvStrArrM.count-1)
                [reURL appendString:@"&"];//http//:www.abc.com/abc?abc=abc&...
        }];
        
        return (NSString*)[reURL copy];
    };
}
- (void)setStrURLRemoveValueForKey:(NSString *(^)(NSString *))strURLRemoveValueForKey{};

- (NSString *(^)(NSString *, NSString *))strURLReplaceKeyWithKey
{
    return ^id(NSString* replaceKey , NSString* withKey){
        LinkHandle_REF(NSString, NSString)
        LinkGroupHandle_REF(strURLReplaceKeyWithKey,replaceKey,withKey)
        NSArray<NSString*>* splitedArr = [_self componentsSeparatedByString:@"?"];
        if(splitedArr.count!=2) return _self;
        
        NSArray<NSString*>* kvStrArr = [splitedArr[1] componentsSeparatedByString:@"&"];//abc=abc
        
        NSMutableArray<NSString*>* kvStrArrM = [kvStrArr mutableCopy];
        
        [kvStrArr enumerateObjectsUsingBlock:^(NSString * _Nonnull kvStr, NSUInteger idx, BOOL * _Nonnull stop) {
            
            NSArray<NSString*>* kvArr = [kvStr componentsSeparatedByString:@"="];
            if(kvArr.count==2){
                if([kvArr[0] isEqualToString:replaceKey]){
                    kvStrArrM[idx] = [[withKey stringByAppendingString:@"="] stringByAppendingString:kvArr[1]];
                }
            }
        }];
        //合
        NSMutableString* reURL = [NSMutableString new];
        [reURL appendString:splitedArr[0]];
        [reURL appendString:@"?"];//http//:www.abc.com/abc?
        [kvStrArrM enumerateObjectsUsingBlock:^(NSString * _Nonnull kvStr, NSUInteger idx, BOOL * _Nonnull stop) {
            
            [reURL appendString:kvStr];
            if(idx!=kvStrArrM.count-1)
                [reURL appendString:@"&"];//http//:www.abc.com/abc?abc=abc&...
        }];
        
        return (NSString*)[reURL copy];
    };
}
- (void)setStrURLReplaceKeyWithKey:(NSString *(^)(NSString *, NSString *))strURLReplaceKeyWithKey{};

- (NSString *(^)(NSDictionary<NSString *,NSString *> *))strURLReplaceKeyWithDict
{
    return ^id(NSDictionary<NSString*,NSString*>* replaceKey_withKey){
        LinkHandle_REF(NSString, NSString)
        LinkGroupHandle_REF(strURLReplaceKeyWithDict,replaceKey_withKey)
        NSArray<NSString*>* splitedArr = [_self componentsSeparatedByString:@"?"];
        if(splitedArr.count!=2) return _self;
        
        NSArray<NSString*>* kvStrArr = [splitedArr[1] componentsSeparatedByString:@"&"];//abc=abc
        
        NSMutableArray<NSString*>* kvStrArrM = [kvStrArr mutableCopy];
        [replaceKey_withKey enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull replaceKey, NSString * _Nonnull withKey, BOOL * _Nonnull stop) {
            
            [kvStrArr enumerateObjectsUsingBlock:^(NSString * _Nonnull kvStr, NSUInteger idx, BOOL * _Nonnull stop) {
                
                NSArray<NSString*>* kvArr = [kvStr componentsSeparatedByString:@"="];
                if(kvArr.count==2){
                    if([kvArr[0] isEqualToString:replaceKey]){
                        kvStrArrM[idx] = [[withKey stringByAppendingString:@"="] stringByAppendingString:kvArr[1]];
                    }
                }
            }];
        }];
        
        //合
        NSMutableString* reURL = [NSMutableString new];
        [reURL appendString:splitedArr[0]];
        [reURL appendString:@"?"];//http//:www.abc.com/abc?
        [kvStrArrM enumerateObjectsUsingBlock:^(NSString * _Nonnull kvStr, NSUInteger idx, BOOL * _Nonnull stop) {
            
            [reURL appendString:kvStr];
            if(idx!=kvStrArrM.count-1)
                [reURL appendString:@"&"];//http//:www.abc.com/abc?abc=abc&...
        }];
        
        return (NSString*)[reURL copy];
    };
}
- (void)setStrURLReplaceKeyWithDict:(NSString *(^)(NSDictionary<NSString *,NSString *> *))strURLReplaceKeyWithDict{};

- (NSString *(^)(NSString *))strPathWithName
{
    return ^id(NSString* type){
        LinkHandle_REF(NSString, NSString)
        LinkGroupHandle_REF(strPathWithName,type)
        return [[NSBundle mainBundle] pathForResource:_self ofType:type];
    };
}
- (void)setStrPathWithName:(NSString *(^)(NSString *))strPathWithName{};

- (NSString *(^)(NSString *))strPathAppendingComponent
{
    return ^id(NSString* component){
        LinkHandle_REF(NSString, NSString)
        LinkGroupHandle_REF(strPathAppendingComponent,component)
        return [_self stringByAppendingPathComponent:component];
    };
}
- (void)setStrPathAppendingComponent:(NSString *(^)(NSString *))strPathAppendingComponent{};
@end

@implementation NSString (NSStringLinkBlock)

- (void)strEnumerateScanIntegerUsingBlock:(void (^)(NSInteger num, NSUInteger idx, BOOL *stop))block
{
    if(block){

        NSError* error = nil;
        NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"[+\\-]?[0-9]+" options:NSRegularExpressionCaseInsensitive error:&error];
        if(error)
            return;
        NSArray* reArr = [regex matchesInString:self options:0 range:NSMakeRange(0, self.length)];
        [reArr enumerateObjectsUsingBlock:^(NSTextCheckingResult*  _Nonnull result, NSUInteger idx, BOOL * _Nonnull stop) {
            NSString* numStr = [self substringWithRange: result.range];
            block(numStr.integerValue , idx, stop);
        }];
    }
}

- (void)strEnumerateScanFloatingUsingBlock:(void(^)(double num, NSUInteger idx, BOOL *stop))block
{
    if(block){

        NSError* error = nil;
        NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"[+\\-]?(?:[0-9]*\\.[0-9]+|[0-9]+\\.)" options:NSRegularExpressionCaseInsensitive error:&error];
        if(error)
            return;
        NSArray* reArr = [regex matchesInString:self options:0 range:NSMakeRange(0, self.length)];
        [reArr enumerateObjectsUsingBlock:^(NSTextCheckingResult*  _Nonnull result, NSUInteger idx, BOOL * _Nonnull stop) {
            NSString* numStr = [self substringWithRange: result.range];
            block(numStr.doubleValue , idx, stop);
        }];
    }
}

- (void)strEnumerateScanNumberUsingBlock:(void(^)(double num, NSUInteger idx, BOOL *stop))block
{
    if(block){

        NSError* error = nil;
        NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"[+\\-]?\\d+(\\.\\d+)?" options:NSRegularExpressionCaseInsensitive error:&error];
        if(error)
            return;
        NSArray* reArr = [regex matchesInString:self options:0 range:NSMakeRange(0, self.length)];
        [reArr enumerateObjectsUsingBlock:^(NSTextCheckingResult*  _Nonnull result, NSUInteger idx, BOOL * _Nonnull stop) {
            NSString* numStr = [self substringWithRange: result.range];
            block(numStr.doubleValue , idx, stop);
        }];
    }
}

- (void)strEnumerateComposedUsingBlock:(void (^)(NSString *, NSRange, BOOL *))block
{
    if(block){

        [self enumerateSubstringsInRange:NSMakeRange(0, self.length) options:NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString * _Nullable substring, NSRange substringRange, NSRange enclosingRange, BOOL * _Nonnull stop) {
            block(substring,enclosingRange,stop);
        }];
    }
}

- (NSMutableString*)strEnumerateComposedModifiedUsingBlock:(void (^)(NSString *__autoreleasing *, NSRange, BOOL *))block
{
    if(block){
        NSMutableString* newStr = [NSMutableString new];
        [self enumerateSubstringsInRange:NSMakeRange(0, self.length) options:NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString * _Nullable substring, NSRange substringRange, NSRange enclosingRange, BOOL * _Nonnull stop) {
            block(&substring,enclosingRange,stop);
            [newStr appendString:substring];
        }];
        return newStr;
    }
    return [self mutableCopy];
}

- (void)strEnumerateComposedAndCustom:(NSString *)regx usingBlock:(void (^)(NSString *__autoreleasing, NSRange, BOOL, BOOL *))block
{
    if(!block) return;
    
    NSError* error = nil;
    NSRegularExpression* regExp = [[NSRegularExpression alloc] initWithPattern:regx options:0 error:&error];
    if(!error){
        
        NSRange range; BOOL isCustom = NO; BOOL stop = NO;
        NSMutableArray<NSTextCheckingResult*>* matchs = [[regExp matchesInString:self options:0 range:NSMakeRange(0, self.length)] mutableCopy];//获得匹配集
        for(int i=0; (i<self.length && !stop); i+=range.length){
            
            if(matchs.count && [matchs firstObject].range.location == i){
                //当前起始点是一个规则起点
                range = [matchs firstObject].range;
                [matchs removeObjectAtIndex:0];
                isCustom = YES;
            }else{
                //普通元字符
                range = [self rangeOfComposedCharacterSequenceAtIndex:i];
                isCustom = NO;
            }
            block([self substringWithRange:range] , range , isCustom , &stop);
        }
    }
}

- (NSString *)strEnumerateURLUsingBlock:(void (^)(NSString *__autoreleasing *urlBeforeKeyValue, NSString *__autoreleasing * key , NSString *__autoreleasing * value , BOOL * stop))block
{
    BOOL isStop = NO;
    NSArray<NSString*>* base_KVArr = [self componentsSeparatedByString:@"?"];
    NSString* baseURL = [base_KVArr firstObject];
    NSMutableArray<NSArray*>* kvArrM = [NSMutableArray new];//存储
    if(base_KVArr.count==2){
        
        NSArray<NSString*>* kvStrArr = [base_KVArr[1] componentsSeparatedByString:@"&"];
        for (int i=0; i<kvStrArr.count; i++) {
            
            NSArray* kvArr = [kvStrArr[i] componentsSeparatedByString:@"="];
            if(kvArr.count == 2){
                
                NSString* k = kvArr[0]; NSString* v = kvArr[1];
                if(!isStop)
                    block(&baseURL , &k , &v , &isStop);
                if(baseURL && k && v)
                    [kvArrM addObject:@[k,v]];
            }
        }
        
        NSMutableString* reStr = [NSMutableString new];
        [reStr appendString:baseURL];
        [reStr appendString:@"?"];
        [kvArrM enumerateObjectsUsingBlock:^(NSArray * _Nonnull kvArr, NSUInteger idx, BOOL * _Nonnull stop) {
            
            if(![kvArr[0] isEqualToString:@""] || ![kvArr[1] isEqualToString:@""]){
                
                [reStr appendString:[[kvArr[0] stringByAppendingString:@"="] stringByAppendingString:kvArr[1]]];
                if(idx!=kvArrM.count-1)
                    [reStr appendString:@"&"];
            }
        }];
        return [reStr copy];
    }else if (base_KVArr.count==1){
        
        NSString* k; NSString* v;
        block(&baseURL , &k , &v , &isStop);
        return baseURL;
    }
    return self;
}
@end