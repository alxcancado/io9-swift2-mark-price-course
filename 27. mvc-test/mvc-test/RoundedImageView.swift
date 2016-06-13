//
//  RoundedImageView.swift
//  mvc-test
//
//  Created by Mark Price on 8/26/15.
//  Copyright © 2015 devslopes. All rights reserved.
//

import UIKit

class RoundedImageView: UIImageView {

    override func awakeFromNib() {
        self.layer.cornerRadius = 5.0
        self.clipsToBounds = true
    }

}
