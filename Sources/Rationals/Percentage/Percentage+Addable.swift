// Percentage+Addable.swift
// Rationals
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

extension Percentage: Addable {
	/// Returns the sum of adding the two specified value.
	///
	/// ```swift
	/// let ten: Percentage = 10
	/// print(ten + ten)
	/// // Prints "20%"
	/// ```
	///
	/// - parameter lhs: The augend.
	/// - parameter rhs: The addend.
	/// - returns: The sum.
	public static func + (_ lhs: Self, _ rhs: Self) -> Self {
		let newNumerator: Double = lhs.numerator + rhs.numerator
		return .init(newNumerator)
	}
}
