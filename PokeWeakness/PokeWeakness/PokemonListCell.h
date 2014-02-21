//
//  UIPokemonListCell.h
//  PokeWeakness
//
//  Created by Christian Sampaio on 2/20/14.
//  Copyright (c) 2014 Leonardo Tsuda. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PokemonObject;

@interface PokemonListCell : UITableViewCell

- (void)configureForPokemon:(PokemonObject *)pokemon;

@end
