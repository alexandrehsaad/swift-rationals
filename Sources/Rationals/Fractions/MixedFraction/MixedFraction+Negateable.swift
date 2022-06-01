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
		
		guard Term.min < operand.integral
		&& Term.min < operand.numerator else {
			return .infinity
		}
		
		let newIntegral: Term = -operand.integral
		let newNumerator: Term = -operand.numerator
		let newDenominator: Term = operand.denominator
		
		return .init(newIntegral, newNumerator, on: newDenominator)
	}
}
