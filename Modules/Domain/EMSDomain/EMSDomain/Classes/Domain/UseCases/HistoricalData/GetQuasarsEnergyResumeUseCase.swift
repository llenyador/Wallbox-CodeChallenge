//
//  GetQuasarsEnergyResumeUseCase.swift
//  EMSDomain
//
//  Created by Aitor Salvador on 16/2/22.
//

import SharedUtilities

// sourcery: AutoMockable
public protocol GetQuasarsEnergyResumeUseCaseProtocol {
    func execute() -> PublisherResult<QuasarsEnergyResume>
}

struct GetQuasarsEnergyResumeUseCase {
    private let dataRepository: HistoricalDataDataRepositoryProtocol
    
    init(dataRepository: HistoricalDataDataRepositoryProtocol) {
        self.dataRepository = dataRepository
    }
}

// MARK: - GetQuasarsEnergyResumeUseCaseProtocol
extension GetQuasarsEnergyResumeUseCase: GetQuasarsEnergyResumeUseCaseProtocol {
    func execute() -> PublisherResult<QuasarsEnergyResume> {
        dataRepository.getHistoricalData()
            .map {
                mapHistoricalDataToQuasarsEnergyResume($0)
            }.eraseToAnyPublisher()
    }
}

// MARK: - Private methods
private extension GetQuasarsEnergyResumeUseCase {
    func mapHistoricalDataToQuasarsEnergyResume(
        _ data: [HistoricalData]
    ) -> QuasarsEnergyResume {
        var timeInterval = DatesInterval()
        var suppliedPowerSum: CustomMeasurement<KiloWatt> = 0
        var consumedPowerSum: CustomMeasurement<KiloWatt> = 0
        for datum in data {
            switch datum.quasarsActivePowerStatus {
            case let .supplyingEnergy(power):
                suppliedPowerSum += power
            case let .consumingEnergy(power):
                consumedPowerSum += power
            }
            timeInterval.add(newDate: datum.timestamp)
        }

        // As we have discrete power measurements from the quasars,
        // we have to do a power average of each type (supplied and consumed)
        // since we understand the energy as the average of power during
        // the interval of time where all these samples were taken:
        // E = Pavg * (t_end - t_start)
        let suppliedAaveragePower: CustomMeasurement<KiloWatt> = {
            .init(suppliedPowerSum.value / data.count.doubleValue)
        }()
        let consumedAveragePower: CustomMeasurement<KiloWatt> = {
            .init(consumedPowerSum.value / data.count.doubleValue)
        }()
        let consumedEnergy = EnergyConversion.convertToKWh(
            consumedAveragePower,
            inPeriod: timeInterval.intervalInHours
        )
        let suppliedEnergy = EnergyConversion.convertToKWh(
            suppliedAaveragePower,
            inPeriod: timeInterval.intervalInHours
        )
        let totalEnergy = consumedEnergy + suppliedEnergy
        return .init(
            consumedEnergy: consumedEnergy,
            suppliedEnergy: suppliedEnergy,
            suppliedEnergyPercentage: suppliedEnergy.asPercentage(forTotal: totalEnergy),
            consumedEnergyPercentage: consumedEnergy.asPercentage(forTotal: totalEnergy)
        )
    }
}
