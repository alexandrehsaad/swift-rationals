// MixedFraction+Divisible.swift
// Rationals
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

extension MixedFraction: Divisible {
	public var reciprocal: Self? {
		guard let reciprocal = self.unmixed().fractional.reciprocal else {
			return nil
		}
		
		return .init(0, and: reciprocal)
	}
	
	public static func / (_ lhs: Self, _ rhs: Self) -> Self {
		guard rhs.isZero == false else {
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
	
	public static func % (_ lhs: Self, _ rhs: Self) -> Self {
		guard rhs.isZero == false else {
			return .nan
		}
		
		if lhs.isFinite && rhs.isInfinite {
			return .zero
		}
		
		let numerator: Term
		let denominator: Term

		if lhs.isLike(rhs) {
			numerator = lhs.numerator % rhs.numerator
			denominator = lhs.denominator
		} else {
			numerator = (lhs.numerator * rhs.denominator) % (lhs.denominator * rhs.numerator)
			denominator = lhs.denominator * rhs.denominator
		}

		return .init(numerator, on: denominator)
	}
}
