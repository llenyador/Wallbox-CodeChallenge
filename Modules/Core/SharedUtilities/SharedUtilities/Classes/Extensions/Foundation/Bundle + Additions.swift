//
//  Bundle + Additions.swift
//  SharedUtilities
//
//  Created by Aitor Salvador García on 01/08/2020.
//  Copyright © 2020 Aitor Salvador. All rights reserved.
//

import Foundation

public extension Bundle {
    convenience init?(class: AnyClass, bundleName: String) {
        let frameworkBundle = Bundle(for: `class`)
        guard let bundleURL = frameworkBundle.resourceURL?.appendingPathComponent("\(bundleName).bundle") else {
            return nil
        }
        self.init(url: bundleURL)
    }

    var shortVersion: String? {
        infoDictionary?["CFBundleShortVersionString"] as? String
    }
    
    var appName: String? {
        infoDictionary?["CFBundleName"] as? String
    }
    
    var buildVersion: String? {
        infoDictionary?["CFBundleVersion"] as? String
    }
    
    var identifier: String {
        guard let identifier = self.bundleIdentifier else {
            safeFatalError("Bundle identifier not found")
            return ""
        }
        return identifier
    }
}
