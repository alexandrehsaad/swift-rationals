// MixedFraction+ExpressibleByFloatLiteral.swift
// Rationals
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

extension MixedFraction: ExpressibleByFloatLiteral {
	public init(floatLiteral value: FloatLiteralType) {
		if value.isNaN {
			self = .nan
		} else if value <= Double(Term.min) {
			self = .negativeInfinity
		} else if Double(Term.max) < value {
			self = .infinity
		} else {
			
			let lhs: Term = .init(value.integral)
			let rhs: Term = .init(value.decimal)

			if rhs == .zero {
				self.init(0, lhs, on: 1)
			} else {
				let newDenominator: Term = 10 ** value.countPlaces
				let newNumerator: Term = .init(lhs * newDenominator + rhs)
				self.init(0, newNumerator, on: newDenominator)
			}
		}
	}
}
