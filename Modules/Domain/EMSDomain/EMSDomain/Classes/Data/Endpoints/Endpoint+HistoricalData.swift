//
//  Endpoint+HistoricalData.swift
//  EMSDomain
//
//  Created by Aitor Salvador on 10/2/22.
//

import SharedUtilities

extension Endpoint {
    enum HistoricalData: EndpointProtocol {
        case getHistoricalData

        var baseUrl: String {
            "" // We don't have an endpoint.
        }

        var path: String {
            "ems/historical" // The path would be the path of the url for that endpoint.
        }

        var parameters: Encodable? {
            nil
        }

        var method: HTTPMethod {
            .get
        }

        var mockedDataFilePath: String {
            "historical_data"
        }
    }
}
