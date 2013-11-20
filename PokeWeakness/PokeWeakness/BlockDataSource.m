//
//  BlockDataSource.m
//  PokeWeakness
//
//  Created by Christian Sampaio on 11/12/13.
//  Copyright (c) 2013 Leonardo Tsuda. All rights reserved.
//

#import "BlockDataSource.h"

@interface BlockDataSource ()

@property (nonatomic, copy) NSString *cellIdentifier;
@property (nonatomic, copy) TableViewCellConfigureBlock configureCellBlock;

@end

@implementation BlockDataSource

- (id)init
{
    return nil;
}

- (id)initWithCellIdentifier:(NSString *)aCellIdentifier
          configureCellBlock:(TableViewCellConfigureBlock)aConfigureCellBlock
{
    self = [super init];
    if (self) {
        self.cellIdentifier = aCellIdentifier;
        self.configureCellBlock = [aConfigureCellBlock copy];
    }
    return self;
}

#pragma mark TableView DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    NSInteger count = [self.items count];
    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier
                                                            forIndexPath:indexPath];
    id item = [self itemAtIndexPath:indexPath];
    
    //
    if (self.configureCellBlock) {
        self.configureCellBlock(cell, item);
    }
    return cell;
}

- (id)itemAtIndexPath:(NSIndexPath *)indexPath
{
    return self.items[indexPath.row];
}

@end
