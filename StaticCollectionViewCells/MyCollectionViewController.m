//
//  MyCollectionViewController.m
//  StaticCollectionViewCells
//
//  Created by Robert Wünsch on 09.10.14.
//  Copyright (c) 2014 widescape. All rights reserved.
//

#import "MyCollectionViewController.h"

@implementation MyCollectionViewController

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
  return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
  // Enter the number of static cells that are present in the Storyboard's collection view:
  return 3;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
  // Enter the reusable identifiers that are defined for each cell in the Storyboard's collection view:
  NSArray *cellIdentifiers = @[@"RedCell", @"BlueCell", @"GreenCell"];
  NSInteger cellIdentifierIndex = indexPath.item;
  
  // Make one identifier the default cell for edge cases (we use red here):
  if (cellIdentifierIndex >= cellIdentifiers.count) cellIdentifierIndex = 0;
  
  UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifiers[cellIdentifierIndex] forIndexPath:indexPath];
  // Configure the cell …
  return cell;
}

@end
