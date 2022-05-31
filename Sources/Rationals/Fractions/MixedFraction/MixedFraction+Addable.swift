// MixedFraction+Addable.swift
// Rationals
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

extension MixedFraction: Addable {
	/// Returns the sum of adding the two specified value.
	///
	/// - parameter lhs: The augend.
	/// - parameter rhs: The addend.
	/// - returns: The sum.
	public static func + (_ lhs: Self, _ rhs: Self) -> Self {
		let newIntegral: Int = lhs.integral + rhs.integral
		let newNumerator: Int
		let newDenominator: Int
		
		if lhs.fractional.isLike(rhs.fractional) {
			newNumerator = lhs.numerator + rhs.numerator
			newDenominator = lhs.denominator
		} else {
			newNumerator = lhs.numerator * rhs.denominator + lhs.denominator * rhs.numerator
			newDenominator = lhs.denominator * rhs.denominator
		}
		
		return .init(newIntegral, newNumerator, on: newDenominator)
	}
}
