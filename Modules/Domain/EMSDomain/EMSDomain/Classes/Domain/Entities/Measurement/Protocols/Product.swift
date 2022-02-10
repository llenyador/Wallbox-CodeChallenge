//
//  Product.swift
//  EMSDomain
//
//  Created by Aitor Salvador on 10/2/22.
//

public protocol Product: UnitProtocol {
    associatedtype Factor1: UnitProtocol
    associatedtype Factor2: UnitProtocol
}

func *<Unit1, Unit2, Result>(
    lhs: Measurement<Unit1>,
    rhs: Measurement<Unit2>
) -> Measurement<Result>
where Result: Product,
Result.Factor1.Family == Unit1.Family,
Result.Factor2.Family == Unit2.Family
{
    let left = lhs.converted(to: Result.Factor1.self)
    let right = rhs.converted(to: Result.Factor2.self)
    return .init(left.value * right.value)
}

func *<Unit1, Unit2, Result>(
    lhs: Measurement<Unit2>,
    rhs: Measurement<Unit1>
) -> Measurement<Result>
where Result: Product,
Result.Factor1.Family == Unit1.Family,
Result.Factor2.Family == Unit2.Family
{
    rhs * lhs
}
