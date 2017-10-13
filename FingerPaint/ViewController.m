//
//  ViewController.m
//  FingerPaint
//
//  Created by Aaron Johnson on 2017-10-13.
//  Copyright © 2017 Aaron Johnson. All rights reserved.
//

#import "ViewController.h"
#import "LineSegment.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _paintView = [[Paint alloc] initWithFrame:CGRectZero];
    self.paintView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.paintView];
    self.paintView.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint constraintWithItem:self.paintView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0.0].active = YES;
    [NSLayoutConstraint constraintWithItem:self.paintView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0.0].active = YES;
    [NSLayoutConstraint constraintWithItem:self.paintView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:0.0].active = YES;
    [NSLayoutConstraint constraintWithItem:self.paintView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0].active = YES;
    
    NSMutableArray *buttons = [NSMutableArray new];
    for(int i = 0; i < 4; i++){
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.frame = CGRectZero;
        [self.view addSubview:button];
        [buttons addObject:button];
    }
    [buttons[0] addTarget:self
                   action:@selector(clear)
     forControlEvents:UIControlEventTouchUpInside];
    [buttons[0] setTitle:@"Clear" forState:UIControlStateNormal];
    [buttons[1] addTarget:self
                   action:@selector(black)
         forControlEvents:UIControlEventTouchUpInside];
    [buttons[1] setTitle:@"Black" forState:UIControlStateNormal];
    [buttons[2] addTarget:self
                   action:@selector(red)
         forControlEvents:UIControlEventTouchUpInside];
    [buttons[2] setTitle:@"Red" forState:UIControlStateNormal];
    [buttons[3] addTarget:self
                   action:@selector(white)
         forControlEvents:UIControlEventTouchUpInside];
    [buttons[3] setTitle:@"White" forState:UIControlStateNormal];
    
    UIStackView *buttonStack = [[UIStackView alloc] initWithArrangedSubviews:buttons];
    buttonStack.axis = 0;
    buttonStack.distribution = UIStackViewDistributionFillEqually;
    buttonStack.alignment = UIStackViewAlignmentFill;
    buttonStack.spacing = 15;
    buttonStack.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:buttonStack];
    [NSLayoutConstraint constraintWithItem:buttonStack attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0.0].active = YES;
    [NSLayoutConstraint constraintWithItem:buttonStack attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0.0].active = YES;
    [NSLayoutConstraint constraintWithItem:buttonStack attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:75.0].active = YES;
    [NSLayoutConstraint constraintWithItem:buttonStack attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0].active = YES;
    
    
    
}
-(void)clear{
    [self.paintView colors];
    [self.paintView setNeedsDisplay];
}
-(void)black{
    self.paintView.currentColor = [UIColor blackColor];
}
-(void)red{
    self.paintView.currentColor = [UIColor redColor];
}
-(void)white{
    self.paintView.currentColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
