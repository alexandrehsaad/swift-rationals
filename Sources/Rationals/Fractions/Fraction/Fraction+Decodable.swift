// Fraction+Decodable.swift
// Rationals
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

extension Fraction: Decodable
where Term: Decodable {
	public init(from decoder: Decoder) throws {
		let container: KeyedDecodingContainer<FractionCodingKeys> = try decoder.container(keyedBy: Self.FractionCodingKeys.self)

		let numerator = try container.decode(Term.self, forKey: .numerator)
		let denominator = try container.decode(Term.self, forKey: .denominator)

		self.init(numerator, on: denominator)
	}
}
