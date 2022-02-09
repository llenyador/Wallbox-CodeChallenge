//
//  CoreLayoutFactory.swift
//  CoreLayout
//
//  Created by Aitor Salvador on 12/1/22.
//

public enum CoreLayoutFactory {
    public static func build() -> ShowGlobalMessageProtocol {
        ShowGlobalMessage()
    }
}
