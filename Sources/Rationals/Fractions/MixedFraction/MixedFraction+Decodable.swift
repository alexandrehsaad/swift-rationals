// MixedFraction+Decodable.swift
// Rationals
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

extension MixedFraction: Decodable
where Term: Decodable {
	public init(from decoder: Decoder) throws {
		let container: KeyedDecodingContainer<MixedFractionCodingKeys> = try decoder.container(keyedBy: Self.MixedFractionCodingKeys.self)

		let integral = try container.decode(Term.self, forKey: .integral)
		let fractional = try container.decode(Fraction<Term>.self, forKey: .fractional)

		self.init(integral, and: fractional)
	}
}
