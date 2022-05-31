// Fraction+Encodable.swift
// Rationals
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

extension Fraction: Encodable {
	public func encode(to encoder: Encoder) throws {
		var container: KeyedEncodingContainer<FractionCodingKeys> = encoder.container(keyedBy: Self.FractionCodingKeys.self)

		try container.encode(self.numerator, forKey: .numerator)
		try container.encode(self.denominator, forKey: .denominator)
	}
}
