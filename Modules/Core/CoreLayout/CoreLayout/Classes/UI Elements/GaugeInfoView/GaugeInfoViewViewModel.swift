//
//  GaugeInfoViewViewModel.swift
//  CoreLayout
//
//  Created by Aitor Salvador on 12/2/22.
//

public struct GaugeInfoViewViewModel: Equatable {
    let infoText: String?
    let value: CGFloat
    let valueText: String

    public init(
        infoText: String?,
        value: CGFloat,
        valueText: String
    ) {
        self.infoText = infoText
        self.value = value
        self.valueText = valueText
    }
}
