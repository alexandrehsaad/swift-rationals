// Percentage.swift
// Rationals
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

/// A representation of a percentage, or the quotient of a fraction with a denominator of 100.
public struct Percentage {
	
	// MARK: - Creating Percentages
	
	/// Creates a new instance with the specified numerator.
	///
	/// - parameter numerator: The numerator.
	public init<Value>(_ numerator: Value)
	where Value: BinaryInteger {
		self.numerator = .init(numerator)
	}
    
    /// Creates a new instance with the specified numerator.
    ///
    /// - parameter numerator: The numerator.
    public init<Value>(_ numerator: Value)
    where Value: BinaryFloatingPoint {
        self.numerator = .init(numerator)
    }
	
	/// Creates a new instance with the specified initial and final values, defining an increase or decrease.
	///
	/// If the percentage is negative, the result is a decrease; else, an increase.
	///
	/// ```swift
	/// let increase: Percentage = .init(from: 10, to: 12)
	/// print(increase)
	/// // Prints "20%"
	/// ```
	///
	/// - parameter initialValue: The initial value.
	/// - parameter finalValue: The final value.
	public init<Value>(from initialValue: Value, to finalValue: Value)
	where Value: BinaryFloatingPoint {
		let newNumerator: Double = .init((finalValue - initialValue) / initialValue) * 100
		self.init(newNumerator)
	}
	
	// MARK: - Percentage Properties
	
	/// The numerator of this percentage.
	public let numerator: Double
	
	/// The denominator of all percentages.
	public let denominator: Int = 100
    
    /// The quotient of this percentage.
	public var quotient: Double {
        return self.numerator / .init(self.denominator)
    }
}
