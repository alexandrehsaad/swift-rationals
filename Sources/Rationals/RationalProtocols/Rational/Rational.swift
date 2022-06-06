// Rational.swift
// Rationals
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import NumericProtocols

/// Representing values that can be fractioned.
public protocol Rational {
	/// The numerator and denominator of rational numbers.
	associatedtype Term
	where Term: FixedWidthInteger
	
	// MARK: - Creating Instances
	
	/// Creates a new instance with the specified numerator and denominator.
	///
	/// - parameter numerator: The numerator.
	/// - parameter denominator: The denominator.
	init(_ numerator: Term, on denominator: Term)
	
	// MARK: - Instance Properties
	
	/// The numerator of this instance.
	var numerator: Term { get }
	
	/// The denominator of this instance.
	var denominator: Term { get }
	
	/// The quotient of this instance.
	var quotient: Double { get }
}

extension Rational {
	
	// MARK: - Creating Instances
	
	/// Creates a new instance with the specified approximate value.
	///
	/// - parameter value: The approximate value.
	/// - parameter precision: The precision.
	private init(
		approximately value: Double,
		precision: Double
	) {
		var currentValue: Double = value
		
		var integral: Int {
			return .init(currentValue.rounded(.down))
		}
		
		var fractional: Double {
			return currentValue - .init(integral)
		}
		
		var (n, d, numerator, denominator) = (1, 0, integral, 1)
		
		var epsilon: Double {
			return precision * .init(denominator * denominator)
		}
		
		while fractional > epsilon {
			currentValue = 1 / (currentValue - .init(integral))
			
			let newNumerator: Int = n + integral * numerator
			let newDenominator: Int = d + integral * denominator
			
			(n, d, numerator, denominator) = (numerator, denominator, newNumerator, newDenominator)
		}
		
		self.init(.init(numerator), on: .init(denominator))
	}
	
	/// Creates a new instance with the specified approximate value.
	///
	/// - parameter value: The approximate value.
	/// - parameter precision: The precision.
	public init(
		approximately value: Double,
		withPrecision precision: Double = 1e-6
	) where Self: RepresentableByNaN & RepresentableByInfinity & Negateable {
		if value.isNaN {
			self = .nan
		} else if value <= Double(Term.min) {
			self = .negativeInfinity
		} else if Double(Term.max) < value {
			self = .infinity
		} else {
			self.init(approximately: value, precision: precision)
		}
	}
	
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
	internal func isLike(_ rhs: Self) -> Bool {
		return self.denominator == rhs.denominator
	}
}

extension Rational
where Self: Negateable, Term: Negateable {
	
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
		
		let newNumerator: Term = -self.numerator
		let newDenominator: Term = -self.denominator
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

extension Rational
where Self: RepresentableByInfinity {
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

extension Rational
where Self: RepresentableByNaN {
	public var isNaN: Bool {
		return self.numerator == 0
			&& self.denominator == 0
	}
	
	public static var nan: Self {
		return .init(0, on: 0)
	}
}

// FIXME: Ambiguous use of 'isMultiple(of:)'.
extension Rational
where Self: Multipliable {
	/// Returns a boolean value indicating whether this value is a multiple of the specified value.
	///
	/// ```swift
	/// print(50.isMultiple(of: 10))
	/// // Prints "true"
	/// ```
	///
	/// - parameter other: The value to test.
	/// - returns: Returns `true` if this value is a multiple of the given value, and `false` otherwise.
	public func isMultiple(of other: Self) -> Bool
	where Self: Divisible & ExpressibleByIntegerLiteral {
		if self == 0 && other == 0 {
			return true
		}
		
		return (self % other) == 0
	}
}
