//
//  HTTPMethod.swift
//  SharedUtilities
//
//  Created by Aitor Salvador García on 16/3/21.
//

public enum HTTPMethod {
    case get
    case post
    case put
    case delete
}

public enum ContentType: String {
    case applicationJson = "application/json"
}
