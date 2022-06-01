// Fraction.swift
// Rationals
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

/// A representation of a fraction, or the quotient of two numbers without loss of precision.
public struct Fraction<Term>
where Term: FixedWidthInteger & Operatable & Negateable & Raisable {
	
	// MARK: - Creating Fractions
	
	/// Creates a new instance with the specified approximate value.
	///
	/// - parameter value: The approximate value.
	/// - parameter precision: The precision.
	public init(
		approximately value: Double,
		withPrecision precision: Double = 1e-6
	) {
		if value.isNaN {
			self = .nan
		} else if value <= Double(Int.min) {
			self = .negativeInfinity
		} else if Double(Int.max) < value {
			self = .infinity
		} else {
			
			var currentValue: Double = value
			
			var integral: Int {
				return .init(currentValue.rounded(.down))
			}
			
			var fractional: Double {
				return currentValue - .init(integral)
			}
			
			var (h, k, numerator, denominator) = (1, 0, integral, 1)
			
			var epsilon: Double {
				return precision * .init(denominator * denominator)
			}
			
			while fractional > epsilon {
				currentValue = 1 / (currentValue - .init(integral))
				
				let newNumerator: Int = h + integral * numerator
				let newDenominator: Int = k + integral * denominator
				
				(h, k, numerator, denominator) = (numerator, denominator, newNumerator, newDenominator)
			}
			
			self.init(.init(numerator), on: .init(denominator))
		}
	}
	
	// MARK: - Fraction Properties
	
	/// The numerator of this fraction.
	public let numerator: Term
	
	/// The denominator of this fraction.
	public let denominator: Term
}
