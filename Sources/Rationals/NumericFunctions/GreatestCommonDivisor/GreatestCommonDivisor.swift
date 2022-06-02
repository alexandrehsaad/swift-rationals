// GreatestCommonDivisor.swift
// Rationals
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

/// Returns the greatest common divisor.
///
/// ```swift
/// print(gcd(48, 18))
/// // Prints "6"
/// ```
///
/// - parameter lhs: The left value.
/// - parameter rhs: The right value.
/// - returns: The greatest common divisor.
internal func gcd<Value>(_ lhs: Value, _ rhs: Value) -> Value
where Value: Divisible & ExpressibleByIntegerLiteral {
	let remainder: Value = lhs % rhs
	if remainder != 0 {
		return gcd(rhs, remainder)
	} else {
		return rhs
	}
}

/// Returns the greatest common divisor.
///
/// ```swift
/// print(gcd(48, 18))
/// // Prints "6"
/// ```
///
/// - parameter lhs: The left value.
/// - parameter rhs: The right value.
/// - returns: The greatest common divisor.
internal func gcd<Value>(_ lhs: Value, _ rhs: Value) -> Value
where Value: BinaryInteger {
	let remainder: Value = lhs % rhs
	if remainder != 0 {
		return gcd(rhs, remainder)
	} else {
		return rhs
	}
}
