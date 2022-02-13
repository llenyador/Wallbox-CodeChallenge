//
//  LiveDataDTOToLiveDataMapper.swift
//  EMSDomain
//
//  Created by Aitor Salvador on 10/2/22.
//

import SharedUtilities

enum LiveDataDTOToLiveDataMapper: MapperProtocol {
    static func map(_ input: LiveDataDTO) throws -> LiveData {
        let absoluteQuasarPower = abs(input.quasarsPower)
        var quasarStatus: QuasarPowerStatus
        if input.quasarsPower >= 0 {
            quasarStatus = .consumingEnergy(absoluteQuasarPower)
        } else {
            quasarStatus = .supplyingEnergy(absoluteQuasarPower)
        }

        return .init(
            solarPower: input.solarPower,
            quasarsPowerStatus: quasarStatus,
            gridPower: input.gridPower,
            buildingDemandPower: input.buildingDemand,
            systemSoc: input.systemSoc,
            totalEnergy: input.totalEnergy,
            currentEnergy: input.currentEnergy
        )
    }
}
