// Percentage+Decodable.swift
// Rationals
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

extension Percentage: Decodable {
	public init(from decoder: Decoder) throws {
		let container: SingleValueDecodingContainer = try decoder.singleValueContainer()
		let value: Double = try container.decode(Double.self)
		
		self.init(floatLiteral: value)
	}
}
