// Fraction+Addable.swift
// Rationals
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

extension Fraction: Addable {
	/// Returns the sum of adding the two specified value.
	///
	/// ```swift
	/// let half: Fraction = .init(1, on: 2)
	/// print(half + half)
	/// // Prints "2/2"
	/// ```
	///
	/// - parameter lhs: The augend.
	/// - parameter rhs: The addend.
	/// - returns: The sum.
	public static func + (_ lhs: Self, _ rhs: Self) -> Self {
		let newNumerator: Term
		let newDenominator: Term
		
		if lhs.isLike(rhs) {
			newNumerator = lhs.numerator + rhs.numerator
			newDenominator = lhs.denominator
		} else {
			newNumerator = lhs.numerator * rhs.denominator + lhs.denominator * rhs.numerator
			newDenominator = lhs.denominator * rhs.denominator
		}
		
		return .init(newNumerator, on: newDenominator)
	}
}
