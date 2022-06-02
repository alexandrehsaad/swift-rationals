// Percentage+Divisible.swift
// Rationals
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

extension Percentage: Divisible {
	/// Returns the quotient of dividing the first specified value by the second.
	///
	/// ```swift
	/// let whole: Percentage = 100
	/// print(whole / 2)
	/// // Prints "50%"
	/// ```
	///
	/// - parameter lhs: The dividend.
	/// - parameter rhs: The divisor.
	/// - returns: The quotient.
	public static func / (_ lhs: Self, _ rhs: Self) -> Self {
		let newNumerator: Double = lhs.quotient / rhs.quotient
		return .init(newNumerator)
	}
	
	/// Returns the remainder of dividing the first specified value by the second.
	///
	/// - parameter lhs: The dividend.
	/// - parameter rhs: The divisor.
	/// - returns: The remainder.
	public static func % (_ lhs: Self, _ rhs: Self) -> Self {
		let newValue: Double = lhs.quotient % rhs.quotient
		return .init(floatLiteral: newValue)
	}
}
