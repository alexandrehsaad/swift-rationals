// Fraction+Fractionable.swift
// Rationals
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

extension Fraction: Fractionable {
	public init<Value>(_ numerator: Value, on denominator: Value = 1)
	where Value: BinaryInteger {
		self.numerator = .init(numerator)
		self.denominator = .init(denominator)
	}
	
	public var quotient: Double {
		return .init(self.numerator) / .init(self.denominator)
	}
}
