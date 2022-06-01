// MixedFractionCodingKeys.swift
// Rationals
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

extension MixedFraction {
	/// The coding keys for the codable protocol.
	internal enum MixedFractionCodingKeys: String, CodingKey {
		///
		case integral
		
		///
		case fractional
	}
}
