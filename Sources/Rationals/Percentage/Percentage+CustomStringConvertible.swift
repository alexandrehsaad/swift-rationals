// Percentage+CustomStringConvertible.swift
// Rationals
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

extension Percentage: CustomStringConvertible {
    /// A textual representation of this instance.
    ///
    /// ```swift
    /// let percentage: Percentage = .init(1)
    /// print(percentage)
    /// // Prints "1%"
    /// ```
    public var description: String {
        guard self.isNaN == false else {
            return "nan"
        }
        
        guard self.isInfinite == false else {
            let sign: String = self.isNegative ? "-" : ""
            return sign + "inf"
        }
        
        let numerator: String = self.numerator.description
        let `operator`: String = "%"
        
        return numerator + `operator`
    }
}
