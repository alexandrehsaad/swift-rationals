// Fraction+CustomStringConvertible.swift
// Rationals
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

extension Fraction: CustomStringConvertible {
    /// A textual representation of this instance.
    ///
    /// ```swift
    /// let fraction: Fraction = .init(1, on: 2)
    /// print(fraction)
    /// // Prints "1/2"
    /// ```
    public var description: String {
        guard self.isNaN == false else {
            return "nan"
        }
        
        guard self.isInfinite == false else {
            let sign: String = self.isNegative ? "-" : ""
            return sign + "inf"
        }
        
        guard self.isZero == false else {
            return "0"
        }
        
        let numerator: String = self.numerator.description
        let `operator`: String = "/"
        let denominator: String = self.denominator.description
        
		return numerator + `operator` + denominator
    }
}
