//
//  EmojiMemoryGame.swift
//  MemoryGame
//
//  Created by Leandro on 12/06/2024.
//

import SwiftUI

class EmojiMemoryGame{
    
    private static let emojis = ["🙂","🥺","😻","😼","🎃","😵","😮‍💨","🙍🏻‍♀️"]
    
    
    private var model: MemoryGame<String> = MemoryGame<String>(numberOfPairOfCards:8)
    {
        pairIndex in
        if emojis.indices.contains(pairIndex){
            return emojis[pairIndex]
        }
        return  "❌"
    }
       
    
    var cards: Array<MemoryGame<String>.Card>{
        return model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card)
    }
    
}
