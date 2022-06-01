// Fraction+RepresentableByZero.swift
// Rationals
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

extension Fraction: RepresentableByZero {
	/// A boolean value indicating whether this instance is equal to zero.
	public var isZero: Bool {
		return self.numerator == 0
			&& self.denominator != 0
	}
	
	/// The representation of zero.
	public static var zero: Self {
		return .init(0, on: 1)
	}
}
