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

        var icon1 = Icon(image: UIImage(named: "icon-twitter")!, color: UIColor(red: 0.255, green: 0.557, blue: 0.910, alpha: 1), name: "Twitter", summary: "Twitter is an online social networking service that enables users to send and read short 140-character messages called \"tweets\".")
        icons.append(icon1)
        var icon2 = Icon(image: UIImage(named: "icon-facebook")!, color: UIColor(red: 0.239, green: 0.353, blue: 0.588, alpha: 1), name: "Facebook", summary: "Facebook (formerly thefacebook) is an online social networking service headquartered in Menlo Park, California. Its name comes from a colloquialism for the directory given to students at some American universities.")
        icons.append(icon2)
        var icon3 = Icon(image: UIImage(named: "icon-youtube")!, color: UIColor(red: 0.729, green: 0.188, blue: 0.180, alpha: 1), name: "You Tube", summary: "Youtube” summary: “YouTube is a video-sharing website headquartered in San Bruno, California. The service was created by three former PayPal employees in February 2005 and has been owned by Google since late 2006. The site allows users to upload, view, and share videos.")
        icons.append(icon3)
        var icon4 = Icon(image: UIImage(named: "icon-vimeo")!, color: UIColor(red: 0.329, green: 0.737, blue: 0.988, alpha: 1), name: "Vimeo", summary: "Vimeo is a U.S.-based video-sharing website on which users can upload, share and view videos. Vimeo was founded in November 2004 by Jake Lodwick and Zach Klein.")
        icons.append(icon4)
        var icon5 = Icon(image: UIImage(named: "icon-instagram")!, color: UIColor(red: 0.325, green: 0.498, blue: 0.635, alpha: 1), name: "Instagram", summary: "Instagram is an online mobile photo-sharing, video-sharing and social networking service that enables its users to take pictures and videos, and share them on a variety of social networking platforms, such as Facebook, Twitter, Tumblr and Flickr.")
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
    
    // MARK: Navigation
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let dvc = self.storyboard?.instantiateViewControllerWithIdentifier("DetailedViewController") as DetailedViewController
        
        if indexPath.section == 0 {
            dvc.icon = icons[indexPath.item]
        } else {
            dvc.icon = icons[indexPath.item + 2]
        }
        
        self.navigationController!.pushViewController(dvc, animated: true)
    }
    
    
}
