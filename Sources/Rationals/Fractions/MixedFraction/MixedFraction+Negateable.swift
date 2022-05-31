// MixedFraction+Negateable.swift
// Rationals
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

extension MixedFraction: Negateable {
	public prefix static func - (operand: Self) -> Self {
		guard operand.isNaN == false else {
			return .nan
		}
		
		guard Int.min < operand.integral && Int.min < operand.numerator else {
			return .infinity
		}
		
		let newIntegral: Int = -operand.integral
		let newNumerator: Int = -operand.numerator
		let newDenominator: Int = operand.denominator
		
		return .init(newIntegral, newNumerator, on: newDenominator)
	}
}
