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

@interface PokemonDetailsViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *thumbImageView;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UILabel *firstTypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *secondTypeLabel;
@property (weak, nonatomic) IBOutlet UITableView *skillsTableView;
@property (strong, nonatomic) SectionDataSource *datasource;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;

@end

@implementation PokemonDetailsViewController

static NSString *kSkillCellIdentifier = @"kSkillCellIdentifier";

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.


    NSString *skillName = [[PokemonSkill stringFromSkillType:self.pokemon.firstType] lowercaseString];
    self.backgroundImageView.image = [UIImage imageNamed:skillName];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@bg.png", skillName]] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.translucent = NO;
    
    
    //change TableViewHeader color
    [[UITableViewHeaderFooterView appearance] setTintColor:[UIColor lightTextColor]];
    
    
    
    self.numberLabel.text = [NSString stringWithFormat:@"#%ld", (long)self.pokemon.objectID];
    self.firstTypeLabel.text = [PokemonSkill localizedStringFromSkillType:self.pokemon.firstType];
    self.secondTypeLabel.text = [PokemonSkill localizedStringFromSkillType:self.pokemon.secondType];
    self.thumbImageView.image = [UIImage imageNamed:self.pokemon.nameEN];
    self.title = self.pokemon.name;
    

    self.datasource = [[SectionDataSource alloc] initWithCellIdentifier:kSkillCellIdentifier
                                                     configureCellBlock:^(UITableViewCell *cell, PokemonSkill *item) {
                                                         if (item.value)
                                                         {
                                                             cell.textLabel.text = [NSString stringWithFormat:@"%@ : %.2f", item.localizedName, item.value];
                                                         }
                                                         else
                                                         {
                                                             cell.textLabel.text = [NSString stringWithFormat:@"%@ : X", item.localizedName];
                                                         }
                                                     }];
    
    self.datasource.items = @[self.pokemon.neutrals, self.pokemon.weakness, self.pokemon.resistances];
    self.skillsTableView.dataSource = self.datasource;
    
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
