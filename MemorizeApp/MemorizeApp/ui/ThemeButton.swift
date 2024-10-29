//
//  ThemeButton.swift
//  MemorizeApp
//
//  Created by Maksim Sachkov on 29/10/2024.
//

import SwiftUI

struct ThemeButton: View {
    var iconSystemName: String
    var text: String
    var onClick: () -> Void
    
    var body: some View {
        Button(action: onClick, label: {
            VStack {
                Image(systemName: iconSystemName).font(.title)
                Spacer().frame(height: 5)
                Text(text)
                    .foregroundColor(.blue)
                    .font(.title3)
            }
        })
    }
}

struct ThemeButtons: View {
    var onClick: (GameTheme) -> Void
    var themes: [GameTheme]
    
    var body: some View {
        HStack {
            ForEach(themes, id: \.name) { theme in
                Spacer()
                ThemeButton(
                    iconSystemName: theme.mainSymbol,
                    text: theme.name
                ) {
                    onClick(theme)
                }
            }
            Spacer()
        }
    }
}

#Preview {
    ThemeButton(
        iconSystemName: SFSymbols.Medicine.thermometer.rawValue,
        text: "hi",
        onClick: {}
    )
}
