//
//  Card.swift
//  MemorizeApp
//
//  Created by Maksim Sachkov on 29/10/2024.
//

import SwiftUI

struct Card: View {
    var data: CardData
    var onClick: (CardData) -> Void
    
    var body: some View {
        ZStack {
            let body = RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
            if data.isFacedUp {
                body
                    .fill(Color.white)
                    .strokeBorder(lineWidth: 2)
            } else {
                body
            }
            Image(systemName: data.symbol)
                .font(.largeTitle)
                .opacity(data.isFacedUp ? 1 : 0)
        }
        .onTapGesture {
            onClick(data)
        }
    }
}

struct Cards: View {
    var cards: [CardData]
    var onCardClick: (CardData) -> Void
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
                ForEach(0..<cards.count, id: \.self) { index in
                    Card(
                        data: cards[index],
                        onClick: { card in onCardClick(card)}
                    )
                    .aspectRatio(2/3, contentMode: .fill)
                    .foregroundColor(.orange)
                }
            }
        }
    }
}

#Preview {
    Card(
        data: CardData(
            id: 123,
            symbol: SFSymbols.Medicine.thermometer.rawValue,
            isFacedUp: true
        ),
        onClick: { data in }
    )
    .padding(20)
    .foregroundStyle(.green)
}
