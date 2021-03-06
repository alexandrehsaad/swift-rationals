// MixedFraction+Multipliable.swift
// Rationals
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

extension MixedFraction: Multipliable {
	public static func * (_ lhs: Self, _ rhs: Self) -> Self {
		let lhs = lhs.unmixed()
		let rhs = rhs.unmixed()
		
		let numerator: Term = lhs.numerator * rhs.numerator
		let denominator: Term = lhs.denominator * rhs.denominator
		
		return .init(0, numerator, on: denominator)
	}
}
