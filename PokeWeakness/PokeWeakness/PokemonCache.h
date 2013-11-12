//
//  PokemonParser.h
//  PokeWeakness
//
//  Created by Christian Sampaio on 10/27/13.
//  Copyright (c) 2013 Leonardo Tsuda. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PokemonCache : NSObject

@property (nonatomic, strong, readonly) NSArray *pokemons;

+ (PokemonCache *)sharedCache;

@end
