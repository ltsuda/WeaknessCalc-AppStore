//
//  PokemonSkillCell.m
//  PokeWeakness
//
//  Created by Christian Sampaio on 2/3/15.
//  Copyright (c) 2015 Leonardo Tsuda. All rights reserved.
//

#import "PokemonSkillCell.h"
#import "PokemonSkill.h"

@interface PokemonSkillCell ()

@property (weak, nonatomic) IBOutlet UIImageView *typeDescriptionImageView;
@property (weak, nonatomic) IBOutlet UIImageView *typeImageView;

@end

@implementation PokemonSkillCell

static NSNumberFormatter *_formatter = nil;

+ (NSNumberFormatter *)formatter {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _formatter = [NSNumberFormatter new];
        _formatter.numberStyle = NSNumberFormatterDecimalStyle;
        _formatter.decimalSeparator = @".";
        _formatter.minimumFractionDigits = 2;
        _formatter.maximumFractionDigits = 2;
    });
    
    return _formatter;
}

- (void)prepareWithSkill:(PokemonSkill *)skill {
    self.typeDescriptionImageView.image = [UIImage imageNamed:[PokemonSkill stringFromSkillType:skill.skill]];
    
    NSString *typeString = @"0";
    
    if (skill.value >= 1) {
        typeString = [[PokemonSkillCell formatter] stringFromNumber:@(skill.value)];
    } else if (skill.value == 0.25) {
        typeString = @"quarter";
    } else if (skill.value == 0.50) {
        typeString = @"half";
    }
    
    self.typeImageView.image = [UIImage imageNamed:typeString];
}

@end
