//
//  PokemonObjectTests.m
//  PokeWeakness
//
//  Created by Christian Sampaio on 11/5/13.
//  Copyright (c) 2013 Leonardo Tsuda. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PokemonObject.h"

@interface PokemonObjectTests : XCTestCase

@end

@implementation PokemonObjectTests

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

- (void)testParseJSONDictionary
{
    NSDictionary *JSON = @{ @"No": @52,
                            @"Name": @"Meowth",
                            @"Type 1": @"Normal",
                            @"Type 2": @"",
                            
                            @"Attacker": @"",
                            
                            @"Normal": @1,
                            @"Fire": @2,
                            @"Water": @3,
                            @"Electric": @4,
                            @"Grass": @5,
                            @"Ice": @6,
                            @"Fighting": @7,
                            @"Poison": @8.5,
                            @"Ground": @9,
                            @"Flying": @10,
                            @"Psychic": @11,
                            @"Bug": @12,
                            @"Rock": @11,
                            @"Ghost": @"x",
                            @"Dragon": @1,
                            @"Dark": @1,
                            @"Steel": @66,
                            @"Fairy": @1};
    
    PokemonObject *pokemon = [PokemonObject parseFromJSONDictionary:JSON];
    XCTAssertEqual(pokemon.objectID, 52);
    XCTAssertEqualObjects(pokemon.name, @"Meowth");
    XCTAssertEqual(pokemon.firstType, PokemonTypeNormal);
    XCTAssertEqual(pokemon.secondType, PokemonTypeNone);
    
    XCTAssert([pokemon valueForSkillType:PokemonTypeNormal] == 1.0f);
    XCTAssert([pokemon valueForSkillType:PokemonTypeFire] == 2.0f);
    XCTAssert([pokemon valueForSkillType:PokemonTypeWater] == 3.0f);
    XCTAssert([pokemon valueForSkillType:PokemonTypeElectric] == 4.0f);
    XCTAssert([pokemon valueForSkillType:PokemonTypeGrass] == 5.0f);
    XCTAssert([pokemon valueForSkillType:PokemonTypeIce] == 6.0f);
    XCTAssert([pokemon valueForSkillType:PokemonTypeFighting] == 7.0f);
    XCTAssert([pokemon valueForSkillType:PokemonTypePoison] == 8.5f);
    XCTAssert([pokemon valueForSkillType:PokemonTypeFlying] == 10.0f);
    XCTAssert([pokemon valueForSkillType:PokemonTypePsychic] == 11.0f);
    XCTAssert([pokemon valueForSkillType:PokemonTypeBug] == 12.0f);
    XCTAssert([pokemon valueForSkillType:PokemonTypeRock] == 11.0f);
    XCTAssert([pokemon valueForSkillType:PokemonTypeGhost] == 0.0f);
    XCTAssert([pokemon valueForSkillType:PokemonTypeDragon] == 1.0f);
    XCTAssert([pokemon valueForSkillType:PokemonTypeSteel] == 66.0f);
    XCTAssert([pokemon valueForSkillType:PokemonTypeFairy] == 1.0f);
    XCTAssert([pokemon valueForSkillType:PokemonTypeNone] == 0.0f);
    
}

@end
