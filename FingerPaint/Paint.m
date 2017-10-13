//
//  Paint.m
//  FingerPaint
//
//  Created by Aaron Johnson on 2017-10-13.
//  Copyright © 2017 Aaron Johnson. All rights reserved.
//

#import "Paint.h"

@implementation Paint
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        _currentColor = [UIColor blackColor];
        [self colors];
    }
    return self;
}
-(void)colors{
    _lineSegments = [NSMutableArray new];
    [self.lineSegments addObject:[NSMutableArray new]]; //black
    [self.lineSegments addObject:[NSMutableArray new]]; //red
    [self.lineSegments addObject:[NSMutableArray new]]; //white
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    int i;
    if(self.currentColor == [UIColor blackColor]){
        i = 0;
    } else if(self.currentColor == [UIColor redColor]){
        i = 1;
    } else {
        i = 2;
    }
    CGPoint point = [[touches anyObject] locationInView:self];
    [self.lineSegments[i] addObject:[[LineSegment alloc] initWithFirst:point andSecond:point]];
    [self setNeedsDisplay];
}
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    int i;
    if(self.currentColor == [UIColor blackColor]){
        i = 0;
    } else if(self.currentColor == [UIColor redColor]){
        i = 1;
    } else {
        i = 2;
    }
    CGPoint secondPoint = [[touches anyObject] locationInView:self];
    CGPoint firstPoint = [[touches anyObject] previousLocationInView:self];
    [self.lineSegments[i] addObject:[[LineSegment alloc] initWithFirst:firstPoint andSecond:secondPoint]];
    [self setNeedsDisplay];
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}
-(void)drawRect:(CGRect)rect{
    NSArray *colors = [[NSArray alloc] initWithObjects:[UIColor blackColor], [UIColor redColor], [UIColor whiteColor], nil];
    NSArray *paths = [[NSArray alloc] initWithObjects:[UIBezierPath bezierPath],[UIBezierPath bezierPath],[UIBezierPath bezierPath],nil];
    for(int i = 0; i < 3; i++){
        [paths[i] setLineWidth:5.0];
        [paths[i] setLineCapStyle:kCGLineCapRound];
        [colors[i] setStroke];
        for (LineSegment *segment in self.lineSegments[i]) {
            if (CGPointEqualToPoint(segment.first, segment.second)) {
                // If start/end point of line segment is the same (i.e. this is the first
                // point, then move to that point so that line is drawn starting from that
                // point
                [paths[i] moveToPoint:segment.first];
                continue;
            }
            // Draw a line from the previous line segment to the first point
            [paths[i] addLineToPoint:segment.first];
            // Draw a line from the first point to the second point
            [paths[i] addLineToPoint:segment.second];
            [paths[i] stroke];
        }
    }
}

@end
