//
//  JSONFileReader.swift
//  SharedUtilities
//
//  Created by Aitor Salvador García on 09/02/2021.
//

public enum JSONFileReader {
    public static func data(
        fromFilename filename: String,
        bundle: Bundle
    ) throws -> Data {
        guard let path = bundle.path(forResource: filename, ofType: "json"),
              let data = try String(contentsOfFile: path).data(using: .utf8) else {
            throw CustomError.mapping
        }
        return data
    }

    public static func object<D: Decodable>(
        ofType type: D.Type,
        fromFileName filename: String,
        bundle: Bundle = .main
    ) throws -> D {
        let jsonData = try data(fromFilename: filename, bundle: bundle)
        return try JSONDecoder().decode(D.self, from: jsonData)
    }
}
