//
//  SampleAnimationLabel.swift
//  PGViewAnimationable
//
//  Created by ipagong on 2017. 5. 23..
//  Copyright © 2017년 CocoaPods. All rights reserved.
//

import UIKit
import PGViewAnimationable

class SampleAnimationLabel : UILabel, ViewAnimationable {
    
    public var type:ViewAnimationType = .up
    
    var animateText:String? {
        set {
            guard self.text != newValue else { return }
            executeAnimation { self.text = newValue }
        }
        get { return self.text }
    }
    
    var animateAttributedText: NSAttributedString? {
        set {
            guard self.attributedText != newValue else { return }
            executeAnimation { self.attributedText = newValue }
        }
        get { return self.attributedText }
    }
    
}
