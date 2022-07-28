// Percentage+RepresentableByNaN.swift
// Rationals
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

extension Percentage: RepresentableByNaN {
	/// A boolean value indicating whether this instance is not a number.
	///
	/// This property is `true` if both the numerator and the denominator are zero.
	public var isNaN: Bool {
		return self.numerator.isNaN
	}
	
	/// The representation of not a number.
	public static let nan: Self = .init(Double.nan)
}
