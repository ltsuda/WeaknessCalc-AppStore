//
//  UIPokemonListCell.m
//  PokeWeakness
//
//  Created by Christian Sampaio on 2/20/14.
//  Copyright (c) 2014 Leonardo Tsuda. All rights reserved.
//

#import "PokemonListCell.h"
#import "PokemonObject.h"
#import "PokemonSkill.h"

@interface PokemonListCell ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *firstTypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *secondTypeLabel;

@end

@implementation PokemonListCell

- (void)configureForPokemon:(PokemonObject *)pokemon
{
    self.nameLabel.text = pokemon.name;
    self.firstTypeLabel.text = [PokemonSkill localizedStringFromSkillType:pokemon.firstType];
    self.secondTypeLabel.text = [PokemonSkill localizedStringFromSkillType:pokemon.secondType];
}

@end
