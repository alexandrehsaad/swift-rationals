// Fraction+LosslessStringConvertible.swift
// Rationals
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

extension Fraction: LosslessStringConvertible {
    public init?(_ description: String) {
        if description == "-nan" || description == "nan" {
            self = .nan
        } else if description == "-inf" {
            self = .negativeInfinity
        } else if description == "inf" {
            self = .infinity
        } else if let value = Int(description) {
            self.init(integerLiteral: value)
        } else if let value = Double(description) {
            self.init(floatLiteral: value)
        } else {
            
            let substrings: Array<Substring> = description.split(separator: "/", maxSplits: 2, omittingEmptySubsequences: false)
            
            guard substrings.count == 2,
                  let newNumerator: Int = .init(substrings[0]),
                  let newDenominator: Int = .init(substrings[1]) else {
                return nil
            }
            
            self.init(newNumerator, on: newDenominator)
        }
    }
}