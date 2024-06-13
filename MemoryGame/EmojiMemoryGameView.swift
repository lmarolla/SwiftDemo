//
//  EmojiMemoryGameView.swift
//  MemoryGame
//
//  Created by Leandro on 10/06/2024.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    var viewModel:EmojiMemoryGame = EmojiMemoryGame()
    @State var CardCount=1
    var body: some View {
        VStack {
            Cards
        
        }
        .padding()
    }
    
    var Cards: some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120)), GridItem(.adaptive(minimum: 120))]){
            ForEach(viewModel.cards.indices, id: \.self)
            { index in
                CardView(card: viewModel.cards[index])
            }
        }
    }
}





#Preview {
    EmojiMemoryGameView()
}
