//
//  PokemonObject.h
//  PokeWeakness
//
//  Created by Christian Sampaio on 11/5/13.
//  Copyright (c) 2013 Leonardo Tsuda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PokemonSkill.h"

@interface PokemonObject : NSObject

@property (nonatomic, assign) NSInteger objectID;
@property (nonatomic, readonly) NSString *name;
@property (nonatomic, copy) NSString *nameEN;
@property (nonatomic, copy) NSString *nameJP;
@property (nonatomic, assign) PokemonSkillType firstType;
@property (nonatomic, assign) PokemonSkillType secondType;
@property (nonatomic, copy) NSArray *skills;

- (CGFloat)valueForSkillType:(PokemonSkillType)skillType;

+ (instancetype)parseFromJSONDictionary:(NSDictionary *)dictionary;

@end
