//
//  BlockDataSource.h
//  PokeWeakness
//
//  Created by Christian Sampaio on 11/12/13.
//  Copyright (c) 2013 Leonardo Tsuda. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^TableViewCellConfigureBlock)(id cell, id item);

@interface BlockDataSource : NSObject <UITableViewDataSource>

@property (strong, nonatomic) NSArray *items;

- (id)initWithCellIdentifier:(NSString *)aCellIdentifier
          configureCellBlock:(TableViewCellConfigureBlock)aConfigureCellBlock;

- (id)itemAtIndexPath:(NSIndexPath *)indexPath;

@end
