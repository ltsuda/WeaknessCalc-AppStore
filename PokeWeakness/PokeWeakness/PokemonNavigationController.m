//
//  PokemonNavigationController.m
//  PokeWeakness
//
//  Created by Christian Sampaio on 2/27/14.
//  Copyright (c) 2014 Leonardo Tsuda. All rights reserved.
//

#import "PokemonNavigationController.h"
#import "PokemonSideBar.h"

@interface PokemonNavigationController () <RNFrostedSidebarDelegate>

@property (nonatomic, strong) PokemonSideBar *callout;

@end

@implementation PokemonNavigationController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSArray *buttonImages = @[
                              [UIImage imageNamed:@"Chespin"],
                              [UIImage imageNamed:@"Meowth"]
                              ];
    self.callout = [[PokemonSideBar alloc] initWithImages:buttonImages];
    self.callout.showFromRight = YES;
    self.callout.delegate = self;
    
    UIScreenEdgePanGestureRecognizer *gesture = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(edgeGestureAction:)];
    gesture.edges = UIRectEdgeRight;
    [self.view addGestureRecognizer:gesture];
}

- (void)edgeGestureAction:(UIScreenEdgePanGestureRecognizer *)gesture
{
    [[UIApplication sharedApplication] setStatusBarHidden:YES
                                            withAnimation:UIStatusBarAnimationFade];
    [self.callout show];
}


#pragma mark RNFrostedSidebarDelegate

-   (void)sidebar:(RNFrostedSidebar *)sidebar
didTapItemAtIndex:(NSUInteger)index
{
    if (index == 0)
    {
        [self performSegueWithIdentifier:@"AboutSegue" sender:self];
    }
    else if (index == 1)
    {
        
    }
}

@end
