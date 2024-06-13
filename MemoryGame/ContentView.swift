//
//  ContentView.swift
//  MemoryGame
//
//  Created by iMac on 10/06/2024.
//

import SwiftUI

struct ContentView: View {
    let emojis: Array<String>=["🙂","🥺","😻","😼","🎃","😵","😮‍💨","🙍🏻‍♀️"]
    var viewModel:EmojiMemoryGame
    @State var CardCount=1
    var body: some View {
        VStack {
            Cards
            CardButtons
        
        }
        .padding()
    }
    
    var Cards: some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120)), GridItem(.adaptive(minimum: 120))]){
            ForEach(0..<CardCount,id: \.self)
            { index in
                Card(cardText: emojis[index])
            }
        }
    }
    
    var CardButtons: some View{
        HStack{
            Button(action: {
                if CardCount<emojis.count
                {
                    CardCount=CardCount+1
                }
            }, label: {
                Image(systemName: "plus.diamond.fill")
            }).disabled( CardCount>=emojis.count)
            Spacer()
            Button(action: {
                if CardCount>1
                {
                    CardCount=CardCount-1
                }
            }, label: {
                Image(systemName: "minus.diamond.fill")
            }).disabled(CardCount<=1)
        }
        .font(.largeTitle)
    }
}





#Preview {
    ContentView()
}
