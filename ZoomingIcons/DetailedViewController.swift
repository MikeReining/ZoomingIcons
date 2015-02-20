//
//  DetailedViewController.swift
//  ZoomingIcons
//
//  Created by Michael Reining on 2/19/15.
//  Copyright (c) 2015 Mike Reining. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController {
    var icon: Icon!
    
    
    @IBOutlet weak var backgroundView: UIView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var summaryLabel: UILabel!
    
    @IBAction func backButtonPressed(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    override func viewDidLoad() {
        backgroundView.backgroundColor = icon.color
        imageView.image = icon.image
        titleLabel.text = icon.name
        summaryLabel.text = icon.summary
    }
    
    
}
