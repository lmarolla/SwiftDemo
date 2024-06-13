//
//  EmojiMemoryGame.swift
//  MemoryGame
//
//  Created by iMac on 12/06/2024.
//

import SwiftUI


func createCardContent(forPairAtIndex index:Int) -> String{
   return ["🙂","🥺","😻","😼","🎃","😵","😮‍💨","🙍🏻‍♀️"][index]
}

class EmojiMemoryGame{
    
    private var model: MemoryGame<String> = MemoryGame<String>(numberOfPairOfCards:4,cardContentFactory: createCardContent)
       
    
    var cards: Array<MemoryGame<String>.Card>{
        return model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card)
    }
    
}
