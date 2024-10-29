//
//  ContentView.swift
//  MemorizeApp
//
//  Created by Maksim Sachkov on 15/10/2024.
//

import SwiftUI

struct ContentView: View {
    var medicineTheme = GameTheme.medicine()
    var natureTheme = GameTheme.nature()
    var transportTheme = GameTheme.transport()
    
    @State var currentTheme: GameTheme = GameTheme.defaultTheme()
    @State var cardsList: [CardData] = []
    @State var lastFacedUpCard: CardData? = nil
    @State var maxAmountOfIdenticalCardsToBeFacedUp: Int = 2
    
    
    var body: some View {
        VStack {
            Cards(
                cards: cardsList,
                onCardClick: { card in onCardClick(card) }
            )
            Spacer()
            ThemeButtons(
                onClick: {theme in setTheme(theme) },
                themes: [medicineTheme, natureTheme, transportTheme]
            )
        }
        .padding()
        .onAppear {setTheme(medicineTheme)}
    }
    
    private func setTheme(_ theme: GameTheme) {
        currentTheme = theme
        cardsList = generateThemeCardsList(theme)
    }
    
    private func generateThemeCardsList(_ theme: GameTheme) -> Array<CardData> {
        var symbolsList = [CardData]()
        for _ in 0..<maxAmountOfIdenticalCardsToBeFacedUp {
            symbolsList.append(
                contentsOf: theme.symbols.map { symbol in
                    CardData(
                        id: Int.random(in: 0..<Int.max),
                        symbol: symbol,
                        isFacedUp: false
                    )
                }
            )
        }
        return symbolsList.shuffled()
        
    }
    
    private func onCardClick(_ clickedCard: CardData) {
        guard !clickedCard.isFacedUp else { return }
        
        faceUpCard(withId: clickedCard.id)
        
        if lastFacedUpCard == nil || lastFacedUpCard?.symbol == clickedCard.symbol {
            rememberLastFacedUpCard(id: clickedCard.id)
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                faceDownCards(with: lastFacedUpCard?.symbol, clickedCard.symbol)
                lastFacedUpCard = nil
            }
        }
    }
    
    private func rememberLastFacedUpCard(id: Int) {
        let cardIndex = indexOfCard(id: id)
        let amountOfIdenticalFacedUpCards = cardsList
            .filter { card in
                card.symbol == lastFacedUpCard?.symbol
            }
            .count
        let maxAmountOfIdenticalFacedUpCardsReached = amountOfIdenticalFacedUpCards == maxAmountOfIdenticalCardsToBeFacedUp
        
        lastFacedUpCard = if maxAmountOfIdenticalFacedUpCardsReached {
            nil
        } else {
            cardsList[cardIndex]
        }
    }
    
    private func indexOfCard(id: Int) -> Int {
        return cardsList.firstIndex { card in card.id == id } ?? 0
    }
    
    private func faceUpCard(withId id: Int) {
        let cardIndex = indexOfCard(id: id)
        cardsList[cardIndex] = cardsList[cardIndex].copy(isFacedUp: true)
    }
    
    private func faceDownCards(with symbolsToFaceDown: String?...) {
        cardsList = cardsList.map { card in
            if symbolsToFaceDown.contains(card.symbol) {
                card.copy(isFacedUp: false)
            } else {
                card
            }
        }
    }

}



#Preview {
    ContentView()
}
