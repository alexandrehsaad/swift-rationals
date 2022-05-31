// Percentage+LosslessStringConvertible.swift
// Rationals
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

extension Percentage: LosslessStringConvertible {
    public init?(_ description: String) {
        if description == "-nan" || description == "nan" {
            self = .nan
        } else if description == "-inf" {
            self = .negativeInfinity
        } else if description == "inf" {
            self = .infinity
        } else if let value: Double = .init(description) {
            self.init(floatLiteral: value)
        } else if description.hasSuffix("%") {
            let substring: Substring = description.dropLast()
            
            if substring == "nan" || substring == "inf" {
                return nil
            } else if let value: Double = .init(substring) {
                self.init(value)
            } else {
                return nil
            }
        } else {
            return nil
        }
    }
}
