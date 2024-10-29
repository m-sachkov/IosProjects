//
//  SFSymbols.swift
//  MemorizeApp
//
//  Created by Maksim Sachkov on 23/10/2024.
//

import Foundation

struct SFSymbols {
    enum Transport: String, CaseIterable {
        case car = "car"
        case bus = "bus"
        case plane = "airplane.departure"
        case sailboat = "sailboat"
        case bicycle = "bicycle"
    }
    
    enum Medicine: String, CaseIterable {
        case thermometer = "medical.thermometer"
        case pill = "pill.fill"
        case cross = "cross"
        case waveformEcg = "waveform.path.ecg"
    }
    
    enum Nature: String, CaseIterable {
        case globe = "globe.americas"
        case sun = "sun.horizon"
        case moon = "moon"
        case cloud = "cloud.drizzle.fill"
        case snowflake = "snowflake"
        case rainbow = "rainbow"
    }
}
