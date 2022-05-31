// Fraction+Divisible.swift
// Rationals
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

extension Fraction: Divisible {
	/// Returns the reciprocal of this instance.
	///
	/// The reciprocal is the multiplicative inverse of this fraction. The reciprocal of a proper fraction is improper, and the reciprocal of an improper fraction not equal to 1 is a proper fraction. When the numerator and denominator of a fraction are equal, its value is 1, the fraction therefore is improper. Every fraction or integer, except for zero, has a reciprocal.
	///
	/// ```swift
	/// let fraction: Fraction = 1
	/// print(fraction.reciprocal)
	/// // Prints "3/1"
	/// ```
	/// - Warning: The reciprocal of this fraction with zero as the new denominator will cause a fatal error.
	public var reciprocal: Self? {
		guard self.isFinite else {
			return .nan
		}
		
		guard self.isInvertible else {
			return nil
		}
		
		return .init(self.denominator, on: self.numerator)
	}
	
	/// Returns the quotient of dividing the first specified value by the second.
	///
	/// ```swift
	/// let whole: Fraction = .init(1, on: 1)
	/// print(whole / 2)
	/// // Prints "1/2"
	/// ```
	///
	/// - parameter lhs: The dividend.
	/// - parameter rhs: The divisor.
	/// - returns: The quotient.
	public static func / (_ lhs: Self, _ rhs: Self) -> Self {
		guard lhs.isZero == false && rhs.isZero == false else {
			return .nan
		}
		
		if lhs.isFinite && rhs.isInfinite {
			return .zero
		}
		
		guard let reciprocal = rhs.reciprocal else {
			return .nan
		}
		
		return lhs * reciprocal
	}
	
	/// Returns the remainder of dividing the first specified value by the second.
	///
	/// - parameter lhs: The dividend.
	/// - parameter rhs: The divisor.
	/// - returns: The remainder.
	public static func % (lhs: Self, rhs: Self) -> Self {
		let newValue: Double = lhs.quotient % rhs.quotient
		return .init(floatLiteral: newValue)
	}
}
