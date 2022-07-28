// MixedFraction+Encodable.swift
// Rationals
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

extension MixedFraction: Encodable
where Term: Encodable {
	public func encode(to encoder: Encoder) throws {
		var container: KeyedEncodingContainer<MixedFractionCodingKeys> = encoder.container(keyedBy: Self.MixedFractionCodingKeys.self)

		try container.encode(self.integral, forKey: .integral)
		try container.encode(self.fractional, forKey: .fractional)
	}
}
