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
    pokemon.nameEN = dictionary[@"NameEN"];
    pokemon.nameJP = dictionary[@"NameJP"];
    
    NSString *firstSkillString = dictionary[@"Type 1"];
    NSString *secondSkillString = dictionary[@"Type 2"];
    pokemon.firstType = [PokemonSkill typeFromString:firstSkillString];
    pokemon.secondType = [PokemonSkill typeFromString:secondSkillString];
    pokemon.skills = [PokemonSkill skillsFromJSON:dictionary];
    
    return pokemon;
}

- (NSString *)name
{
    NSString *language = [[[NSLocale preferredLanguages] firstObject] lowercaseString];
    NSString *name = nil;
    if ([language rangeOfString:@"ja"].location != NSNotFound)
    {
        name = self.nameJP;
    }
    else
    {
        name = self.nameEN;
    }
    return name;
}

- (NSArray *)weakness
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"value >= 2"];
    NSArray *skillss = [self.skills filteredArrayUsingPredicate:predicate];
    return skillss;
}

- (NSArray *)resistances
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"value < 1 && value > 0"];
    NSArray *skillss = [self.skills filteredArrayUsingPredicate:predicate];
    return skillss;
}

- (NSArray *)neutrals
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"value = 0"];
    NSArray *skillss = [self.skills filteredArrayUsingPredicate:predicate];
    return skillss;
}

- (CGFloat)valueForSkillType:(PokemonSkillType)skillType
{
    NSPredicate *filterSkill = [NSPredicate predicateWithFormat:@"skill = %d", skillType];
    PokemonSkill *skill = [[self.skills filteredArrayUsingPredicate:filterSkill] firstObject];
    return skill.value;
}

@end
