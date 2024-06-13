//
//  MemorizeGame.swift
//  MemoryGame
//
//  Created by Leandro on 12/06/2024.
//

import Foundation

struct MemoryGame<CardContent> where CardContent:Equatable{
    private (set) var cards: Array<Card>
    private (set) var lastSelectedCardIndex = -1
    private (set) var pendingMatchingPairs = -1
    init(numberOfPairOfCards:Int, cardContentFactory:(Int)->CardContent){
        cards=[]
        pendingMatchingPairs = numberOfPairOfCards
        for pairIndex in 0..<max(numberOfPairOfCards,2){
            let cardContent = cardContentFactory(pairIndex);
            cards.append(Card(content:cardContent, id: "\(pairIndex+1)a"))
            cards.append(Card(content:cardContent, id: "\(pairIndex+1)b"))
        }
    }
    
    mutating func choose(_ card: Card)->Bool{
        let idx=index(of:card)
        if !cards[idx].isMatched{
            if lastSelectedCardIndex == -1 {
                cards[idx].isFaceUp.toggle()
                lastSelectedCardIndex = idx
            }
            else if cards[lastSelectedCardIndex].content == card.content {
                cards[idx].isFaceUp.toggle()
                cards[idx].isMatched.toggle()
                cards[lastSelectedCardIndex].isMatched.toggle()
                lastSelectedCardIndex = -1
                pendingMatchingPairs-=1
            }
            else{
                resetAllCards()
            }
        }
        return pendingMatchingPairs == 0
    }

    func index(of card: Card) -> Int{
        for index in cards.indices{
            if cards[index].id == card.id{
                return index
            }
        }
        return 0
    }
    
    mutating func shuffle(){
        print("Shuffling")
        resetIndexs()
        for index in cards.indices{
            if cards[index].isFaceUp{
                cards[index].isFaceUp = false
                cards[index].isMatched = false
            }
        }
        cards.shuffle()
    }
    
    mutating func resetAllCards(){
        resetIndexs()
        for index in cards.indices{
            cards[index].isMatched = false
            cards[index].isFaceUp = false
        }
    }
    
    mutating func resetIndexs(){
        lastSelectedCardIndex = -1
        pendingMatchingPairs = cards.count/2
    }
    
    struct Card: Identifiable{
        var isFaceUp = false
        var isMatched = false
        let content: CardContent
        var id:String
    }
}


