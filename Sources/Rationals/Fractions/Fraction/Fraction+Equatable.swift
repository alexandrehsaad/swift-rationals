// Fraction+Equatable.swift
// Rationals
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

extension Fraction: Equatable {
    public static func == (lhs: Self, rhs: Self) -> Bool {
        guard lhs.isNaN == false && rhs.isNaN == false else {
            return false
        }
        
        if lhs.isInfinite && rhs.isInfinite {
            return true
        }
        
        return lhs.numerator == rhs.numerator
            && lhs.denominator == rhs.denominator
    }
}
