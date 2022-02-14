//
//  LiveDataDTOToLiveDataMapper.swift
//  EMSDomain
//
//  Created by Aitor Salvador on 10/2/22.
//

import SharedUtilities

enum LiveDataDTOToLiveDataMapper: MapperProtocol {
    static func map(_ input: LiveDataDTO) throws -> LiveData {
        let quasarsPowerStatus = try QuasarPowerToQuasarsPoweStatusMapper.map(input.quasarsPower)
        return .init(
            solarPower: input.solarPower,
            quasarsPowerStatus: quasarsPowerStatus,
            gridPower: input.gridPower,
            buildingDemandPower: input.buildingDemand,
            systemSoc: input.systemSoc,
            totalEnergy: input.totalEnergy,
            currentEnergy: input.currentEnergy
        )
    }
}
