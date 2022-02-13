//
//  LiveStatsViewViewModel.swift
//  EMSDisplay
//
//  Created by Aitor Salvador on 12/2/22.
//

import CoreLayout

struct LiveStatsViewViewModel: Equatable {
    let titleText: String
    let state: State

    enum State: Equatable {
        case empty(message: String)
        case displayGauges(gaugeVMs: [GaugeInfoViewViewModel])

        var isEmpty: Bool {
            switch self {
            case .empty:
                return true
            case .displayGauges:
                return false
            }
        }
    }
}
