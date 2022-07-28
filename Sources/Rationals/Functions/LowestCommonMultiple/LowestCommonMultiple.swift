// LowestCommonMultiple.swift
// Rationals
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

/// Returns the lowest common multiple.
///
/// ```swift
/// print(lcm(48, 18))
/// // Prints "144"
/// ```
///
/// - parameter lhs: The left value.
/// - parameter rhs: The right value.
/// - returns: The lowest common multiple.
internal func lcm<Value>(_ lhs: Value, _ rhs: Value) -> Value
where Value: Divisible & Multipliable & ExpressibleByIntegerLiteral {
	return lhs * rhs / gcd(lhs, rhs)
}
