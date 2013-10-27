//
//  PokemonParser.m
//  PokeWeakness
//
//  Created by Christian Sampaio on 10/27/13.
//  Copyright (c) 2013 Leonardo Tsuda. All rights reserved.
//

#import "PokemonCache.h"

@interface PokemonCache ()

@property (nonatomic, strong) NSArray *pokemons;

@end

@implementation PokemonCache

+ (PokemonCache *)sharedCache
{
    static dispatch_once_t onceToken;
    static PokemonCache *_sharedInstace;
    dispatch_once(&onceToken, ^{
        _sharedInstace = [[PokemonCache alloc] init];
        _sharedInstace.pokemons = [PokemonCache parsePokemons];
    });
    
    return _sharedInstace;
}

+ (NSArray *)parsePokemons
{
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *path = [bundle pathForResource:@"" ofType:@"json"];
    
    NSString *JSON = [NSString stringWithContentsOfFile:path
                                               encoding:NSUTF8StringEncoding
                                                  error:nil];
    
    NSData *pokemonsData = [JSON dataUsingEncoding:NSUTF8StringEncoding];
    id pokemons = [NSJSONSerialization JSONObjectWithData:pokemonsData
                                                  options:kNilOptions
                                                    error:nil];
    
    return pokemons;
}

@end
