//
//  LiveDataDTO.swift
//  EMSDomain
//
//  Created by Aitor Salvador on 10/2/22.
//

struct LiveDataDTO: Decodable {
    let solarPower: CustomMeasurement<KiloWatt>
    let quasarsPower: CustomMeasurement<KiloWatt>
    let gridPower: CustomMeasurement<KiloWatt>
    let buildingDemand: CustomMeasurement<KiloWatt>
    let systemSoc: Percentage
    let totalEnergy: CustomMeasurement<KiloWattHour>
    let currentEnergy: CustomMeasurement<KiloWattHour>

    enum CodingKeys: String, CodingKey {
        case solarPower = "solar_power"
        case quasarsPower = "quasars_power"
        case gridPower = "grid_power"
        case buildingDemand = "building_demand"
        case systemSoc = "system_soc"
        case totalEnergy = "total_energy"
        case currentEnergy = "current_energy"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        solarPower = try container.decode(forKey: .solarPower)
        quasarsPower = try container.decode(forKey: .quasarsPower)
        gridPower = try container.decode(forKey: .gridPower)
        buildingDemand = try container.decode(forKey: .buildingDemand)
        systemSoc = try container.decode(Double.self, forKey: .systemSoc)
        totalEnergy = try container.decode(forKey: .totalEnergy)
        currentEnergy = try container.decode(forKey: .currentEnergy)
    }
}

extension LiveDataDTO {
    init(
        solarPower: CustomMeasurement<KiloWatt>,
        quasarsPower: CustomMeasurement<KiloWatt>,
        gridPower: CustomMeasurement<KiloWatt>,
        buildingDemand: CustomMeasurement<KiloWatt>,
        systemSoc: Percentage,
        totalEnergy: CustomMeasurement<KiloWattHour>,
        currentEnergy: CustomMeasurement<KiloWattHour>
    ) {
        self.solarPower = solarPower
        self.quasarsPower = quasarsPower
        self.gridPower = gridPower
        self.buildingDemand = buildingDemand
        self.systemSoc = systemSoc
        self.totalEnergy = totalEnergy
        self.currentEnergy = currentEnergy
    }
}
