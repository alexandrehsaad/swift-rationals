// Fraction+Equivalentable.swift
// Rationals
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

extension Fraction: Equivalentable {
	/// Returns a boolean value indicating whether the two specified instances are equivalent.
	///
	/// Two equivalent fractions have the same quotient, but not necessarily the same fraction.
	///
	/// ```swift
	/// print(Fraction.twoHalves.isEquivalent(to: .whole))
	/// // Prints "true"
	/// ```
	///
	/// - parameter rhs: An instance to compare.
	/// - returns: `true` if is equivalent, and `false` otherwise.
	public func isEquivalent(to rhs: Self) -> Bool {
		return self.quotient == rhs.quotient
	}
}
