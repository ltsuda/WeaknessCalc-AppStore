//
//  PokemonSearchViewController.m
//  PokeWeakness
//
//  Created by Christian Sampaio on 11/12/13.
//  Copyright (c) 2013 Leonardo Tsuda. All rights reserved.
//

#import "PokemonSearchViewController.h"
#import "BlockDataSource.h"
#import "PokemonCache.h"
#import "PokemonObject.h"
#import "PokemonDetailsViewController.h"
#import "PokemonListCell.h"

@interface PokemonSearchViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@property (nonatomic, strong) BlockDataSource *dataSource;
@property (weak, nonatomic) IBOutlet UITapGestureRecognizer *tapGesture;

@end

static NSString *kCellIdentifier = @"kPokemonSearchIdentifier";

@implementation PokemonSearchViewController

- (IBAction)textFieldEndEditing:(id)sender
{
    
}
- (IBAction)tappedView:(id)sender
{
    [self.view endEditing:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    
    //add background search image
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"search.png"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    
    _textField.placeholder = NSLocalizedString(@"Search a pokemon", @"");
    
    self.tapGesture.cancelsTouchesInView = NO;
    self.dataSource = [[BlockDataSource alloc] initWithCellIdentifier:kCellIdentifier configureCellBlock:^(PokemonListCell *cell, PokemonObject *item) {
        [cell configureForPokemon:item];
    }];
    
    self.tableView.dataSource = self.dataSource;
    self.textField.delegate = self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField endEditing:YES];
    return YES;
}

-               (BOOL)textField:(UITextField *)textField
  shouldChangeCharactersInRange:(NSRange)range
              replacementString:(NSString *)string
{
    
    NSString *searchString = [textField.text stringByReplacingCharactersInRange:range
                                                                     withString:string];
    searchString = [searchString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    
    NSPredicate *firstPredicate = [NSPredicate predicateWithFormat:@"nameEN contains[cd] %@", searchString];
    NSPredicate *secondPredicate = [NSPredicate predicateWithFormat:@"nameJP contains[cd] %@", searchString];
    NSPredicate *predicate = [NSCompoundPredicate orPredicateWithSubpredicates:@[firstPredicate, secondPredicate]];
    NSArray *cache = [[PokemonCache sharedCache] pokemons];
    NSArray *matchItems = [cache filteredArrayUsingPredicate:predicate];
    self.dataSource.items = matchItems;
    self.tableView.alpha = 0.0f;
    [UIView animateWithDuration:0.15f
                     animations:^{
                         self.tableView.alpha = 1.0f;
    }];

    [self.tableView reloadData];
    
    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue
                 sender:(id)sender
{
    NSIndexPath *selectedIndex = [self.tableView indexPathForSelectedRow];
    PokemonObject *pokemon = [self.dataSource itemAtIndexPath:selectedIndex];
    PokemonDetailsViewController *controller = segue.destinationViewController;
    controller.pokemon = pokemon;
}


@end
