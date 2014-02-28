//
//  PokemonSideBar.m
//  PokeWeakness
//
//  Created by Christian Sampaio on 2/28/14.
//  Copyright (c) 2014 Leonardo Tsuda. All rights reserved.
//

#import "PokemonSideBar.h"

@interface RNFrostedSidebar ()

- (void)handleTap:(UITapGestureRecognizer *)recognizer;

@end

@implementation PokemonSideBar

- (void)handleTap:(UITapGestureRecognizer *)recognizer
{
    [super handleTap:recognizer];
    
    CGPoint location = [recognizer locationInView:self.view];
    if (! CGRectContainsPoint(self.contentView.frame, location))
    {
        [[UIApplication sharedApplication] setStatusBarHidden:NO
                                                withAnimation:UIStatusBarAnimationFade];
    }
}

@end
