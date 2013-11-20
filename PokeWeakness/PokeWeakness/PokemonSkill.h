//
//  PokemonSkill.h
//  PokeWeakness
//
//  Created by Christian Sampaio on 11/5/13.
//  Copyright (c) 2013 Leonardo Tsuda. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, PokemonSkillType)
{
    PokemonTypeNone,
    PokemonTypeNormal,
    PokemonTypeFire,
    PokemonTypeWater,
    PokemonTypeElectric,
    PokemonTypeGrass,
    PokemonTypeIce,
    PokemonTypeFighting,
    PokemonTypePoison,
    PokemonTypeGround,
    PokemonTypeFlying,
    PokemonTypePsychic,
    PokemonTypeBug,
    PokemonTypeRock,
    PokemonTypeGhost,
    PokemonTypeDragon,
    PokemonTypeDark,
    PokemonTypeSteel,
    PokemonTypeFairy
};


@interface PokemonSkill : NSObject

@property (nonatomic, assign) PokemonSkillType skill;
@property (nonatomic, assign) double value;

- (NSString *)localizedName;
+ (NSArray *)skillsFromJSON:(NSDictionary *)JSON;
+ (PokemonSkillType)typeFromString:(NSString *)string;
+ (NSString *)localizedStringFromSkillType:(PokemonSkillType)type;

@end
