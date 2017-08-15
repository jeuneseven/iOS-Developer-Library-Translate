//
//  ElementsSortedByNameDataSource.m
//  The Elements
//
//  Created by 李占昆 on 2017/8/11.
//  Copyright © 2017年 kkk. All rights reserved.
//

#import "ElementsSortedByNameDataSource.h"
#import "AtomicElementTableViewCell.h"

@implementation ElementsSortedByNameDataSource

- (NSString *)name {
    return @"name";
}

- (UIColor *)backgroundColor {
    return [UIColor redColor];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AtomicElementTableViewCell *cell = (AtomicElementTableViewCell *)[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([AtomicElementTableViewCell class]) forIndexPath:indexPath];
    
    return cell;
}

@end
