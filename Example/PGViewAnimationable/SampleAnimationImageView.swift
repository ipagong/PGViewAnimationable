//
//  SampleAnimationImageView.swift
//  PGViewAnimationable
//
//  Created by ipagong on 2017. 5. 24..
//  Copyright © 2017년 CocoaPods. All rights reserved.
//

import UIKit
import PGViewAnimationable

class SampleAnimationImageView: UIImageView, ViewAnimationable {
    public var animationValue: AnimationValue = .default
    
    private var _animateImageName:String?
    var animateImageName:String? {
        set {
            guard let value = newValue else { return }
            guard value.isEmpty == false else { return }
            executeAnimation {
                self.image = UIImage(named: value)
                self._animateImageName = value
            }
        }
        get {
            return _animateImageName
        }
    }
}
