//
//  Icon.swift
//  ZoomingIcons
//
//  Created by Michael Reining on 2/19/15.
//  Copyright (c) 2015 Mike Reining. All rights reserved.
//

import UIKit

class Icon  {
    var image: UIImage
    var color: UIColor
    var name: String
    var summary: String
    
    init(image: UIImage, color: UIColor, name: String, summary: String) {
        self.image = image
        self.color = color
        self.name = name
        self.summary = summary
    }
}
