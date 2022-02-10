//
//  LiveDataDTOToLiveDataMapper.swift
//  EMSDomain
//
//  Created by Aitor Salvador on 10/2/22.
//

import SharedUtilities

enum LiveDataDTOToLiveDataMapper: MapperProtocol {
    static func map(_ input: LiveDataDTO) throws -> LiveData {
        .init(
            solarPower: input.solarPower,
            quasarsPower: input.quasarsPower,
            gridPower: input.gridPower,
            buildingDemand: input.buildingDemand,
            systemSoc: input.systemSoc,
            totalEnergy: input.totalEnergy,
            currentEnergy: input.currentEnergy
        )
    }
}
