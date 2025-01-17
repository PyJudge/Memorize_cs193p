//
//  MemoryGame.swift
//  Memorize_cs193p
//
//  Created by LatteFairy on 2020/05/24.
//  Copyright © 2020 Seoul High Court. All rights reserved.
//

// Building a MODEL

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable{
    
    private(set) var cards : Array <Card>
    private var indexOfTheOneAndOnlyFaceUpCard : Int? {
        get{ cards.indices.filter{ cards[$0].isFaceUp }.only }

        set{
            for index in cards.indices {
                if index == newValue {
                    cards[index].isFaceUp = true
                } else {
                    cards[index].isFaceUp = false
                }
            }
        }
    }
    
    mutating func choose(card : Card){
        print(" chosen card \(card)")
        if let chosenIndex = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched{
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard{
                if cards[chosenIndex].content == cards[potentialMatchIndex].content{
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                self.cards[chosenIndex].isFaceUp = true
            } else {
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
            self.cards[chosenIndex].isFaceUp = true
        }
    }
    
    init(numOfPairsOfCards:Int , cardContentFactory : (Int) -> CardContent){
        cards = Array<Card>()
        for pairIndex in 0..<numOfPairsOfCards{
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id : 2*pairIndex))
            cards.append(Card(content: content, id : 2*pairIndex+1))
        }
        cards.shuffle()
    }

    struct Card: Identifiable{
        var isFaceUp : Bool = false
        var content : CardContent
        var isMatched : Bool = false
        var id : Int
    }

}
