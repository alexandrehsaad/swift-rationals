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
		} else if value <= Double(Int.min) {
			self = .negativeInfinity
		} else if Double(Int.max) < value {
			self = .infinity
		} else {
			
			let lhs: IntegerLiteralType = .init(value.integral)
			let rhs: Int = .init(value.decimal)

			if rhs == .zero {
				let newNumerator: IntegerLiteralType = lhs
				self.init(integerLiteral: newNumerator)
			} else {
				let newDenominator: Int = 10 ** value.countPlaces
				let newNumerator: Int = .init(lhs * newDenominator + rhs)
				self.init(0, newNumerator, on: newDenominator)
			}
		}
	}
}
