// Fraction+Negateable.swift
// Rationals
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

extension Fraction: Negateable
where Term: Negateable {
	public prefix static func - (operand: Self) -> Self {
		guard operand.isNaN == false else {
			return .nan
		}
		
		guard Term.min < operand.numerator else {
			return .infinity
		}
		
		let numerator: Term = -operand.numerator
		let denominator: Term = operand.denominator
		
		return .init(numerator, on: denominator)
	}
}
