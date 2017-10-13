//
//  LineSegment.m
//  FingerPaint
//
//  Created by Aaron Johnson on 2017-10-13.
//  Copyright © 2017 Aaron Johnson. All rights reserved.
//

#import "LineSegment.h"

@implementation LineSegment
- (instancetype)initWithFirst:(CGPoint)first andSecond:(CGPoint)second{
    self = [super init];
    if (self) {
        _first = first;
        _second = second;
    }
    return self;
}
@end
