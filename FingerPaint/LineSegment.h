//
//  LineSegment.h
//  FingerPaint
//
//  Created by Aaron Johnson on 2017-10-13.
//  Copyright © 2017 Aaron Johnson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LineSegment : NSObject
- (instancetype)initWithFirst:(CGPoint)first andSecond:(CGPoint)second;
@property CGPoint first;
@property CGPoint second;
@end
