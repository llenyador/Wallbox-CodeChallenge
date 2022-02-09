//
//  NSObject + SharedUtilities.swift
//  SharedUtilities
//
//  Created by Aitor Salvador García on 20/12/2020.
//

func Init<Type>(_ value: Type,
                block: (_ object: Type) -> Void) -> Type {
   block(value)
   return value
}

public extension NSObject {
    static func Init<Type>(_ value: Type,
                           block: (_ object: Type) -> Void) -> Type {
       block(value)
       return value
    }
    
    static func Init<Type>(_ value: Type) -> Type {
       value
    }
    
    func Init<Type>(_ value: Type,
                    block: (_ object: Type) -> Void) -> Type {
        return NSObject.Init(value, block: block)
    }
}
