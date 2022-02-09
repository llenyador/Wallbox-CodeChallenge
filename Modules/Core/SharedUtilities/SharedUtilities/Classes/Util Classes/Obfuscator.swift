//
//  Obfuscator.swift
//  SharedUtilities
//
//  Created by Aitor Salvador García on 01/08/2020.
//  Copyright © 2020 Aitor Salvador. All rights reserved.
//

public protocol ObfuscatorProtocol {
    func bytesByObfuscating(_ string: String) -> [UInt8]
    func reveal(_ key: [UInt8]) -> String?
}

public struct Obfuscator {
    // MARK: - Variables

    /// The salt used to obfuscate and reveal the string.
    private var salt: String

    // MARK: - Initialization

    public init() {
        let string = String(describing: String.self)
        let int = String(describing: Int.self)
        let double = String(describing: Double.self)
        self.salt = "eScript\(string)\(int)\(double)"
    }

    public init(with salt: String) {
        self.salt = salt
    }
}

// MARK: - ObfuscatorProtocol
extension Obfuscator: ObfuscatorProtocol {
    /**
     This method obfuscates the string passed in using the salt
     that was used when the Obfuscator was initialized.
     
     - parameter string: the string to obfuscate
     
     - returns: the obfuscated string in a byte array
     */
    public func bytesByObfuscating(_ string: String) -> [UInt8] {
        let text = [UInt8](string.utf8)
        let cipher = [UInt8](self.salt.utf8)
        let length = cipher.count

        var encrypted = [UInt8]()

        for (index, element) in text.enumerated() {
            encrypted.append(element ^ cipher[index % length])
        }

        return encrypted
    }

    /**
     This method reveals the original string from the obfuscated
     byte array passed in. The salt must be the same as the one
     used to encrypt it in the first place.
     
     - parameter key: the byte array to reveal
     
     - returns: the original string
     */
    public func reveal(_ key: [UInt8]) -> String? {
        let cipher = [UInt8](self.salt.utf8)
        let length = cipher.count

        var decrypted = [UInt8]()

        for (index, element) in key.enumerated() {
            decrypted.append(element ^ cipher[index % length])
        }

        return String(bytes: decrypted, encoding: .utf8)
    }
}
