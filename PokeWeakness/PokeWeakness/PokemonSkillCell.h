//
//  PokemonSkillCell.h
//  PokeWeakness
//
//  Created by Christian Sampaio on 2/3/15.
//  Copyright (c) 2015 Leonardo Tsuda. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PokemonSkill;

@interface PokemonSkillCell : UITableViewCell

- (void)prepareWithSkill:(PokemonSkill *)skill;

@end
