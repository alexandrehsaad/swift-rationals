// Percentage+Multipliable.swift
// Rationals
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

extension Percentage: Multipliable {
	/// Returns the product of multiplying the two specified value.
	///
	/// ```swift
	/// let ten: Percentage = .init(10)
	/// print(ten * ten)
	/// // Prints "1%"
	/// ```
	///
	/// - parameter lhs: The multiplicand.
	/// - parameter rhs: The multiplicator.
	/// - returns: The product.
	public static func * (_ lhs: Self, _ rhs: Self) -> Self {
		let newNumerator: Double = lhs.quotient * rhs.quotient
		return .init(newNumerator)
	}
}
