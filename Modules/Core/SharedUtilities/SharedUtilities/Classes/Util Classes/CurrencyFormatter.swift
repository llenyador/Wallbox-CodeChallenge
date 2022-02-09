//
//  CurrencyFormatter.swift
//  SharedUtilities
//
//  Created by Aitor Salvador García on 25/10/2020.
//

import Foundation

public enum CurrencyFormatter {
    private static let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }()
    
    private static let localeNumberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }()

    public static func formatPrice(from price: Double, currencyCode: String) throws -> String {
        let nsNumber = NSNumber(value: price)
        numberFormatter.currencyCode = currencyCode
        guard let priceFormatted = numberFormatter.string(from: nsNumber) else {
            throw CustomError.mapping
        }

        return priceFormatted
    }
    
    public static func formatPrice(from price: Double, locale: Locale = .current) throws -> String {
        let nsNumber = NSNumber(value: price)
        localeNumberFormatter.locale = locale
        guard let priceFormatted = localeNumberFormatter.string(from: nsNumber) else {
            throw CustomError.mapping
        }

        return priceFormatted
    }
}
