//
//  Optional + Additions.swift
//  Template
//
//  Created by Aitor Salvador on 05/10/2019.
//  Copyright © 2019 Aitor Salvador. All rights reserved.
//

import Foundation

public extension Optional {
    var isNil: Bool {
        self == nil
    }

    var isSome: Bool {
        self != nil
    }
}

public extension Optional where Wrapped == Any {
    var toString: String {
        guard let value = self else {
            return ""
        }
        return String(describing: value)
    }
}

public extension Optional where Wrapped == Bool {
    var orFalse: Bool {
        if let value = self {
            return value
        } else {
            return false
        }
    }
}

public extension Optional where Wrapped == Bool {
    var orTrue: Bool {
        if let value = self {
            return value
        } else {
            return true
        }
    }
}

public extension Optional where Wrapped == Int {
    var toString: String {
        guard let value = self else {
            return ""
        }
        return String(value)
    }
}

public extension Optional where Wrapped == String {
    var orEmpty: String {
        if let value = self {
            return value
        } else {
            return ""
        }
    }

    var hasElements: Bool {
        !isEmpty
    }
}

public extension Optional where Wrapped == Int {
    var orZero: Int {
        if let value = self {
            return value
        } else {
            return 0
        }
    }
}

public extension Optional where Wrapped == Double {
    var orZero: Double {
        if let value = self {
            return value
        } else {
            return 0
        }
    }
}

public extension Optional where Wrapped == Float {
    var orZero: Float {
        if let value = self {
            return value
        } else {
            return 0
        }
    }
}

public extension Optional where Wrapped == UIEdgeInsets {
    var orZero: UIEdgeInsets {
        if let value = self {
            return value
        } else {
            return .zero
        }
    }
}

public protocol OptionalCollection {
    static var emptyValue: Self { get }
}

extension Array: OptionalCollection {
    public static var emptyValue: [Element] {
        []
    }
}

extension Set: OptionalCollection {
    public static var emptyValue: Set<Element> {
        []
    }
}

extension Dictionary: OptionalCollection {
    public static var emptyValue: [Key: Value] {
        [:]
    }
}

public extension Optional where Wrapped: Collection, Wrapped: OptionalCollection {
    var isEmpty: Bool {
        guard let value = self else {
            return true
        }
        return value.isEmpty
    }

    var hasElements: Bool {
        !isEmpty
    }

    var orEmpty: Wrapped {
        guard let value = self else {
            return Wrapped.emptyValue
        }
        return value
    }

    var count: Int {
        guard let value = self else {
            return 0
        }
        return value.count
    }
}

public extension Optional where Wrapped: BinaryFloatingPoint {
    var orZero: Wrapped {
        if let value = self {
            return value
        } else {
            return .zero
        }
    }
}

public extension Optional where Wrapped: BinaryInteger {
    var orZero: Wrapped {
        if let value = self {
            return value
        } else {
            return .zero
        }
    }
}

public extension Optional where Wrapped == CGSize {
    var orZero: CGSize {
        if let value = self {
            return value
        } else {
            return .zero
        }
    }
}

public extension Optional where Wrapped == String {
    var isEmpty: Bool {
        guard let value = self else {
            return true
        }
        return value.isEmpty
    }

    var notEmptyValue: Wrapped? {
        guard let value = self,
              !value.isEmpty else {
            return nil
        }
        return value
    }
}
