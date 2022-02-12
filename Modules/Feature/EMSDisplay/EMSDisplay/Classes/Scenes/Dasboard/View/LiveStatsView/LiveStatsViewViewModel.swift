//
//  LiveStatsViewViewModel.swift
//  EMSDisplay
//
//  Created by Aitor Salvador on 12/2/22.
//

struct LiveStatsViewViewModel: Equatable {
    let titleText: String
    let state: State

    enum State: Equatable {
        case empty(message: String)
        case gauges(gaugeVMs: [GaugeInfoViewViewModel])

        var isEmpty: Bool {
            switch self {
            case .empty:
                return true
            case .gauges:
                return false
            }
        }
    }
}
