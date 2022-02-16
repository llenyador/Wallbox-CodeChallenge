//
//  VerticalLabelsStackViewModel.swift
//  CoreLayout
//
//  Created by Aitor Salvador on 12/2/22.
//

public struct VerticalLabelsStackViewModel: Equatable {
    public let topText: String
    public let bottomText: String

    public init(
        topText: String,
        bottomText: String
    ) {
        self.topText = topText
        self.bottomText = bottomText
    }
}
