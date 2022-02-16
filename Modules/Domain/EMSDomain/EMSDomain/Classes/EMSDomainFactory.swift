//
//  EMSDomainFactory.swift
//  EMSDomain
//
//  Created by Aitor Salvador on 10/2/22.
//

public enum EMSDomainFactory {
    public static func build() -> GetLiveDataUseCaseProtocol {
        GetLiveDataUseCase(
            dataRepository: DataFactory.LiveData.build()
        )
    }

    public static func build() -> GetHistoricalDataUseCaseProtocol {
        GetHistoricalDataUseCase(
            dataRepository: DataFactory.HistoricalData.build()
        )
    }

    public static func build() -> GetQuasarsEnergyResumeUseCaseProtocol {
        GetQuasarsEnergyResumeUseCase(
            dataRepository: DataFactory.HistoricalData.build()
        )
    }
}
