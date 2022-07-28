// Percentage+Encodable.swift
// Rationals
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

extension Percentage: Encodable {
	public func encode(to encoder: Encoder) throws {
		try self.numerator.encode(to: encoder)
	}
}
