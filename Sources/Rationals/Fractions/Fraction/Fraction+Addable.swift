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
		let numerator: Term
		let denominator: Term
		
		if lhs.isLike(rhs) {
			numerator = lhs.numerator + rhs.numerator
			denominator = lhs.denominator
		} else {
			numerator = lhs.numerator * rhs.denominator + lhs.denominator * rhs.numerator
			denominator = lhs.denominator * rhs.denominator
		}
		
		return .init(numerator, on: denominator)
	}
}
