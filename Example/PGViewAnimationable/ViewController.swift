//
//  ViewController.swift
//  PGViewAnimationable
//
//  Created by ipagong on 05/23/2017.
//  Copyright (c) 2017 ipagong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var leftLabel: SampleAnimationLabel!
    @IBOutlet weak var rightLabel: SampleAnimationLabel!
    @IBOutlet weak var upLabel: SampleAnimationLabel!
    @IBOutlet weak var downLabel: SampleAnimationLabel!
    @IBOutlet weak var fadeLabel: SampleAnimationLabel!
    
    @IBOutlet weak var leftImageView: SampleAnimationImageView!
    @IBOutlet weak var rightImageView: SampleAnimationImageView!
    @IBOutlet weak var upImageView: SampleAnimationImageView!
    @IBOutlet weak var downImageView: SampleAnimationImageView!
    @IBOutlet weak var fadeImageView: SampleAnimationImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        leftLabel.animationValue  = .init(type: .left)
        rightLabel.animationValue = .init(type: .right)
        upLabel.animationValue    = .init(type: .up)
        downLabel.animationValue  = .init(type: .down)
        fadeLabel.animationValue  = .init(type: .fade)
        
        
        leftImageView.animationValue  = .init(type: .left)
        rightImageView.animationValue = .init(type: .right)
        upImageView.animationValue    = .init(type: .up)
        downImageView.animationValue  = .init(type: .down)
        fadeImageView.animationValue  = .init(type: .fade)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    @IBAction func onValueChanged(_ sender: Any) {
        guard let segment = sender as? UISegmentedControl else { return }
        
        let title = segment.titleForSegment(at: segment.selectedSegmentIndex)
        
        segment.isEnabled = false
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.leftLabel.animateText = title
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            self.rightLabel.animateText = title
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.9) {
            self.upLabel.animateText = title
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
            self.downLabel.animateText = title
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.fadeLabel.animateText = title
            segment.isEnabled = true
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.leftImageView.animateImageName = title
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            self.rightImageView.animateImageName = title
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.9) {
            self.upImageView.animateImageName = title
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
            self.downImageView.animateImageName = title
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.fadeImageView.animateImageName = title
        }
    }
}

