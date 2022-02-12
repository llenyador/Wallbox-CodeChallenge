//
//  UIView + Shadow.swift
//  
//
//  Created by Aitor Salvador García on 8/7/21.
//

public enum ShadowStyle {
    case bottom
    case allSides
    case top

    struct ShadowModel {
        let shadowColor: UIColor
        let shadowOffset: CGSize
        let shadowRadius: CGFloat
        let shadowOpacity: Float
    }

    var model: ShadowModel {
        switch self {
        case .bottom:
            return .init(shadowColor: .black,
                         shadowOffset: .init(width: 0, height: 1),
                         shadowRadius: 2,
                         shadowOpacity: 0.18)
        case .allSides:
            return .init(shadowColor: .black,
                         shadowOffset: .init(width: 0, height: 0),
                         shadowRadius: 6,
                         shadowOpacity: 0.18)
        case .top:
            return .init(shadowColor: .black,
                         shadowOffset: .init(width: 0, height: -1),
                         shadowRadius: 2,
                         shadowOpacity: 0.18)
        }
    }
}

public extension UIView {
    func display(shadowStyle: ShadowStyle) {
        layer.masksToBounds = false

        let model = shadowStyle.model
        layer.shadowColor = model.shadowColor.cgColor
        layer.shadowOffset = model.shadowOffset
        layer.shadowRadius = model.shadowRadius
        layer.shadowOpacity = model.shadowOpacity
    }
}
