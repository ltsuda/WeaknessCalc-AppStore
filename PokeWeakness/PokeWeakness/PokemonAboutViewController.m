//
//  PokemonAboutViewController.m
//  PokeWeakness
//
//  Created by Christian Sampaio on 2/28/14.
//  Copyright (c) 2014 Leonardo Tsuda. All rights reserved.
//

#import "PokemonAboutViewController.h"

@interface PokemonAboutViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *profileImage;
- (IBAction)gitURLButton:(id)sender;
- (IBAction)facebookURLButton:(id)sender;
- (IBAction)facebookTranslatorURLButton:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *developerLabel;
@property (weak, nonatomic) IBOutlet UILabel *translatorLabel;

@end

@implementation PokemonAboutViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //add background search image
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"about"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];

    self.developerLabel.text = NSLocalizedString(@"Developer", @"");
    self.translatorLabel.text = NSLocalizedString(@"Translator", @"");
    self.profileImage.image = [UIImage imageNamed:@"photo"];
    
    UIButton *doneButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    doneButton.frame = CGRectMake((self.view.bounds.size.width)/2 - 30, (self.view.bounds.size.height) - 60, 60, 30);
    [doneButton setTitle: NSLocalizedString(@"Done", @"") forState:UIControlStateNormal];
    
    [doneButton addTarget:self action:@selector(doneButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:doneButton];

    
}

- (void)doneButtonTapped:(id)sender
{
    [self dismissViewControllerAnimated:YES
                             completion:nil];
}

- (IBAction)gitURLButton:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://chrisfsampaio.github.io"]];
}

- (IBAction)facebookURLButton:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://facebook.com/leonardotsuda"]];

}

- (IBAction)facebookTranslatorURLButton:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://facebook.com/Santos.Maka"]];
}
@end
