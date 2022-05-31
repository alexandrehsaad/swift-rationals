// MixedFraction+Fractionable.swift
// Rationals
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

extension MixedFraction: Fractionable {
	public init<Value>(_ numerator: Value, on denominator: Value = 1)
	where Value: BinaryInteger {
		self.init(0, and: .init(numerator, on: denominator))
	}
	
	public var quotient: Double {
		return .init(self.integral) + self.fractional.quotient
	}
}
