// Percentage+Subtractable.swift
// Rationals
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

extension Percentage: Subtractable {
	/// Returns the difference of subracting the second specified value from the first.
	///
	/// ```swift
	/// let twenty: Percentage = 20
	/// let ten: Percentage = 10
	/// print(twenty - ten)
	/// // Prints "10%"
	/// ```
	///
	/// - parameter lhs: The minuend.
	/// - parameter rhs: The subtrahend.
	/// - returns: The difference.
	public static func - (_ lhs: Self, _ rhs: Self) -> Self {
		return lhs + -rhs
	}
}
