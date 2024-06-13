//
//  CardView.swift
//  MemoryGame
//
//  Created by Leandro on 11/06/2024.
//

import SwiftUI

struct CardView:View {
    
    let card:MemoryGame<String>.Card
    var body: some View{
        ZStack{
            let base = RoundedRectangle(cornerRadius: 12)
            Group{
                base
                .foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/).padding()
            }
            .opacity(card.isFaceUp ? 1: 0)
            base
                .fill(.orange).opacity(card.isFaceUp ? 0 : 1)
                
        }
    }
}


