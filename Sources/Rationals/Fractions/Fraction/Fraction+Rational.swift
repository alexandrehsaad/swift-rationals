// Fraction+Rational.swift
// Rationals
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

extension Fraction: Rational {
	public init(_ numerator: Term, on denominator: Term = 1) {
		self.numerator = numerator
		self.denominator = denominator
	}
	
	public var quotient: Double {
		return .init(self.numerator) / .init(self.denominator)
	}
}
