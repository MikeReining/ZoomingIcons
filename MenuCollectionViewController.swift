//
//  MenuCollectionViewController.swift
//  ZoomingIcons
//
//  Created by Michael Reining on 2/19/15.
//  Copyright (c) 2015 Mike Reining. All rights reserved.
//

import UIKit

class MenuCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    var icons = [Icon]()
    
    override func viewDidLoad() {
        collectionView!.contentInset = UIEdgeInsets(top: 100, left: 0, bottom: 0, right: 0)

        var icon1 = Icon(image: UIImage(named: "icon-twitter")!, color: UIColor(red: 0.255, green: 0.557, blue: 0.910, alpha: 1), name: "Twitter", summary: "Twitter is an...")
        icons.append(icon1)
        var icon2 = Icon(image: UIImage(named: "icon-facebook")!, color: UIColor(red: 0.239, green: 0.353, blue: 0.588, alpha: 1), name: "Facebook", summary: "Facebook is...")
        icons.append(icon2)
        var icon3 = Icon(image: UIImage(named: "icon-youtube")!, color: UIColor(red: 0.729, green: 0.188, blue: 0.180, alpha: 1), name: "You Tube", summary: "You Tube is...")
        icons.append(icon3)
        var icon4 = Icon(image: UIImage(named: "icon-vimeo")!, color: UIColor(red: 0.329, green: 0.737, blue: 0.988, alpha: 1), name: "Vimeo", summary: "Vimeo is...")
        icons.append(icon4)
        var icon5 = Icon(image: UIImage(named: "icon-instagram")!, color: UIColor(red: 0.325, green: 0.498, blue: 0.635, alpha: 1), name: "Instagram", summary: "Instagram is...")
        icons.append(icon5)
        
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
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CollectionCell", forIndexPath: indexPath) as CollectionViewCell
        if indexPath.section == 0 {
            cell.colorView.backgroundColor = icons[indexPath.item].color
            cell.imageView.image = icons[indexPath.item].image
        } else {
        cell.colorView.backgroundColor = icons[indexPath.item + 2].color
        cell.imageView.image = icons[indexPath.item + 2].image
        }
        
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
