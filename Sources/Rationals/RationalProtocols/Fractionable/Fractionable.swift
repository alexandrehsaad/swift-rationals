// Fractionable.swift
// Rationals
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

/// Representing values that can be fractioned.
public protocol Fractionable {
	
	// MARK: - Creating Instances
	
	/// Creates a new instance with the specified numerator and denominator.
	///
	/// - parameter numerator: The numerator.
	/// - parameter denominator: The denominator.
	init<Value>(_ numerator: Value, on denominator: Value)
	where Value: BinaryInteger
	
	// MARK: - Instance Properties
	
	/// The numerator of this instance.
	var numerator: Int { get }
	
	/// The denominator of this instance.
	var denominator: Int { get }
	
	/// The quotient of this instance.
	var quotient: Double { get }
}

extension Fractionable {
	
	// MARK: - Inspecting Values
	
	/// A boolean value indicating whether this fraction is proper.
	///
	/// A proper fraction is a fraction with its quotient strictly greater than zero and less than one.
	///
	/// ```swift
	/// let value: Fraction = 3/4
	/// print(value.isProper)
	/// // Prints "true"
	/// ```
	public var isProper: Bool {
		let quotient: Double = self.quotient
		return 0 < quotient && quotient < 1
	}
	
	/// A boolean value indicating whether this fraction is improper.
	///
	/// An improper fraction is a fraction with its quotient strictly greater or equal to one.
	///
	/// ```swift
	/// let value: Fraction = 5/4
	/// print(value.isImproper)
	/// // Prints "true"
	/// ```
	public var isImproper: Bool {
		let quotient: Double = self.quotient
		return 1 <= quotient
	}

	/// A boolean value indicating whether this instance is whole.
	///
	/// A whole fraction is any positive fraction with the same terms.
	///
	/// ```swift
	/// let value: Fraction = 2/2
	/// print(value.isWhole)
	/// // Prints "true"
	/// ```
	public var isWhole: Bool {
		return self.numerator == self.denominator
			&& self.numerator > 0
	}
	
	/// A boolean value indicating whether this fraction is dyadic.
	///
	/// A dyadic fraction is a fraction in which the denominator is a power of 2.
	///
	/// ```swift
	/// let value: Fraction = .init(1, on: 2)
	/// print(value.isDyadic)
	/// // Prints "true"
	/// ```
	public var isDyadic: Bool {
		return self.denominator.isPower(of: 2)
	}
	
	/// Returns a boolean value indicating whether the two specified fractions are like fractions.
	///
	/// Two like fractions have the same denominator.
	///
	/// ```swift
	/// let lhs: Fraction = .init(1, on: 2)
	/// let rhs: Fraction = .init(2, on: 2)
	/// print(lhs.isLike(rhs))
	/// // Prints "true"
	/// ```
	///
	/// - parameter rhs: A fraction to compare.
	/// - returns: `true` if is like, and `false` otherwise.
	public func isLike(_ rhs: Self) -> Bool {
		return self.denominator == rhs.denominator
	}
}

extension Fractionable
where Self: Negateable {
	
	// MARK: - Inspecting Values
	
	/// A boolean value indicating whether this fraction is normalized.
	///
	/// A normalized fraction is a fraction with a positive denominator.
	///
	/// ```swift
	/// let value: Fraction = .init(-1, on: 1)
	/// print(value.isNormalized)
	/// // Prints "true"
	/// ```
	public var isNormalized: Bool {
		return self.denominator > 0
	}
	
	// MARK: - Normalizing Values
	
	/// A function to normalize the signs within this fraction.
	///
	/// A fraction with two negative signs is normalized with two positive signs, or a fractions with a negative denominator is normalized with a negative numerator and positive denominator.
	///
	/// ```swift
	/// let value: Fraction = .init(1, on: -1)
	/// print(value.normalized())
	/// // Prints "-1/1"
	/// ```
	///
	/// - returns: The normalized fraction.
	public func normalized() -> Self {
		guard self.isNormalized == false else {
			return self
		}
		
		let newNumerator: Int = -self.numerator
		let newDenominator: Int = -self.denominator
		return .init(newNumerator, on: newDenominator)
	}
	
	/// A function to normalize the signs within this fraction.
	///
	/// A fraction with two negative signs is normalized with two positive signs, or a fractions with a negative denominator is normalized with a positive denominator and negative numerator.
	///
	/// ```swift
	/// var value: Fraction = .init(1, on: -1)
	/// value.normalize()
	/// print(value)
	/// // Prints "-1/1"
	/// ```
	public mutating func normalize() {
		self = self.normalized()
	}
}

extension Fractionable
where Self: RepresentableByNaN {
	public var isNaN: Bool {
		return self.numerator == 0
			&& self.denominator == 0
	}
	
	public static var nan: Self {
		return .init(0, on: 0)
	}
}

extension Fractionable
where Self: RepresentableByZero {
	public var isFinite: Bool {
		return self.denominator != 0
	}
	
	public var isInfinite: Bool {
		return self.numerator != 0
			&& self.denominator == 0
	}
	
	public static var infinity: Self {
		return .init(1, on: 0)
	}
}
