// Percentage+Equatable.swift
// Rationals
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

extension Percentage: Equatable {
    public static func == (_ lhs: Self, _ rhs: Self) -> Bool {
        guard lhs.isNaN == false && rhs.isNaN == false else {
            return false
        }
        
        return lhs.numerator == rhs.numerator
    }
}
