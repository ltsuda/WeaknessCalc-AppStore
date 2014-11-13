//
//  PokemonNavigationController.m
//  PokeWeakness
//
//  Created by Christian Sampaio on 2/27/14.
//  Copyright (c) 2014 Leonardo Tsuda. All rights reserved.
//

#import "PokemonNavigationController.h"
#import "PokemonSideBar.h"
#import <Social/Social.h>

@interface PokemonNavigationController () <RNFrostedSidebarDelegate>

@property (nonatomic, strong) PokemonSideBar *callout;
@end

@implementation PokemonNavigationController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSArray *buttonImages = @[
                              [UIImage imageNamed:@"profile"],
                              [UIImage imageNamed:@"facebook"],
                              [UIImage imageNamed:@"twitter"],
                              [UIImage imageNamed:@"star"],
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
    
    if  (![UIApplication sharedApplication].statusBarHidden) {
        [[UIApplication sharedApplication] setStatusBarHidden:YES
                                                withAnimation:UIStatusBarAnimationFade];
        [self.topViewController.navigationItem setHidesBackButton:YES animated:YES];
        [self.callout showInViewController:self.topViewController animated:YES];
        self.interactivePopGestureRecognizer.enabled = NO;
        [self.topViewController.navigationItem setHidesBackButton:YES animated:YES];
    }
}


#pragma mark RNFrostedSidebarDelegate

- (void)sidebar:(RNFrostedSidebar *)sidebar didDismissFromScreenAnimated:(BOOL)animatedYesOrNo {
    [self.topViewController.navigationItem setHidesBackButton:NO animated:YES];
    self.interactivePopGestureRecognizer.enabled = YES;
}

-   (void)sidebar:(RNFrostedSidebar *)sidebar didTapItemAtIndex:(NSUInteger)index
{
    if (index == 0)
    {
        [self performSegueWithIdentifier:@"AboutSegue" sender:self];
    }
    else if (index == 1)
    {
        
        if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook])
        {
            SLComposeViewController *facebookSheet = [SLComposeViewController
                                                      composeViewControllerForServiceType:SLServiceTypeFacebook];
            [facebookSheet setInitialText: NSLocalizedString(@"Search Pokemon, prepare your strategy and defeat your friends!", @"")];
            [facebookSheet addImage:[UIImage imageNamed:@"search"]];
            
            [self presentViewController:facebookSheet animated:YES completion:nil];
        }
        
    }
    else if (index == 2)
    {
        if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
        {
            SLComposeViewController *tweetSheet = [SLComposeViewController
                                                   composeViewControllerForServiceType:SLServiceTypeTwitter];
            [tweetSheet setInitialText:NSLocalizedString(@"Search Pokemon, prepare your strategy and defeat your friends!", @"")];
            [tweetSheet addImage:[UIImage imageNamed:@"search"]];
            
            [self presentViewController:tweetSheet animated:YES completion:nil];
        }
        
    }
    else if (index == 3)
    {
        
>>>>>>> parent of 69d2ac3... fix social integration
        
    }
}

@end
