// Simplifiable.swift
// Rationals
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

/// Representing values that can be simplified.
public protocol Simplifiable {
	
	// MARK: - Inspecting Values
	
	/// A boolean value indicating whether this fraction is simplifiable.
	var isSimplifiable: Bool { get }
	
	// MARK: - Simplifying Values
	
	/// A function to simplify this instance..
	///
	/// - returns: The simplified instance.
	func simplified() -> Self
}

extension Simplifiable {
	
	// MARK: - Inspecting Values
	
	/// A boolean value indicating whether this fraction is simplified.
	///
	/// A simplified fraction is a fraction reduced to its lowest terms.
	///
	/// ```swift
	/// let fraction: Fraction = .init(1, on: 2)
	/// print(fraction.isSimplified)
	/// // Prints "true"
	/// ```
	public var isSimplified: Bool {
		return self.isSimplifiable == false
	}
	
	// MARK: - Simplifying Values
	
	/// A function to reduce this fraction to its lowest terms.
	///
	/// ```swift
	/// var fraction: Fraction = .init(2, on: 4)
	/// fraction.simplify()
	/// print(fraction)
	/// // Prints "1/2"
	/// ```
	public mutating func simplify() {
		self = self.simplified()
	}
}

extension Simplifiable
where Self: Rational {
	
	// MARK: - Inspecting Values
	
	/// A boolean value indicating whether this fraction is simplifiable.
	public var isSimplifiable: Bool {
		let divisor: Term = gcd(self.numerator, self.denominator)
		return divisor > 1
	}
	
	// MARK: - Simplifying Values
	
	/// A function to reduce this fraction to its lowest terms.
	///
	/// ```swift
	/// let fraction: Fraction = .init(2, on: 4)
	/// print(fraction.simplified())
	/// // Prints "1/2"
	/// ```
	///
	/// - returns: The simplified fraction.
	public func simplified() -> Self {
		let divisor: Term = gcd(self.numerator, self.denominator)
		
		guard divisor > 1 else {
			return self
		}
		
		let newNumerator: Term = self.numerator / divisor
		let newDenominator: Term = self.denominator / divisor
		
		return .init(newNumerator, on: newDenominator)
	}
	
	/// A function to reduce this fraction to its lowest terms.
	///
	/// ```swift
	/// var fraction: Fraction = .init(2, on: 4)
	/// fraction.simplify()
	/// print(fraction)
	/// // Prints "1/2"
	/// ```
	public mutating func simplify() {
		self = self.simplified()
	}
}
