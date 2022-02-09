//
//  UIImageView + ViewModel.swift
//  CoreLayout
//
//  Created by Aitor Salvador on 18/11/2019.
//  Copyright © 2019 Aitor Salvador. All rights reserved.
//

import Nuke

public extension UIImageView {
    func setup(asyncViewModel: AsyncImageViewModel,
               completion: (() -> Void)? = nil) {
        let options = ImageLoadingOptions(
            placeholder: asyncViewModel.placeholderImage,
            transition: .fadeIn(duration: 0.1)
        )
        if let imageUrlString = asyncViewModel.imageUrlString {
            let url = URL(string: imageUrlString)
            Nuke.loadImage(with: url,
                           options: options,
                           into: self,
                           progress: nil) { (result) in
                completion?()
            }
        } else {
            image = asyncViewModel.placeholderImage
        }
    }

    func cancelImageRequestIfNeeded() {
        Nuke.cancelRequest(for: self)
    }
}

public struct AsyncImageViewModel: Equatable {
    public let imageUrlString: String?
    public let placeholderImage: UIImage?
    
    private init(imageUrlString: String?,
                 placeholderImage: UIImage?) {
        self.imageUrlString = imageUrlString
        self.placeholderImage = placeholderImage
    }

    public init(placeholderImage: UIImage) {
        self.init(imageUrlString: nil, placeholderImage: placeholderImage)
    }

    public init(imageUrlString: String) {
        self.init(imageUrlString: imageUrlString, placeholderImage: nil)
    }

    public init(imageUrlString: String,
                placeholderImage: UIImage) {
        self.init(imageUrlString: Optional(imageUrlString),
                  placeholderImage: placeholderImage)
    }
}
