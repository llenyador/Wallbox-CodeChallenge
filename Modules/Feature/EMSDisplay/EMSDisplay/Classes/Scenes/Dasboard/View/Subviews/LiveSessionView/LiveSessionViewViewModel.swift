//
//  LiveSessionViewViewModel.swift
//  EMSDisplay
//
//  Created by Aitor Salvador on 12/2/22.
//

import CoreLayout

struct LiveSessionViewViewModel: Equatable {
    let titleText: String
    let sourcePower1VM: VerticalLabelsStackViewModel?
    let sourcePower2VM: VerticalLabelsStackViewModel?
    let sourcePower3VM: VerticalLabelsStackViewModel?
    let totalPowerVM: VerticalLabelsStackViewModel
}
