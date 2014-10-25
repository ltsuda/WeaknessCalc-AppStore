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
@property (weak, nonatomic) IBOutlet UIImageView *profilecImage;
@property (weak, nonatomic) IBOutlet UIImageView *profilemImage;
@property (weak, nonatomic) IBOutlet UILabel *devtLabel;
@property (weak, nonatomic) IBOutlet UILabel *devcLabel;
@property (weak, nonatomic) IBOutlet UILabel *translatorLabel;
- (IBAction)gitURLButton:(id)sender;
- (IBAction)facebookURLButton:(id)sender;
- (IBAction)facebookTranslatorURLButton:(id)sender;


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

    self.profileImage.image = [UIImage imageNamed:@"profilet"];
    self.profilecImage.image = [UIImage imageNamed:@"profilec"];
    self.profilemImage.image = [UIImage imageNamed:@"profilem"];
    
    self.devtLabel.text = NSLocalizedString(@"Developer", @"");
    self.devcLabel.text = NSLocalizedString(@"Developer", @"");
    self.translatorLabel.text = NSLocalizedString(@"Translator", @"");
    
    UIButton *doneButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    doneButton.frame = CGRectMake((self.view.bounds.size.width)/2 - 30, (self.view.bounds.size.height) - 30, 60, 30);
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

        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://facebook.com/leonardotsuda"]];
}
@end
