//
//  CardView.swift
//  MemoryGame
//
//  Created by iMac on 11/06/2024.
//

import SwiftUI

struct Card:View {
    
    let cardText:String
    @State var isFaceUp = false

    
    var body: some View{
        ZStack{
            let base = RoundedRectangle(cornerRadius: 12)
            Group{
                base
                .foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                Text(cardText).font(.largeTitle
                ).padding()
            }
            .opacity(isFaceUp ? 1: 0)
            base
            .fill(.orange).opacity(isFaceUp ? 0 : 1)
                
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}


