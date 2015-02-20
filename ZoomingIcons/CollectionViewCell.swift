//
//  CollectionViewCell.swift
//  ZoomingIcons
//
//  Created by Michael Reining on 2/19/15.
//  Copyright (c) 2015 Mike Reining. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var imageView: UIImageView!
 
    override func layoutSubviews() {
        super.layoutSubviews()
        colorView.layer.cornerRadius = bounds.width / 2 // 50 since cell is 100 wide
        colorView.layer.masksToBounds = true // not necessary since already setup in storyboard via autolayout
    }
    
    
}
