// MixedFraction+Comparable.swift
// Rationals
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

extension MixedFraction: Comparable {
	/// Returns a boolean value indicating whether the value of the first argument is less than that of the second argument.
	///
	/// - parameter lhs: A value to compare.
	/// - parameter rhs: Another value to compare.
	/// - returns: `true` if lhs is smaller, and `false` otherwise.
	public static func < (lhs: Self, rhs: Self) -> Bool {
		guard lhs.isNaN == false && rhs.isNaN == false else {
			return false
		}
		
		return lhs.quotient < rhs.quotient
	}
}
