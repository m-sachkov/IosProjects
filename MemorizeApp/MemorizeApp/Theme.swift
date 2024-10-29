//
//  Theme.swift
//  MemorizeApp
//
//  Created by Maksim Sachkov on 23/10/2024.
//

import Foundation


struct GameTheme {
    let name: String
    let symbols: Array<String>
    let mainSymbol: String
    
    static func medicine() -> GameTheme {
        return GameTheme(
            name: "Medicine",
            symbols: SFSymbols.Medicine.allCases.map { $0.rawValue },
            mainSymbol: SFSymbols.Medicine.cross.rawValue
        )
    }

    static func nature() -> GameTheme {
        return GameTheme(
            name: "Nature",
            symbols: SFSymbols.Nature.allCases.map { $0.rawValue },
            mainSymbol: SFSymbols.Nature.globe.rawValue
        )
    }

    static func transport() -> GameTheme {
        return GameTheme(
            name: "Transport",
            symbols: SFSymbols.Transport.allCases.map { $0.rawValue },
            mainSymbol: SFSymbols.Transport.car.rawValue
        )
    }
    
    static func defaultTheme() -> GameTheme { return medicine() }
}
