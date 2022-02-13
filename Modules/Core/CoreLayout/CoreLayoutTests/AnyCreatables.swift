//
//  AnyCreatables.swift
//  CoreLayout
//
//  Created by Aitor Salvador on 13/2/22.
//

import SharedTestingUtilities
import CoreLayout

extension VerticalLabelsStackViewModel: AnyCreatable {
    public static var any: Self {
        .init(topText: .any,
              bottomText: .any)
    }
}

extension GaugeInfoViewViewModel.Style: CaseIterable {
    public static var allCases: [GaugeInfoViewViewModel.Style] {
        [
            .white,
            .primary,
            .red
        ]
    }
}

extension GaugeInfoViewViewModel: AnyCreatable {
    public static var any: Self {
        .init(
            infoText: .any,
            value: .any,
            valueText: .any,
            style: .any
        )
    }
}
