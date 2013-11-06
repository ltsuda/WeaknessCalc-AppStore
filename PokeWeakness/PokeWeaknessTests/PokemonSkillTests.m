//
//  PokemonSkillTests.m
//  PokeWeakness
//
//  Created by Christian Sampaio on 11/5/13.
//  Copyright (c) 2013 Leonardo Tsuda. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PokemonSkill.h"

@interface PokemonSkillTests : XCTestCase

@end

@implementation PokemonSkillTests

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void)testParseSkillTypeWithInvalidString
{
    PokemonSkillType type = [PokemonSkill typeFromString:nil];
    XCTAssertEqual(type, PokemonTypeNone, @"nil string should be none type");
    
    type = [PokemonSkill typeFromString:@"jon"];
    XCTAssertEqual(type, PokemonTypeNone, @"invalid type string should be none");
    
    type = [PokemonSkill typeFromString:@"blah!"];
    XCTAssertEqual(type, PokemonTypeNone, @"invalid type string should be none");
}

- (void)testParseSkillWithValidString
{
    PokemonSkillType type = [PokemonSkill typeFromString:@"Normal"];
    XCTAssertEqual(PokemonTypeNormal, type);

    type = [PokemonSkill typeFromString:@"Fire"];
    XCTAssertEqual(PokemonTypeFire, type);
    
    type = [PokemonSkill typeFromString:@"Water"];
    XCTAssertEqual(PokemonTypeWater, type);
    
    type = [PokemonSkill typeFromString:@"Electric"];
    XCTAssertEqual(PokemonTypeElectric, type);
    
    type = [PokemonSkill typeFromString:@"Grass"];
    XCTAssertEqual(PokemonTypeGrass, type);
    
    type = [PokemonSkill typeFromString:@"Ice"];
    XCTAssertEqual(PokemonTypeIce, type);
    
    type = [PokemonSkill typeFromString:@"Poison"];
    XCTAssertEqual(PokemonTypePoison, type);
    
    type = [PokemonSkill typeFromString:@"Fighting"];
    XCTAssertEqual(PokemonTypeFighting, type);
    
    type = [PokemonSkill typeFromString:@"Ground"];
    XCTAssertEqual(PokemonTypeGround, type);
    
    type = [PokemonSkill typeFromString:@"Flying"];
    XCTAssertEqual(PokemonTypeFlying, type);
    
    type = [PokemonSkill typeFromString:@"Psychic"];
    XCTAssertEqual(PokemonTypePsychic, type);
    
    type = [PokemonSkill typeFromString:@"Bug"];
    XCTAssertEqual(PokemonTypeBug, type);
    
    type = [PokemonSkill typeFromString:@"Rock"];
    XCTAssertEqual(PokemonTypeRock, type);
    
    type = [PokemonSkill typeFromString:@"Ghost"];
    XCTAssertEqual(PokemonTypeGhost, type);
    
    type = [PokemonSkill typeFromString:@"Dragon"];
    XCTAssertEqual(PokemonTypeDragon, type);
    
    type = [PokemonSkill typeFromString:@"Dark"];
    XCTAssertEqual(PokemonTypeDark, type);
    
    type = [PokemonSkill typeFromString:@"Steel"];
    XCTAssertEqual(PokemonTypeSteel, type);
    
    type = [PokemonSkill typeFromString:@"Fairy"];
    XCTAssertEqual(PokemonTypeFairy, type);
    
}

@end
