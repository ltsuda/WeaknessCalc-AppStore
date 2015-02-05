//
//  SectionDataSource.m
//  PokeWeakness
//
//  Created by Christian Sampaio on 11/20/13.
//  Copyright (c) 2013 Leonardo Tsuda. All rights reserved.
//

#import "SectionDataSource.h"

@implementation SectionDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.items.count;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    NSInteger count = [self.items[section] count];
    return count;
}

- (id)itemAtIndexPath:(NSIndexPath *)indexPath
{
    return self.items[indexPath.section][indexPath.row];
}

- (NSString *)tableView:(UITableView *)tableView
titleForHeaderInSection:(NSInteger)section
{
    NSString *title = nil;
    NSInteger rows = [self tableView:tableView
               numberOfRowsInSection:section];
    
    if (rows)
    {

        switch (section)
        {
            case 0:
                title = @"Not Affected By:";
                break;
                
            case 1:
                title = @"Weak Against:";
                break;
                
            case 2:
                title = @"Resistant Against:";
                break;
        }
        
    }
    return title;
}



@end
