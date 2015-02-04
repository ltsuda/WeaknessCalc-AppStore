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
@property (weak, nonatomic) IBOutlet UIImageView *secondTypeImageView;
@property (weak, nonatomic) IBOutlet UIImageView *firstTypeImageView;

@property (weak, nonatomic) IBOutlet UIImageView *pokemonImageView;


@end

@implementation PokemonListCell

- (void)configureForPokemon:(PokemonObject *)pokemon
{
    self.nameLabel.text = pokemon.name;
    self.firstTypeImageView.image = [UIImage imageNamed:[PokemonSkill stringFromSkillType:pokemon.firstType]];
    self.secondTypeImageView.image = [UIImage imageNamed:[PokemonSkill stringFromSkillType:pokemon.secondType]];
    self.pokemonImageView.image = [UIImage imageNamed:pokemon.name] ?: [UIImage imageNamed:@"star"];
}

@end
