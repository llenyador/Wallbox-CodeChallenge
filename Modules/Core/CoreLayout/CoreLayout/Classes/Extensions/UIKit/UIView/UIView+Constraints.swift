//
//  UIView+Constraints.swift
//  CoreLayout
//
//  Created by Aitor Salvador on 08/04/2019.
//  Copyright © 2019 Aitor Salvador. All rights reserved.
//

public typealias Constraints = [ConstraintType: NSLayoutConstraint]

public enum ConstraintType {
    case left
    case right
    case top
    case bottom
    case height
    case width
}

public extension UIView {
    func anchorsEqualToSuperview() {
        guard let superview = superview else {
            fatalError("View \(Self.self) has no superview")
        }
        anchorsEqual(toView: superview)
    }
    
    func anchorsEqual(toView view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func equalWidthToSuperView() {
        translatesAutoresizingMaskIntoConstraints = false
        if let superview = superview {
            widthAnchor.constraint(equalTo: superview.widthAnchor).isActive = true
        }
    }
    
    func equalHeightToSuperView() {
        translatesAutoresizingMaskIntoConstraints = false
        if let superview = superview {
            heightAnchor.constraint(equalTo: superview.heightAnchor).isActive = true
        }
    }
    
    @discardableResult
    func anchorCenterXToSuperview(constant: CGFloat = 0) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let anchor = superview!.centerXAnchor
        let constraint = centerXAnchor.constraint(equalTo: anchor, constant: constant)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func anchorCenterYToSuperview(constant: CGFloat = 0) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let anchor = superview!.centerYAnchor
        let constraint = centerYAnchor.constraint(equalTo: anchor, constant: constant)
        constraint.isActive = true
        return constraint
    }
    
    func anchorCenterSuperview() {
        anchorCenterXToSuperview()
        anchorCenterYToSuperview()
    }
    
    func equalHeightToWidth() {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalTo: widthAnchor, multiplier: 1.0).isActive = true
    }
    
    func equal(width: NSLayoutDimension? = nil, widthMultiplier: CGFloat? = 1.0, height: NSLayoutDimension? = nil, heightMultiplier: CGFloat? = 1.0) {
        translatesAutoresizingMaskIntoConstraints = false
        if let width = width {
            widthAnchor.constraint(equalTo: width, multiplier: widthMultiplier!).isActive = true
        }
        if let height = height {
            heightAnchor.constraint(equalTo: height, multiplier: heightMultiplier!).isActive = true
        }
    }
    
    @discardableResult
    func equalWidth(toView view: UIView) -> NSLayoutConstraint {
        return widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1)
    }
    
    @discardableResult
    func equalHeight(toView view: UIView) -> NSLayoutConstraint {
        return heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1)
    }
    
    func proportionWidthToSuperView(_ multiplier: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        if let anchor = superview?.widthAnchor {
            widthAnchor.constraint(equalTo: anchor, multiplier: multiplier).isActive = true
        }
    }
    
    func proportionHeightToSuperView(_ multiplier: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        if let anchor = superview?.heightAnchor {
            heightAnchor.constraint(equalTo: anchor, multiplier: multiplier).isActive = true
        }
    }
    
    func proportionWidthAndHeightToSuperView(widthMultiplier: CGFloat, heightMultiplier: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        proportionHeightToSuperView(heightMultiplier)
        proportionWidthToSuperView(widthMultiplier)
    }
    
    func anchorToAxis(top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, topConstant: CGFloat = 0, leftConstant: CGFloat = 0, bottomConstant: CGFloat = 0, rightConstant: CGFloat = 0) {
        _ = anchor(top: top, left: left, bottom: bottom, right: right, topConstant: topConstant, leftConstant: leftConstant, bottomConstant: bottomConstant, rightConstant: rightConstant)
    }
    
    func anchorXcenterTo(_ view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func anchorYcenterTo(_ view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    @discardableResult
    func anchorLessOrEqual(top: NSLayoutYAxisAnchor? = nil,
                           left: NSLayoutXAxisAnchor? = nil,
                           bottom: NSLayoutYAxisAnchor? = nil,
                           right: NSLayoutXAxisAnchor? = nil,
                           topConstant: CGFloat = 0,
                           leftConstant: CGFloat = 0,
                           bottomConstant: CGFloat = 0,
                           rightConstant: CGFloat = 0,
                           widthConstant: CGFloat = 0,
                           heightConstant: CGFloat = 0) -> Constraints {
        var anchors: Constraints = [:]
        
        if let top = top {
            let topConstraint = topAnchor.constraint(lessThanOrEqualTo: top, constant: topConstant)
            anchors.updateValue(topConstraint, forKey: .top)
        }
        
        if let left = left {
            let leftConstraint = leftAnchor.constraint(lessThanOrEqualTo: left, constant: leftConstant)
            anchors.updateValue(leftConstraint, forKey: .left)
        }
        
        if let bottom = bottom {
            let bottomConstraint = bottomAnchor.constraint(lessThanOrEqualTo: bottom, constant: -bottomConstant)
            anchors.updateValue(bottomConstraint, forKey: .bottom)
        }
        
        if let right = right {
            let rightConstraint = rightAnchor.constraint(lessThanOrEqualTo: right, constant: -rightConstant)
            anchors.updateValue(rightConstraint, forKey: .right)
        }
        
        if widthConstant > 0 {
            let widthConstraint = widthAnchor.constraint(lessThanOrEqualToConstant: widthConstant)
            anchors.updateValue(widthConstraint, forKey: .width)
        }
        
        if heightConstant > 0 {
            let heightConstraint = heightAnchor.constraint(lessThanOrEqualToConstant: heightConstant)
            anchors.updateValue(heightConstraint, forKey: .height)
        }
        
        anchors.forEach { $1.isActive = true }
        return anchors
    }
    
    @discardableResult
    func anchorGreaterOrEqual(top: NSLayoutYAxisAnchor? = nil,
                              left: NSLayoutXAxisAnchor? = nil,
                              bottom: NSLayoutYAxisAnchor? = nil,
                              right: NSLayoutXAxisAnchor? = nil,
                              topConstant: CGFloat = 0,
                              leftConstant: CGFloat = 0,
                              bottomConstant: CGFloat = 0,
                              rightConstant: CGFloat = 0,
                              widthConstant: CGFloat = 0,
                              heightConstant: CGFloat = 0) -> Constraints {
        var anchors: Constraints = [:]
        
        if let top = top {
            let topConstraint = topAnchor.constraint(greaterThanOrEqualTo: top, constant: topConstant)
            anchors.updateValue(topConstraint, forKey: .top)
        }
        
        if let left = left {
            let leftConstraint = leftAnchor.constraint(greaterThanOrEqualTo: left, constant: leftConstant)
            anchors.updateValue(leftConstraint, forKey: .left)
        }
        
        if let bottom = bottom {
            let bottomConstraint = bottomAnchor.constraint(greaterThanOrEqualTo: bottom, constant: -bottomConstant)
            anchors.updateValue(bottomConstraint, forKey: .bottom)
        }
        
        if let right = right {
            let rightConstraint = rightAnchor.constraint(greaterThanOrEqualTo: right, constant: -rightConstant)
            anchors.updateValue(rightConstraint, forKey: .right)
        }
        
        if widthConstant > 0 {
            let widthConstraint = widthAnchor.constraint(greaterThanOrEqualToConstant: widthConstant)
            anchors.updateValue(widthConstraint, forKey: .width)
        }
        
        if heightConstant > 0 {
            let heightConstraint = heightAnchor.constraint(greaterThanOrEqualToConstant: heightConstant)
            anchors.updateValue(heightConstraint, forKey: .height)
        }
        
        anchors.forEach { $1.isActive = true }
        return anchors
    }
    
    
    
    @discardableResult
    func anchor(top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, topConstant: CGFloat = 0, leftConstant: CGFloat = 0, bottomConstant: CGFloat = 0, rightConstant: CGFloat = 0, widthConstant: CGFloat = 0, heightConstant: CGFloat = 0) -> Constraints {
        translatesAutoresizingMaskIntoConstraints = false
        var anchors: Constraints = [:]
        
        if let top = top {
            let topConstraint = topAnchor.constraint(equalTo: top, constant: topConstant)
            anchors.updateValue(topConstraint, forKey: .top)
        }
        
        if let left = left {
            let leftConstraint = leftAnchor.constraint(equalTo: left, constant: leftConstant)
            anchors.updateValue(leftConstraint, forKey: .left)
        }
        
        if let bottom = bottom {
            let bottomConstraint = bottomAnchor.constraint(equalTo: bottom, constant: -bottomConstant)
            anchors.updateValue(bottomConstraint, forKey: .bottom)
        }
        
        if let right = right {
            let rightConstraint = rightAnchor.constraint(equalTo: right, constant: -rightConstant)
            anchors.updateValue(rightConstraint, forKey: .right)
        }
        
        if widthConstant > 0 {
            let widthConstraint = widthAnchor.constraint(equalToConstant: widthConstant)
            anchors.updateValue(widthConstraint, forKey: .width)
        }
        
        if heightConstant > 0 {
            let heightConstraint = heightAnchor.constraint(equalToConstant: heightConstant)
            anchors.updateValue(heightConstraint, forKey: .height)
        }
        
        anchors.forEach { $1.isActive = true }
        return anchors
    }
    
    @discardableResult
    func addHeightConstraint(height: CGFloat, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = heightAnchor.constraint(equalToConstant: height)
        constraint.priority = priority
        addConstraint(constraint)
        return constraint
    }

    @discardableResult
    func addAspectRatioConstraint(size: CGSize,
                                  priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let aspectRatioConstraint = NSLayoutConstraint(
            item: self,
            attribute: .width,
            relatedBy: .equal,
            toItem: self,
            attribute: .height,
            multiplier: size.proportions,
            constant: 0
        )
        aspectRatioConstraint.priority = priority
        addConstraint(aspectRatioConstraint)
        aspectRatioConstraint.isActive = true
        return aspectRatioConstraint
    }
}

public extension UIView {
    // MARK: - Constraints EqualTo
    @discardableResult
    func horizontalAnchors(left: NSLayoutXAxisAnchor? = nil,
                           leftConstant: CGFloat = 0,
                           right: NSLayoutXAxisAnchor? = nil,
                           rightConstant: CGFloat = 0,
                           widthConstant: CGFloat = 0) -> Constraints
    {
        translatesAutoresizingMaskIntoConstraints = false
        var anchors: Constraints = [:]
        
        if let left = left {
            let leftConstraint = leftAnchor.constraint(equalTo: left,
                                                       constant: leftConstant)
            anchors.updateValue(leftConstraint, forKey: .left)
        }
        if let right = right {
            let rightConstraint = rightAnchor.constraint(equalTo: right,
                                                         constant: rightConstant)
            anchors.updateValue(rightConstraint, forKey: .right)
        }
        if widthConstant > 0 {
            let widthConstraint = widthAnchor.constraint(equalToConstant: widthConstant)
            anchors.updateValue(widthConstraint, forKey: .width)
        }
        anchors.forEach { $1.isActive = true }
        return anchors
    }
    
    @discardableResult
    func verticalAnchors(top: NSLayoutYAxisAnchor? = nil,
                         topConstant: CGFloat = 0,
                         bottom: NSLayoutYAxisAnchor? = nil,
                         bottomConstant: CGFloat = 0,
                         heightConstant: CGFloat = 0) -> Constraints
    {
        translatesAutoresizingMaskIntoConstraints = false
        var anchors: Constraints = [:]
        
        if let top = top {
            let topConstraint = topAnchor.constraint(equalTo: top,
                                                     constant: topConstant)
            anchors.updateValue(topConstraint, forKey: .top)
        }
        if let bottom = bottom {
            let bottomConstraint = bottomAnchor.constraint(equalTo: bottom,
                                                           constant: bottomConstant)
            anchors.updateValue(bottomConstraint, forKey: .bottom)
        }
        if heightConstant > 0 {
            let heightConstraint = heightAnchor.constraint(equalToConstant: heightConstant)
            anchors.updateValue(heightConstraint, forKey: .height)
        }
        anchors.forEach { $1.isActive = true }
        return anchors
    }
    
    // MARK: - Constraints GreaterThanOrEqualTo
    @discardableResult
    func verticalAnchorsGreaterOrEqual(top: NSLayoutYAxisAnchor? = nil,
                                       topConstant: CGFloat = 0,
                                       bottom: NSLayoutYAxisAnchor? = nil,
                                       bottomConstant: CGFloat = 0,
                                       heightConstant: CGFloat = 0) -> Constraints {
        var anchors: Constraints = [:]
        
        if let top = top {
            let topConstraint = topAnchor.constraint(greaterThanOrEqualTo: top, constant: topConstant)
            anchors.updateValue(topConstraint, forKey: .top)
        }
        
        if let bottom = bottom {
            let bottomConstraint = bottomAnchor.constraint(greaterThanOrEqualTo: bottom,
                                                           constant: bottomConstant)
            anchors.updateValue(bottomConstraint, forKey: .bottom)
        }
        
        if heightConstant > 0 {
            let heightConstraint = heightAnchor.constraint(greaterThanOrEqualToConstant: heightConstant)
            anchors.updateValue(heightConstraint, forKey: .height)
        }
        
        anchors.forEach { $1.isActive = true }
        return anchors
    }
    
    @discardableResult
    func horizontalAnchorsGreaterOrEqual(left: NSLayoutXAxisAnchor? = nil,
                                         leftConstant: CGFloat = 0,
                                         right: NSLayoutXAxisAnchor? = nil,
                                         rightConstant: CGFloat = 0,
                                         widthConstant: CGFloat = 0) -> Constraints {
        var anchors: Constraints = [:]
        
        if let left = left {
            let leftConstraint = leftAnchor.constraint(greaterThanOrEqualTo: left,
                                                       constant: leftConstant)
            anchors.updateValue(leftConstraint, forKey: .left)
        }
        
        if let right = right {
            let rightConstraint = rightAnchor.constraint(greaterThanOrEqualTo: right,
                                                         constant: rightConstant)
            anchors.updateValue(rightConstraint, forKey: .right)
        }
        
        if widthConstant > 0 {
            let widthConstraint = widthAnchor.constraint(greaterThanOrEqualToConstant: widthConstant)
            anchors.updateValue(widthConstraint, forKey: .width)
        }
        
        anchors.forEach { $1.isActive = true }
        return anchors
    }
    
    // MARK: - Constraints LessThanOrEqualTo
    @discardableResult
    func verticalAnchorsLessThanOrEqual(top: NSLayoutYAxisAnchor? = nil,
                                       topConstant: CGFloat = 0,
                                       bottom: NSLayoutYAxisAnchor? = nil,
                                       bottomConstant: CGFloat = 0,
                                       heightConstant: CGFloat = 0) -> Constraints {
        var anchors: Constraints = [:]
        
        if let top = top {
            let topConstraint = topAnchor.constraint(lessThanOrEqualTo: top,
                                                     constant: topConstant)
            anchors.updateValue(topConstraint, forKey: .top)
        }
        
        if let bottom = bottom {
            let bottomConstraint = bottomAnchor.constraint(lessThanOrEqualTo: bottom,
                                                           constant: bottomConstant)
            anchors.updateValue(bottomConstraint, forKey: .bottom)
        }
        
        if heightConstant > 0 {
            let heightConstraint = heightAnchor.constraint(lessThanOrEqualToConstant: heightConstant)
            anchors.updateValue(heightConstraint, forKey: .height)
        }
        
        anchors.forEach { $1.isActive = true }
        return anchors
    }
    
    @discardableResult
    func horizontalAnchorsLessThanOrEqual(left: NSLayoutXAxisAnchor? = nil,
                                          leftConstant: CGFloat = 0,
                                          right: NSLayoutXAxisAnchor? = nil,
                                          rightConstant: CGFloat = 0,
                                          widthConstant: CGFloat = 0) -> Constraints {
        var anchors: Constraints = [:]
        
        if let left = left {
            let leftConstraint = leftAnchor.constraint(lessThanOrEqualTo: left,
                                                       constant: leftConstant)
            anchors.updateValue(leftConstraint, forKey: .left)
        }
        
        if let right = right {
            let rightConstraint = rightAnchor.constraint(lessThanOrEqualTo: right, constant: rightConstant)
            anchors.updateValue(rightConstraint, forKey: .right)
        }
        
        if widthConstant > 0 {
            let widthConstraint = widthAnchor.constraint(lessThanOrEqualToConstant: widthConstant)
            anchors.updateValue(widthConstraint, forKey: .width)
        }
        
        anchors.forEach { $1.isActive = true }
        return anchors
    }
}
