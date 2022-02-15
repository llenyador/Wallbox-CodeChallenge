//
//  QuasarPowerToQuasarsPowerStatusMapper.swift
//  EMSDomain
//
//  Created by Aitor Salvador on 14/2/22.
//

import SharedUtilities

enum QuasarPowerToQuasarsPoweStatusMapper: MapperProtocol {
    static func map(_ power: CustomMeasurement<KiloWatt>) throws -> QuasarPowerStatus {
        let absoluteQuasarPower = abs(power)
        if power >= 0 {
            return .consumingEnergy(absoluteQuasarPower)
        } else {
            return .supplyingEnergy(absoluteQuasarPower)
        }
    }
}
