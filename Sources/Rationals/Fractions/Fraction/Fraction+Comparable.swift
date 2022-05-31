// Fraction+Comparable.swift
// Rationals
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

extension Fraction: Comparable {
    /// Returns a boolean value indicating whether the value of the first argument is less than that of the second argument.
    ///
    /// Comparing two fractions with the same positive denominator yields the same result as comparing the numerators. If the equal denominators are negative, then the opposite result of comparing the numerators holds for the fractions.
    ///
    /// If two positive fractions have the same numerator, then the fraction with the smaller denominator is the larger number.
    ///
    /// - parameter lhs: A value to compare.
    /// - parameter rhs: Another value to compare.
    /// - returns: `true` if lhs is smaller, and `false` otherwise.
    public static func < (lhs: Self, rhs: Self) -> Bool {
        guard lhs.isNaN == false && rhs.isNaN == false else {
            return false
        }
        
        return lhs.quotient < rhs.quotient
    }
}
