// Fraction+Subtractable.swift
// Rationals
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

extension Fraction: Subtractable {
	/// Returns the difference of subracting the second specified value from the first.
	///
	/// ```swift
	/// let whole: Fraction = 1
	/// let half: Fraction = 0.5
	/// print(whole - half)
	/// // Prints "1/2"
	/// ```
	///
	/// - parameter lhs: The minuend.
	/// - parameter rhs: The subtrahend.
	/// - returns: The difference.
	public static func - (_ lhs: Self, _ rhs: Self) -> Self {
		return lhs + -rhs
	}
}
