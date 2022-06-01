// Percentage+ExpressibleByFloatLiteral.swift
// Rationals
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

extension Percentage: ExpressibleByFloatLiteral {
    public init(floatLiteral value: FloatLiteralType) {
        self.init(value)
    }
}
