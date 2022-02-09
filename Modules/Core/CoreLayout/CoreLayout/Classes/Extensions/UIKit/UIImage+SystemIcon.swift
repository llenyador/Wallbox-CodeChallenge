//
//  UIImage+SystemIcon.swift
//  CoreLayout
//
//  Created by Aitor Salvador on 29/12/21.
//

import SharedUtilities

public extension UIImage {
    
    /// Represents all the SF Symbols.
    ///
    /// - Note: All symbols can be downloaded from [here](https://developer.apple.com/design/downloads/SF-Symbols.dmg)
    enum SystemIcon: String, CaseIterable {
        case arrowLeft = "arrow.left"
        case gobackward10 = "gobackward.10"
        case goforward10 = "goforward.10"
        case listTriangle = "list.triangle"
        case handThumbsup = "hand.thumbsup"
        case person
        case speakerWave2 = "speaker.wave.2"
        case captionsBubble = "captions.bubble"
        case chartBar = "chart.bar"
        case pauseFill = "pause.fill"
        case playFill = "play.fill"
    }
}

public extension UIImage {
    convenience init?(
        systemIcon: SystemIcon
    ) {
        self.init(systemName: systemIcon.rawValue)
    }
    
    static func systemIconImage(
        _ systemIcon: SystemIcon,
        tintColor color: UIColor? = nil
    ) -> UIImage {
        guard let image = UIImage(systemIcon: systemIcon) else {
            safeFatalError("Inavlid system icon image with name: \"\(systemIcon.rawValue)\"")
            return UIImage()
        }
        
        var newImage: UIImage = image.withRenderingMode(.alwaysTemplate)
        if let tintColor = color {
            newImage = newImage.withTintColor(tintColor, renderingMode: .alwaysOriginal)
        }
        return newImage
    }
}
