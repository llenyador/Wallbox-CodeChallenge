//
//  URLRequestConverter.swift
//  SharedUtilities
//
//  Created by Aitor Salvador García on 16/3/21.
//

enum URLRequestConverter {
    static func convertToUrlRequest(
        endpoint: EndpointProtocol
    ) throws -> URLRequest {
        guard var url = URL(string: endpoint.baseUrl) else {
            safeFatalError("Invalid url string: \(endpoint.baseUrl)")
            throw CustomError.generic
        }
        url.appendPathComponent(endpoint.path)

        var request = URLRequest(url: url)
        request.httpMethod = rawHTTPMethod(from: endpoint)
        request.httpBody = try bodyData(from: endpoint)
        request.allHTTPHeaderFields = ["Content-Type": endpoint.contentType.rawValue]
        return request
    }
}

// MARK: - Private
private extension URLRequestConverter {
    static func rawHTTPMethod(from endpoint: EndpointProtocol) -> String {
        switch endpoint.method {
        case .get:
            return "GET"
        case .post:
            return "POST"
        case .put:
            return "PUT"
        case .delete:
            return "DELETE"
        }
    }
    
    static func bodyData(from endpoint: EndpointProtocol) throws -> Data? {
        guard let encodableParams = endpoint.parameters else {
            return nil
        }
        do {
            return try encodableParams.toJSONData()
        } catch  {
            throw CustomError.parsingHttpBody
        }
    }
}
