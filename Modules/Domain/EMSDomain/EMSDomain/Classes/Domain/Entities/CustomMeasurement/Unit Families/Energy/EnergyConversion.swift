//
//  EnergyConversion.swift
//  EMSDomain
//
//  Created by Aitor Salvador on 12/2/22.
//

public enum EnergyConversion {
    public static func convertToKWh(
        _ kW: CustomMeasurement<KiloWatt>
    ) -> CustomMeasurement<KiloWattHour> {
        let hour: CustomMeasurement<Hour> = 1
        return kW * hour
    }

    public static func convertToKWh(
        _ kW: CustomMeasurement<KiloWatt>,
        inPeriod time: CustomMeasurement<Hour>
    ) -> CustomMeasurement<KiloWattHour> {
        kW * time
    }
}
