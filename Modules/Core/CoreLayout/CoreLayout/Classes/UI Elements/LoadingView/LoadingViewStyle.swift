//
//  LoadingViewStyle.swift
//  
//
//  Created by Aitor Salvador García on 9/7/21.
//

import NVActivityIndicatorView

public enum LoadingViewStyle {
    case ballPulseSyncPrimary
    case ballPulseSyncSecondary
}

extension LoadingViewStyle {
    var nvType: NVActivityIndicatorType {
        switch self {
        case .ballPulseSyncPrimary,
             .ballPulseSyncSecondary:
            return .ballPulseSync
        }
    }

    var color: UIColor {
        switch self {
        case .ballPulseSyncPrimary:
            return .primary
        case .ballPulseSyncSecondary:
            return .secondary
        }
    }
}
