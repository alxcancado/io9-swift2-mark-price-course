//
//  DragImage.swift
//  pokepet
//
//  Created by Alex Lima Lopes Cancado on 10/06/16.
//  Copyright © 2016 Alex Lima Lopes Cancado. All rights reserved.
//

import Foundation
import UIKit

class DragImage: UIImageView {
    
    var originalPosition: CGPoint!
    var dropTarget: UIView!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        originalPosition = self.center
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first {
            let position = touch.locationInView(self.superview)
            self.center = CGPointMake(position.x, position.y)
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        if let touch = touches.first, let target = dropTarget {
            
            // grab posi tion
            let position = touch.locationInView(self.superview)
            
            // if the position is anywhere inside the this frame, means you droped in the monster
            if CGRectContainsPoint(target.frame, position) {
                NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "onTargetDropped", object: nil))
            }
        }
        
        self.center = originalPosition
    }
}