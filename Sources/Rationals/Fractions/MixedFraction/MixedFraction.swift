// MixedFraction.swift
// Rationals
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

/// A representation of a mixed fraction, or the sum of two fractions without loss of precision.
public struct MixedFraction {
	
	// MARK: - Creating Fractions
	
	/// Creates a new instance with the specified integral, numerator and denominator.
	///
	/// - parameter integral: The integral part.
	/// - parameter fractional: The fractional part.
	/// - Warning: Passing in Int.min in any parameters will cause a fatal error.
	internal init<Value>(_ integral: Value, and fractional: Fraction)
	where Value: BinaryInteger {
		self.integral = .init(integral)
		self.fractional = fractional
	}
	
	/// Creates a new instance with the specified integral, numerator and denominator.
	///
	/// - parameter integral: The integral part.
	/// - parameter numerator: The numerator.
	/// - parameter denominator: The denominator.
	/// - Warning: Passing in Int.min in any parameters will cause a fatal error.
	public init<Value>(_ integral: Value, _ numerator: Value, on denominator: Value)
	where Value: BinaryInteger {
		self.init(integral, and: .init(numerator, on: denominator))
	}
	
	// MARK: - Fraction Properties
	
	/// The integral part of this fraction.
	public let integral: Int
	
	/// The fractional part of this fraction.
	public let fractional: Fraction
	
	/// The numerator of this fraction.
	public var numerator: Int {
		self.fractional.numerator
	}
	
	/// The denominator of this fraction.
	public var denominator: Int {
		self.fractional.denominator
	}
	
	// MARK: - Inspecting Fractions
	
	/// A boolean value indicating whether this fraction is mixable.
	public var isMixable: Bool {
		return self.numerator >= self.denominator
	}
	
	/// A boolean value indicating whether this fraction is mixed.
	///
	/// A mixed fraction is formed by combining an integer and a fraction.
	///
	/// ```swift
	/// let value: MixedFraction = .init(2, 3, on: 4)
	/// print(value.isMixed)
	/// // Prints "true"
	/// ```
	public var isMixed: Bool {
		return self.integral != 0
	}
	
	// MARK: - Mixing Fractions
	
	/// A function to convert this fraction to a mixed fraction.
	///
	/// ```swift
	/// let value: MixedFraction = .init(11, on: 4)
	/// print(value.mixed())
	/// // Prints "2 3/4"
	/// ```
	///
	/// - returns: The mixed fraction.
	public func mixed() -> Self {
		let newIntegral: Int = self.integral + self.numerator / self.denominator
		let newNumerator: Int = self.numerator % self.denominator
		return .init(newIntegral, newNumerator, on: self.denominator)
	}
	
	/// A function to convert this fraction to a mixed fraction.
	///
	/// ```swift
	/// var value: MixedFraction = .init(11, on: 4)
	/// value.mix()
	/// print(value)
	/// // Prints "2 3/4"
	/// ```
	public mutating func mix() {
		self = self.mixed()
	}
	
	/// A function to convert this fraction to not a mixed fraction.
	///
	/// ```swift
	/// let value: MixedFraction = .init(2, 3, on: 4)
	/// print(value.unmixed())
	/// // Prints "11/4"
	/// ```
	///
	/// - returns: The unmixed fraction.
	public func unmixed() -> Self {
		let newNumerator: Int = self.integral * self.denominator + self.numerator
		let newDenominator: Int = self.denominator
		return .init(0, newNumerator, on: newDenominator)
	}
	
	/// A function to convert this fraction to not a mixed fraction.
	///
	/// ```swift
	/// var value: MixedFraction = .init(2, 3, on: 4)
	/// value.unmix()
	/// print(value)
	/// // Prints "11/4"
	/// ```
	public mutating func unmix() {
		self = self.unmixed()
	}
}
