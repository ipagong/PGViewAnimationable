//
//  ViewAnimationable.swift
//  Pods
//
//  Created by ipagong on 2017. 5. 23..
//
//

import Foundation

public typealias ViewAnimationBlock = (() -> (Void))

public enum ViewAnimationType: String {
    case right
    case left
    case up
    case down
    case fade
    case none
}

public protocol ViewAnimationable : class {
    
    var animationValue: AnimationValue { get }
    
    func disappearAnimation()
    
    func prepareAppearAnimation()
    
    func appearAnimation()
    
    func executeAnimation(_ changeBlock: ViewAnimationBlock?)
}

public struct AnimationValue {
    let type: ViewAnimationType
    
    let duration: TimeInterval
    
    let moveScale: CGFloat
    
    public init(type: ViewAnimationType, duration: TimeInterval = 0.5, moveScale: CGFloat = 0.2) {
        self.type = type
        self.duration = duration
        self.moveScale = moveScale
    }
}

extension AnimationValue {
    public static var `default` = AnimationValue(type: .up)
}

extension ViewAnimationable {
    public var animationValue: AnimationValue { AnimationValue.default }
    
    public func disappearAnimation() {
        guard self.animationValue.type != .none else { return }
        guard let selfView = self as? UIView else { return }
        
        selfView.alpha = 0
        selfView.clipsToBounds = true
        selfView.layer.masksToBounds = true
        
        var point:CGPoint = .zero
        
        switch self.animationValue.type {
        case .right: point = CGPoint(x:  selfView.bounds.width * self.animationValue.moveScale, y: 0)
        case .left:  point = CGPoint(x: -selfView.bounds.width * self.animationValue.moveScale, y: 0)
        case .up:    point = CGPoint(x: 0, y: -selfView.bounds.height * self.animationValue.moveScale)
        case .down:  point = CGPoint(x: 0, y:  selfView.bounds.height * self.animationValue.moveScale)
        default: break
        }
        
        selfView.transform = CGAffineTransform(translationX: point.x, y: point.y)
    }
    
    public func prepareAppearAnimation() {
        guard self.animationValue.type != .none else { return }
        guard let selfView = self as? UIView else { return }
        
        selfView.clipsToBounds = true
        selfView.layer.masksToBounds = true
        
        var point:CGPoint = .zero
        
        switch self.animationValue.type {
        case .right: point = CGPoint(x: -selfView.bounds.width * self.animationValue.moveScale, y: 0)
        case .left:  point = CGPoint(x:  selfView.bounds.width * self.animationValue.moveScale, y: 0)
        case .up:    point = CGPoint(x: 0, y:  selfView.bounds.height * self.animationValue.moveScale)
        case .down:  point = CGPoint(x: 0, y: -selfView.bounds.height * self.animationValue.moveScale)
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
        
        UIView.animate(withDuration: self.animationValue.duration/2, animations: { self.disappearAnimation() }) { _ in
            
            self.prepareAppearAnimation()
            changeBlock?()
            
            UIView.animate(withDuration: self.animationValue.duration/2, animations: { self.appearAnimation() })
        }
    }
}

