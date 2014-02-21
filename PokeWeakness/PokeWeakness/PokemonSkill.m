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
    NSString *localizedString = [self stringForType:type
                                          localized:YES];
    return localizedString;
}

+ (NSString *)stringFromSkillType:(PokemonSkillType)type
{
    NSString *skillName = [self stringForType:type
                                    localized:NO];
    return skillName;
}

+ (NSString *)stringForType:(PokemonSkillType)type
                  localized:(BOOL)localized
{
    NSString *skillString = nil, *englishString = nil;
    switch (type)
    {
        case PokemonTypeNone:
            skillString = NSLocalizedString(@"", @"");
            break;
            
        case PokemonTypeNormal:
            englishString = @"Normal";
            break;
            
        case PokemonTypeFire:
            englishString = @"Fire";
            break;
            
        case PokemonTypeWater:
            englishString = @"Water";
            break;
            
        case PokemonTypeElectric:
            englishString = @"Electric";
            break;
            
        case PokemonTypeGrass:
            englishString = @"Grass";
            break;
            
        case PokemonTypeIce:
            englishString = @"Ice";
            break;
            
        case PokemonTypeFighting:
            englishString = @"Fighting";
            break;
            
        case PokemonTypePoison:
            englishString = @"Poison";
            break;
            
        case PokemonTypeGround:
            englishString = @"Ground";
            break;
            
        case PokemonTypeFlying:
            englishString = @"Flying";
            break;
            
        case PokemonTypePsychic:
            englishString = @"Psychic";
            break;
            
        case PokemonTypeBug:
            englishString = @"Bug";
            break;
            
        case PokemonTypeRock:
            englishString = @"Rock";
            break;
            
        case PokemonTypeGhost:
            englishString = @"Ghost";
            break;
            
        case PokemonTypeDark:
            englishString = @"Dark";
            break;
            
        case PokemonTypeSteel:
            englishString = @"Steel";
            break;
            
        case PokemonTypeFairy:
            englishString = @"Fairy";
            break;
            
        case PokemonTypeDragon:
            englishString = @"Dragon";
            break;
    }
    skillString = localized ? NSLocalizedString(englishString, @"") : englishString;
    return skillString;
}

+ (NSArray *)skillsFromJSON:(NSDictionary *)JSON
{
    NSMutableArray *skills = [NSMutableArray array];
    [[JSON allKeys] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSString *key = obj;
        PokemonSkillType type = [PokemonSkill typeFromString:key];
        if (type != PokemonTypeNone)
        {
            PokemonSkill *skill = [PokemonSkill new];
            skill.skill = type;
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
        }
    }];
    return [skills copy];
}

- (NSString *)localizedName
{
    NSString *name = [PokemonSkill localizedStringFromSkillType:self.skill];
    return name;
}

@end
