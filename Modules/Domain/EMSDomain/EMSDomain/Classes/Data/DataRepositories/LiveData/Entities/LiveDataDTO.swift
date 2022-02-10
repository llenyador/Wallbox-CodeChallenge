//
//  LiveDataDTO.swift
//  EMSDomain
//
//  Created by Aitor Salvador on 10/2/22.
//

struct LiveDataDTO: Decodable {
    let solarPower: Measurement<KiloWatt>
    let quasarsPower: Measurement<KiloWatt>
    let gridPower: Measurement<KiloWatt>
    let buildingDemand: Measurement<KiloWatt>
    let systemSoc: Percentage
    let totalEnergy: Measurement<KiloWattHour>
    let currentEnergy: Measurement<KiloWattHour>

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
