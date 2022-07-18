//
//  Token.swift
//  ZKSync2
//
//  Created by Maxim Makhun on 7/17/22.
//

import Foundation
import BigInt

public struct Token: TokenId, Decodable {
    
    public static let DefaultAddress = "0x0000000000000000000000000000000000000000"
    
    public static var ETH: Token {
        return Token(id: 0,
                     address: Token.DefaultAddress,
                     symbol: "ETH",
                     decimals: 18)
    }
    
    public let id: UInt32
    public let address: String
    public let symbol: String
    let decimals: Int
    
    public func intoDecimal(_ amount: BigUInt) -> Decimal {
        let sourceDecimal = Decimal(string: "\(amount)")!
        return sourceDecimal / pow(Decimal(10), decimals)
    }
    
    var isETH: Bool {
        return (address == Token.DefaultAddress && symbol == "ETH")
    }
}
