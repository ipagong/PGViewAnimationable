//
//  ViewAnimationable.swift
//  Pods
//
//  Created by ipagong on 2017. 5. 23..
//
//

import Foundation

public typealias ViewAnimationBlock = (Void) -> (Void)

public enum ViewAnimationType:String {
    case right
    case left
    case up
    case down
    case fade
    case none
}

public protocol ViewAnimationable : class {
    
    var type:ViewAnimationType { get set }
    
    //optional
    
    var duration:TimeInterval { get }
    
    var moveScale:CGFloat { get }
    
    func disappearAnimation()
    
    func prepareAppearAnimation()
    
    func appearAnimation()
    
    func executeAnimation(_ changeBlock: ViewAnimationBlock?)
    
}

extension ViewAnimationable {
    
    public var duration:TimeInterval { return 0.5 }
    public var moveScale:CGFloat { return 0.2 }
    
    public func disappearAnimation() {
        guard type != .none else { return }
        guard let selfView = self as? UIView else { return }
        
        selfView.alpha = 0
        selfView.clipsToBounds = true
        selfView.layer.masksToBounds = true
        
        var point:CGPoint = .zero
        
        switch type {
        case .right: point = CGPoint(x:  selfView.bounds.width * moveScale, y: 0)
        case .left:  point = CGPoint(x: -selfView.bounds.width * moveScale, y: 0)
        case .up:    point = CGPoint(x: 0, y: -selfView.bounds.height * moveScale)
        case .down:  point = CGPoint(x: 0, y:  selfView.bounds.height * moveScale)
        default: break
        }
        
        selfView.transform = CGAffineTransform(translationX: point.x, y: point.y)
    }
    
    public func prepareAppearAnimation() {
        guard type != .none else { return }
        guard let selfView = self as? UIView else { return }
        
        selfView.clipsToBounds = true
        selfView.layer.masksToBounds = true
        
        var point:CGPoint = .zero
        
        switch type {
        case .right: point = CGPoint(x: -selfView.bounds.width * moveScale, y: 0)
        case .left:  point = CGPoint(x:  selfView.bounds.width * moveScale, y: 0)
        case .up:    point = CGPoint(x: 0, y:  selfView.bounds.height * moveScale)
        case .down:  point = CGPoint(x: 0, y: -selfView.bounds.height * moveScale)
        default: break
        }
        
        selfView.transform = CGAffineTransform(translationX: point.x, y: point.y)
    }
    
    public func appearAnimation() {
        guard let selfView = self as? UIView else { return }
        
        selfView.clipsToBounds = true
        selfView.layer.masksToBounds = true
        
        selfView.alpha = 1
        selfView.transform = .identity
    }
    
    public func executeAnimation(_ changeBlock: ViewAnimationBlock?) {
        
        UIView.animate(withDuration: self.duration/2, animations: { self.disappearAnimation() }) { _ in
            
            self.prepareAppearAnimation()
            changeBlock?(())
            
            UIView.animate(withDuration: self.duration/2, animations: { self.appearAnimation() })
        }
    }
}

