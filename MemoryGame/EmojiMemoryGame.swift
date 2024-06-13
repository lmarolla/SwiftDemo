//
//  EmojiMemoryGame.swift
//  MemoryGame
//
//  Created by Leandro on 12/06/2024.
//
import SwiftUI

class EmojiMemoryGame:ObservableObject{
    
    private static let emojis = ["🙂","🥺","😻","😼","🎃","😵","😮‍💨","🙍🏻‍♀️"]
    
    //Mark it as published to be observed
    @Published private var model: MemoryGame<String> = MemoryGame<String>(numberOfPairOfCards:3){
        pairIndex in
        if emojis.indices.contains(pairIndex){
            return emojis[pairIndex]
        }
        return  "❌"
    }
       
    
    var cards: Array<MemoryGame<String>.Card>{
        return model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card) -> Bool{
        return model.choose(card)
    }
    
    func shuffle(){
        model.shuffle()
    }
    
}
