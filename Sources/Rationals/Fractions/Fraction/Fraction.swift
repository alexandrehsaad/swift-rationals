// Fraction.swift
// Rationals
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

/// A representation of a fraction, or the quotient of two numbers without loss of precision.
public struct Fraction<Term>
where Term: FixedWidthInteger & Operatable & Raisable {
	
	// MARK: - Fraction Properties
	
	/// The numerator of this fraction.
	public let numerator: Term
	
	/// The denominator of this fraction.
	public let denominator: Term
}
