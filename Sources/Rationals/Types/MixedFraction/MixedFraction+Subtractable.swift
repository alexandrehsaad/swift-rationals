// MixedFraction+Subtractable.swift
// Rationals
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

extension MixedFraction: Subtractable
where Term: Subtractable {
	public static func - (_ lhs: Self, _ rhs: Self) -> Self {
		let integral: Term = lhs.integral - rhs.integral
		let numerator: Term
		let denominator: Term
		
		if lhs.fractional.isLike(rhs.fractional) {
			numerator = lhs.numerator - rhs.numerator
			denominator = lhs.denominator
		} else {
			numerator = lhs.numerator * rhs.denominator - lhs.denominator * rhs.numerator
			denominator = lhs.denominator * rhs.denominator
		}
		
		return .init(integral, numerator, on: denominator)
	}
}
