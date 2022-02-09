//
//  UIColor + Palette.swift
//  CoreLayout
//
//  Created by Aitor Salvador on 17/05/2020.
//  Copyright © 2020 Aitor Salvador. All rights reserved.
//

import UIKit

public extension UIColor {
    static let primary: UIColor = .red
    static let primaryLight: UIColor = .red.withAlphaComponent(0.8)
    static let primaryDark: UIColor = .red.withAlphaComponent(0.6)

    static let secondary: UIColor = .bumbleWeed
    static let secondaryLight: UIColor = .bumbleWeedLight
    static let secondaryDark: UIColor = .bumbleWeedDark

    static let blackTextHighEmphasis: UIColor = .black
    static let blackTextMediumEmphasis: UIColor = .black.withAlphaComponent(0.8)
    static let blackTextLowEmphasis: UIColor = .black.withAlphaComponent(0.6)

    static let grayTextHighEmphasis: UIColor = .gray
    static let grayTextMediumEmphasis: UIColor = .grayTextHighEmphasis.withAlphaComponent(0.8)
    static let grayTextLowEmphasis: UIColor = .grayTextHighEmphasis.withAlphaComponent(0.6)

    static var whiteBackground: UIColor = .seaShellWhite
}

private extension UIColor {
    static var bumbleWeed: UIColor = .init(hexString: "EEB899")
    static var bumbleWeedLight: UIColor = .init(hexString: "ffeaca")
    static var bumbleWeedDark: UIColor = .init(hexString: "ba886b")
    static var seaShellWhite: UIColor = .init(hexString: "fff5ee")
}
