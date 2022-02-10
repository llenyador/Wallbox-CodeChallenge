//
//  Endpoint+LiveData.swift
//  EMSDomain
//
//  Created by Aitor Salvador on 10/2/22.
//

import SharedUtilities

extension Endpoint {
    enum LiveData: EndpointProtocol {
        case getLiveData

        var baseUrl: String {
            "" // We don't have an endpoint.
        }

        var path: String {
            "ems/live" // The path would be the path of the url for that endpoint.
        }

        var parameters: Encodable? {
            nil
        }

        var method: HTTPMethod {
            .get
        }

        var mockedDataFilePath: String {
            "live_data"
        }
    }
}
