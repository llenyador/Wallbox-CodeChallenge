//
//  GaugeInfoViewViewModel.swift
//  CoreLayout
//
//  Created by Aitor Salvador on 12/2/22.
//

public struct GaugeInfoViewViewModel: Equatable {
    public enum Style {
        case white
        case primary
        case red
    }

    let infoText: String?
    let value: CGFloat
    let valueText: String
    let style: Style

    public init(
        infoText: String?,
        value: CGFloat,
        valueText: String,
        style: Style
    ) {
        self.infoText = infoText
        self.value = value
        self.valueText = valueText
        self.style = style
    }
}
