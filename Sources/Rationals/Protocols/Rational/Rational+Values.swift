// Rational+Values.swift
// Rationals
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

extension Rational {
	
	// MARK: - Creating Instances
	
	/// Creates a new instance with the specified unit of a fraction.
	///
	/// - parameter unit: The unit of fraction.
	internal init(unit: UInt) {
		self.init(1, on: .init(unit))
	}
	
	// MARK: - Inspecting Values
	
	/// A boolean value indicating whether this fraction is a unit.
	///
	/// A unit fraction is a fraction with a numerator of 1 and the denominator is a positive integer. A unit fraction is therefore the reciprocal of a positive integer.
	///
	/// ```swift
	/// let fraction: Set<Fraction> = .half
	/// print(fraction.isUnit)
	/// // Prints "true"
	/// ```
	public var isUnit: Bool {
		return self.numerator == 1
			&& self.numerator <= self.denominator
	}
	
	// MARK: - Other Values
	
	/// The value representing a half.
	public static var half: Self {
		return .init(unit: 2)
	}
	
	/// The value representing a third.
	public static var third: Self {
		return .init(unit: 3)
	}
	
	/// The value representing a quarter.
	public static var quarter: Self {
		return .init(unit: 4)
	}
	
	/// The value representing a fifth.
	public static var fifth: Self {
		return .init(unit: 5)
	}
	
	/// The value representing a sixth.
	public static var sixth: Self {
		return .init(unit: 6)
	}
	
	/// The value representing a seventh.
	public static var seventh: Self {
		return .init(unit: 7)
	}
	
	/// The value representing an eighth.
	public static var eighth: Self {
		return .init(unit: 8)
	}
	
	/// The value representing a ninth.
	public static var ninth: Self {
		return .init(unit: 9)
	}
}
