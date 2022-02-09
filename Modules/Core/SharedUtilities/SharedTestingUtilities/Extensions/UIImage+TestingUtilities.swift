//
//  UIImage+TestingUtilities.swift
//  Books-Unit-BooksTests
//
//  Created by Aitor Salvador on 3/1/22.
//

import UIKit

public extension UIImage {
    func isPNGRepresentationEqualTo(_ image: UIImage) -> Bool {
        pngData() == image.pngData()
    }
}
