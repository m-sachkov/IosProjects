//
//  CardData.swift
//  MemorizeApp
//
//  Created by Maksim Sachkov on 29/10/2024.
//

import Foundation

struct CardData {
    var id: Int
    var symbol: String
    var isFacedUp: Bool
    
    func copy(
        id: Int? = nil,
        symbol: String? = nil,
        isFacedUp: Bool? = nil
    ) -> CardData {
        return CardData(
            id: id ?? self.id,
            symbol: symbol ?? self.symbol,
            isFacedUp: isFacedUp ?? self.isFacedUp
        )
    }
}
