//
//  UIView + Additions.swift
//  CoreLayout
//
//  Created by Aitor Salvador on 18/11/2019.
//  Copyright © 2019 Aitor Salvador. All rights reserved.
//

public extension UIView {
    static var identifier: String {
        String(describing: self)
    }
    
    func addSubviews(_ views: UIView...) {
        views.forEach {
            addSubview($0)
        }
    }
    
    func circled() {
        clipsToBounds = true
        layer.cornerRadius = min(bounds.width / 2, bounds.height / 2)
        layer.masksToBounds = true
    }
    
    func setRadius(_ cornerRadius: CGFloat) {
        clipsToBounds = true
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
    }
    
    func embedSubview(_ subview: UIView) {
        if subview.superview == self { return }
        
        if subview.superview != nil {
            subview.removeFromSuperview()
        }
        
        subview.translatesAutoresizingMaskIntoConstraints = false
        
        subview.frame = bounds
        addSubview(subview)
        
        NSLayoutConstraint.activate([
            subview.leadingAnchor.constraint(equalTo: leadingAnchor),
            trailingAnchor.constraint(equalTo: subview.trailingAnchor),
            
            subview.topAnchor.constraint(equalTo: topAnchor),
            bottomAnchor.constraint(equalTo: subview.bottomAnchor)
            ])
    }
    
    func isContainedWithin(_ other: UIView) -> Bool {
        var current: UIView? = self
        while let proposedView = current {
            if proposedView == other { return true }
            current = proposedView.superview
        }
        return false
    }

    func addTap(_ target: Any,
                action: Selector,
                requiredTaps: Int = 1,
                delegate: UIGestureRecognizerDelegate? = nil) {
        let tap = UITapGestureRecognizer(target: target, action: action)
        tap.numberOfTapsRequired = requiredTaps
        tap.delegate = delegate
        addGestureRecognizer(tap)
        isUserInteractionEnabled = true
    }
}
