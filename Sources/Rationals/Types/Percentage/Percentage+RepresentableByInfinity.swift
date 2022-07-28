// Percentage+RepresentableByInfinity.swift
// Rationals
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

extension Percentage: RepresentableByInfinity {
	/// A boolean value indicating whether this instance is finite.
	///
	/// This property is `true` if the denominator is not zero.
	public var isFinite: Bool {
		return self.numerator.isFinite
	}
	
	/// A boolean value indicating whether this instance is infinite.
	///
	/// This property is `true` if the numerator is not zero and the denominator is zero.
	public var isInfinite: Bool {
		return self.numerator.isInfinite
	}
	
	/// The representation of positive infinity.
	public static let infinity: Self = .init(Double.infinity)
}
