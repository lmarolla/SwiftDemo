//
//  MemorizeGame.swift
//  MemoryGame
//
//  Created by Leandro on 12/06/2024.
//

import Foundation

struct MemoryGame<CardContent>{
    
    private (set) var cards: Array<Card>
    
    init(numberOfPairOfCards:Int, cardContentFactory:(Int)->CardContent){
        cards=[]
        for pairIndex in 0..<max(numberOfPairOfCards,2){
            let cardContent = cardContentFactory(pairIndex);
            cards.append(Card(content:cardContent))
            cards.append(Card(content:cardContent))
        }
    }
    
    func choose(_ card: Card){
     //  card.isFaceUp = true
    }
    
    struct Card{
        var isFaceUp = false
        var isMatched = false
        let content: CardContent
    }
}


