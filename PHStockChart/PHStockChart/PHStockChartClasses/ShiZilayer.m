//
//  shizilayer.m
//  Kxiantu
//
//  Created by Peter on 4/21/16.
//  Copyright © 2016 Peter. All rights reserved.
//

#import "Shizilayer.h"

#define VIEW_SIZE  self.bounds.size
#define color(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

@interface ShiZilayer()


@property (nonatomic,assign) CGFloat x;

@property (nonatomic,assign) CGFloat percentage;

@end




@implementation ShiZilayer


#pragma mark - 设置初始值
-(void)setXvalue:(CGFloat)x andYvalue:(CGFloat)y {
    
    _x = x;
    
    _percentage = y;
    
}


#pragma mark - 重绘图层
-(void)drawInContext:(CGContextRef)ctx {
    
    CGFloat lineWidth = self.lineWidth;
    CGFloat padding = 5;
    CGFloat buttonPadding = 20;
    CGFloat squareH = (VIEW_SIZE.height - 2 * padding - buttonPadding) / 6;

    //竖线
    CGContextMoveToPoint(ctx, _x, padding + 1);
    CGContextAddLineToPoint(ctx, _x, padding);
    CGContextSetLineWidth(ctx, lineWidth);
    CGContextStrokePath(ctx);
    
    CGContextMoveToPoint(ctx, _x, padding + 1 );
    CGContextAddLineToPoint(ctx, _x, padding + 4 * squareH);
    CGContextSetLineWidth(ctx, lineWidth);
    CGContextStrokePath(ctx);
  
    CGContextMoveToPoint(ctx, _x, 2 * padding + 4 * squareH);
    CGContextAddLineToPoint(ctx, _x, VIEW_SIZE.height - buttonPadding);
    CGContextSetLineWidth(ctx, lineWidth);
    CGContextStrokePath(ctx);
    
    
    
    CGFloat y = padding + (1 - _percentage) * 4 * squareH;
    
    //横线
    CGContextMoveToPoint(ctx, _x, y);
    CGContextAddLineToPoint(ctx, padding, y);
    CGContextSetLineWidth(ctx, lineWidth);
    CGContextStrokePath(ctx);
   
    CGContextMoveToPoint(ctx, _x, y);
    CGContextAddLineToPoint(ctx, VIEW_SIZE.width - padding , y);
    CGContextSetLineWidth(ctx, lineWidth);
    CGContextStrokePath(ctx);


}


#pragma mark - 设置线宽默认值
-(CGFloat)lineWidth {
    
    if(!_lineWidth) {
        _lineWidth = 0.4;
    }
    
    return _lineWidth;
}


@end
