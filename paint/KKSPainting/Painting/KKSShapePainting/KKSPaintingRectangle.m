//
//  KKSPaintingRectangle.m
//  MagicPaint
//
//  Created by kukushi on 7/25/14.
//  Copyright (c) 2014 Robin W. All rights reserved.
//

#import "KKSPaintingRectangle.h"
#import "KKSPaintingTool_KKSPaintingHelper.h"

@implementation KKSPaintingRectangle

- (void)drawPath {

    CGRect rectToDraw = [self rectToDraw];
    self.path = [UIBezierPath bezierPathWithRect:rectToDraw];

    [self setupBezierPath];
    [self.path applyTransform:[self currentTransform]];
    
    if (self.shouldFill) {
        [self.path fillWithBlendMode:kCGBlendModeNormal alpha:self.alpha];
    }
    
    [self.path strokeWithBlendMode:kCGBlendModeNormal alpha:self.alpha];

    [self updateSelectionStrokingPath];

    if (self.shouldStrokePath) {
        [self strokePathBounds];
    }
}

@end
