// Fraction+Multipliable.swift
// Rationals
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

extension Fraction: Multipliable {
	/// Returns the product of multiplying the two specified value.
	///
	/// ```swift
	/// let half: Fraction = .init(1, on: 2)
	/// print(half * 2)
	/// // Prints "2/2"
	/// ```
	///
	/// - parameter lhs: The multiplicand.
	/// - parameter rhs: The multiplicator.
	/// - returns: The product.
	public static func * (_ lhs: Self, _ rhs: Self) -> Self {
		let newNumerator: Term = lhs.numerator * rhs.numerator
		let newDenominator: Term = lhs.denominator * rhs.denominator
		
		return .init(newNumerator, on: newDenominator)
	}
}
