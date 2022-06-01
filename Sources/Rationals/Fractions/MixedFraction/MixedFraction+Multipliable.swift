// MixedFraction+Multipliable.swift
// Rationals
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

extension MixedFraction: Multipliable {
	/// Returns the product of multiplying the two specified value.
	///
	/// - parameter lhs: The multiplicand.
	/// - parameter rhs: The multiplicator.
	/// - returns: The product.
	public static func * (_ lhs: Self, _ rhs: Self) -> Self {
		let lhs = lhs.unmixed()
		let rhs = rhs.unmixed()
		
		let newNumerator: Term = lhs.numerator * rhs.numerator
		let newDenominator: Term = lhs.denominator * rhs.denominator
		
		return .init(0, newNumerator, on: newDenominator)
	}
}
