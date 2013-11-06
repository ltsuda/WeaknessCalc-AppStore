//
//  PokemonObject.m
//  PokeWeakness
//
//  Created by Christian Sampaio on 11/5/13.
//  Copyright (c) 2013 Leonardo Tsuda. All rights reserved.
//

#import "PokemonObject.h"

@implementation PokemonObject

+ (instancetype)parseFromJSONDictionary:(NSDictionary *)dictionary
{
    PokemonObject *pokemon = [PokemonObject new];
    pokemon.objectID = [dictionary[@"No"] integerValue];
    pokemon.name = dictionary[@"Name"];
    
    NSString *firstSkillString = dictionary[@"Type 1"];
    NSString *secondSkillString = dictionary[@"Type 2"];
    pokemon.firstType = [PokemonSkill typeFromString:firstSkillString];
    pokemon.secondType = [PokemonSkill typeFromString:secondSkillString];
    pokemon.skills = [PokemonSkill skillsFromJSON:dictionary];
    
    return pokemon;
}

- (CGFloat)valueForSkillType:(PokemonSkillType)skillType
{
    NSPredicate *filterSkill = [NSPredicate predicateWithFormat:@"skill = %d", skillType];
    PokemonSkill *skill = [[self.skills filteredArrayUsingPredicate:filterSkill] firstObject];
    return skill.value;
}

@end
