//
//  PokemonSkill.m
//  PokeWeakness
//
//  Created by Christian Sampaio on 11/5/13.
//  Copyright (c) 2013 Leonardo Tsuda. All rights reserved.
//

#import "PokemonSkill.h"

@implementation PokemonSkill

+ (PokemonSkillType)typeFromString:(NSString *)string
{
    PokemonSkillType type = PokemonTypeNone;
    if ([string isEqualToString:@"Normal"])
    {
        type = PokemonTypeNormal;
    }
    else if ([string isEqualToString:@"Fire"])
    {
        type = PokemonTypeFire;
    }
    else if ([string isEqualToString:@"Water"])
    {
        type = PokemonTypeWater;
    }
    else if ([string isEqualToString:@"Electric"])
    {
        type = PokemonTypeElectric;
    }
    else if ([string isEqualToString:@"Grass"])
    {
        type = PokemonTypeGrass;
    }
    else if ([string isEqualToString:@"Ice"])
    {
        type = PokemonTypeIce;
    }
    else if ([string isEqualToString:@"Fighting"])
    {
        type = PokemonTypeFighting;
    }
    else if ([string isEqualToString:@"Poison"])
    {
        type = PokemonTypePoison;
    }
    else if ([string isEqualToString:@"Ground"])
    {
        type = PokemonTypeGround;
    }
    else if ([string isEqualToString:@"Flying"])
    {
        type = PokemonTypeFlying;
    }
    else if ([string isEqualToString:@"Psychic"])
    {
        type = PokemonTypePsychic;
    }
    else if ([string isEqualToString:@"Bug"])
    {
        type = PokemonTypeBug;
    }
    else if ([string isEqualToString:@"Rock"])
    {
        type = PokemonTypeRock;
    }
    else if ([string isEqualToString:@"Ghost"])
    {
        type = PokemonTypeGhost;
    }
    else if ([string isEqualToString:@"Dark"])
    {
        type = PokemonTypeDark;
    }
    else if ([string isEqualToString:@"Steel"])
    {
        type = PokemonTypeSteel;
    }
    else if ([string isEqualToString:@"Fairy"])
    {
        type = PokemonTypeFairy;
    }
    else if ([string isEqualToString:@"Dragon"])
    {
        type = PokemonTypeDragon;
    }
    
    return type;
}

+ (NSString *)localizedStringFromSkillType:(PokemonSkillType)type
{
    NSString *skillString = nil;
    switch (type)
    {
        case PokemonTypeNone:
            skillString = NSLocalizedString(@"", @"");
            break;
            
        case PokemonTypeNormal:
            skillString = NSLocalizedString(@"Normal", @"");
            break;
            
        case PokemonTypeFire:
            skillString = NSLocalizedString(@"Fire", @"");
            break;
            
        case PokemonTypeWater:
            skillString = NSLocalizedString(@"Water", @"");
            break;
            
        case PokemonTypeElectric:
            skillString = NSLocalizedString(@"Electric", @"");
            break;
            
        case PokemonTypeGrass:
            skillString = NSLocalizedString(@"Grass", @"");
            break;
            
        case PokemonTypeIce:
            skillString = NSLocalizedString(@"Ice", @"");
            break;
            
        case PokemonTypeFighting:
            skillString = NSLocalizedString(@"Fighting", @"");
            break;
            
        case PokemonTypePoison:
            skillString = NSLocalizedString(@"Poison", @"");
            break;
            
        case PokemonTypeGround:
            skillString = NSLocalizedString(@"Ground", @"");
            break;
            
        case PokemonTypeFlying:
            skillString = NSLocalizedString(@"Flying", @"");
            break;
            
        case PokemonTypePsychic:
            skillString = NSLocalizedString(@"Psychic", @"");
            break;
            
        case PokemonTypeBug:
            skillString = NSLocalizedString(@"Bug", @"");
            break;
            
        case PokemonTypeRock:
            skillString = NSLocalizedString(@"Rock", @"");
            break;
            
        case PokemonTypeGhost:
            skillString = NSLocalizedString(@"Ghost", @"");
            break;
            
        case PokemonTypeDark:
            skillString = NSLocalizedString(@"Dark", @"");
            break;
            
        case PokemonTypeSteel:
            skillString = NSLocalizedString(@"Steel", @"");
            break;
            
        case PokemonTypeFairy:
            skillString = NSLocalizedString(@"Fairy", @"");
            break;
            
        case PokemonTypeDragon:
            skillString = NSLocalizedString(@"Dragon", @"");
            break;
    }
    return skillString;
}

+ (NSArray *)skillsFromJSON:(NSDictionary *)JSON
{
    NSMutableArray *skills = [NSMutableArray array];
    [[JSON allKeys] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSString *key = obj;
        PokemonSkill *skill = [PokemonSkill new];
        skill.skill = [PokemonSkill typeFromString:key];
        id value = JSON[key];
        if ([value isKindOfClass:[NSNumber class]])
        {
            skill.value = [value doubleValue];
        }
        else
        {
            skill.value = 0.0f;
        }
        [skills addObject:skill];
    }];
    return [skills copy];
}


@end
