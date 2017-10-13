//
//  Paint.h
//  FingerPaint
//
//  Created by Aaron Johnson on 2017-10-13.
//  Copyright © 2017 Aaron Johnson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LineSegment.h"

@interface Paint : UIView
@property NSMutableArray *lineSegments;
@property UIColor *currentColor;
-(void)colors;
-(void)drawRect:(CGRect)rect;
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event;
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event;
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event;
@end
