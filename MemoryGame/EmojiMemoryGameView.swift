//
//  EmojiMemoryGameView.swift
//  MemoryGame
//
//  Created by Leandro on 10/06/2024.
//

import SwiftUI
import ConfettiSwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel:EmojiMemoryGame
    @State private var completedMessage = false
    @State private var counter = 0
    var body: some View {
        ScrollView {
            if completedMessage{
                Text("Congrats you made it!")
                    .font(.title)
                    .fixedSize(horizontal: false, vertical: true)
                Button("Start over"){
                    completedMessage = false
                    viewModel.shuffle()
                }
                .padding(20)
                Button("🎉"){
                counter+=1
                }
                .padding(150)
                .font(.largeTitle)
                .confettiCannon(counter:$counter)
            }
            else{
                Text("Choose 2 cards till you complete the game")
                Button("Shuffle"){
                    viewModel.shuffle()
                }
                Cards
            }
        }
        .padding()
    }
    
    var Cards: some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 100)), GridItem(.adaptive(minimum: 100))]){
            ForEach(viewModel.cards){ card in
                CardView(card: card)
                    .onTapGesture {
                        if viewModel.choose(card){
                            completedMessage.toggle()
                            counter+=1
                        }
                }
            }
        }
    }
}


#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}
