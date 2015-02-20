//
//  MenuCollectionViewController.swift
//  ZoomingIcons
//
//  Created by Michael Reining on 2/19/15.
//  Copyright (c) 2015 Mike Reining. All rights reserved.
//

import UIKit

class MenuCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    
    override func viewDidLoad() {
        collectionView!.contentInset = UIEdgeInsets(top: 100, left: 0, bottom: 0, right: 0)

    }
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 2
    }
    
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:     return 2
        case 1:     return 3
        default:    return 0
        }
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CollectionCell", forIndexPath: indexPath) as UICollectionViewCell
        println(indexPath.item)
        // Configure the cell
        return cell
    }

    // MARK: UICollectionViewDelegateFlowLayout
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        var numberOfCellsInSection = collectionView.numberOfItemsInSection(section)
        let layout = collectionViewLayout as UICollectionViewFlowLayout
        let cellWidth = layout.itemSize.width
        let collectionViewWidth = collectionView.bounds.width
        let cellPadding = layout.minimumInteritemSpacing
        let requiredInset = (collectionViewWidth - (cellWidth * CGFloat(numberOfCellsInSection)) - (cellPadding * CGFloat(numberOfCellsInSection))) / 2
        let edgeInsets = UIEdgeInsets(top: 0, left: requiredInset, bottom: 50, right: requiredInset)
        return edgeInsets
    }
    
    
}
