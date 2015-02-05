//
//  PokemonDetailsViewController.m
//  PokeWeakness
//
//  Created by Christian Sampaio on 11/12/13.
//  Copyright (c) 2013 Leonardo Tsuda. All rights reserved.
//

#import "PokemonDetailsViewController.h"
#import "PokemonObject.h"
#import "PokemonSkill.h"
#import "SectionDataSource.h"
#import "PokemonSkillCell.h"
#import "QuartzCore/QuartzCore.h"

@interface PokemonDetailsViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *thumbImageView;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UITableView *skillsTableView;
@property (strong, nonatomic) SectionDataSource *datasource;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UIImageView *firstTypeImageView;
@property (weak, nonatomic) IBOutlet UIImageView *secondTypeImageView;
@property (weak, nonatomic) IBOutlet UIImageView *windowImagaView;
@property (weak, nonatomic) IBOutlet UIImageView *tableViewWindowImageView;

@end

@implementation PokemonDetailsViewController

static NSString *kSkillCellIdentifier = @"kSkillCellIdentifier";

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.

    
    NSString *skillName = [[PokemonSkill stringFromSkillType:self.pokemon.firstType] uppercaseString];
    self.backgroundImageView.image = [UIImage imageNamed:skillName];
    
    self.navigationController.navigationBar.barTintColor = [UIColor lightGrayColor];
    [self.navigationController.navigationBar setTintColor:[UIColor blackColor]];
    self.navigationController.navigationBar.translucent = NO;
    
    self.windowImagaView.layer.cornerRadius = 7.5f;
    self.windowImagaView.clipsToBounds = YES;
    
    self.tableViewWindowImageView.layer.cornerRadius = 7.5f;
    self.tableViewWindowImageView.alpha = 0.25f;
    self.tableViewWindowImageView.clipsToBounds = YES;
    
    self.numberLabel.text = [NSString stringWithFormat:@"#%ld", (long)self.pokemon.objectID];
    self.firstTypeImageView.image = [UIImage imageNamed:[PokemonSkill stringFromSkillType:self.pokemon.firstType]];
    self.secondTypeImageView.image = [UIImage imageNamed:[PokemonSkill stringFromSkillType:self.pokemon.secondType]];
    self.thumbImageView.image = [UIImage imageNamed:self.pokemon.nameEN];
    self.title = self.pokemon.name;

    self.datasource = [[SectionDataSource alloc] initWithCellIdentifier:kSkillCellIdentifier
                                                     configureCellBlock:^(PokemonSkillCell *cell, PokemonSkill *item) {
                                                         [cell prepareWithSkill:item];
                                                     }];
    
    self.datasource.items = @[self.pokemon.neutrals, self.pokemon.weakness, self.pokemon.resistances];
    self.skillsTableView.dataSource = self.datasource;
    
    //set firstTypeImageView position to secondTypeImageView's position
    if ([PokemonSkill stringFromSkillType:self.pokemon.secondType] == [PokemonSkill stringFromSkillType:PokemonTypeNone]) {
        self.secondTypeImageView.image = [UIImage imageNamed:[PokemonSkill stringFromSkillType:self.pokemon.firstType]];
        self.firstTypeImageView.image = [UIImage imageNamed:[PokemonSkill stringFromSkillType:PokemonTypeNone]];
    }
        
    [self.skillsTableView reloadData];
}

- (void)viewDidAppear:(BOOL)animated
{
    [self.skillsTableView flashScrollIndicators];
    
    [super viewDidAppear:animated];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];

    
}

@end
