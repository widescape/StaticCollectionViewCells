StaticCollectionViewCells
=========================

An example Cocoa Touch app with static UICollectionView cells – each leading to different UIViewControllers

## How To Use

### In the Storyboard

* In the Attributes Inspector for the Collection View (of 'My Collection View Controller') set as many static cells as you like.
* Give each cell a unique Reusable Identifier (in the Attributes Inspector of each collection view cell). E.g. "RedCell"
* Create a UIViewController for each target scene.
* Control-drag from each cell to the desired UIViewController and select the Selection Segue "Push".

### In MyCollectionViewController.m

The Storyboard's collection view controller is configured to use the class ```MyCollectionViewController```.
Thus it will ask MyCollectionViewController for the number of cells and the cells itself.
That's because UICollectionView doesn't know about static cells like UITableView does.

So we have to simulate the static cells by telling the UICollectionView the number of items:


    - (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
    {
      // Enter the number of static cells that are present in the Storyboard's collection view:
      return 3;
    }

And by providing each cell using the cells' reusable identifiers:

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

*That's it.*