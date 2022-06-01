// MixedFraction+Rational.swift
// Rationals
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

extension MixedFraction: Rational {
	public init(_ numerator: Term, on denominator: Term = 1) {
		self.init(0, and: .init(numerator, on: denominator))
	}
	
	public var quotient: Double {
		return .init(self.integral) + self.fractional.quotient
	}
}
