//
//  PokemonDetailsViewController.m
//  PokeWeakness
//
//  Created by Christian Sampaio on 11/12/13.
//  Copyright (c) 2013 Leonardo Tsuda. All rights reserved.
//

#import "PokemonDetailsViewController.h"
#import "PokemonObject.h"

@interface PokemonDetailsViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *thumbImageView;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UILabel *firstTypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *secondTypeLabel;

@end

@implementation PokemonDetailsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.numberLabel.text = [@"#" stringByAppendingFormat:@"%d", self.pokemon.objectID];
    self.firstTypeLabel.text = @"";
    self.secondTypeLabel.text = @"";
    self.title = self.pokemon.name;
}

@end
