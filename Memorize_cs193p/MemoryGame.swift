//
//  MemoryGame.swift
//  Memorize_cs193p
//
//  Created by LatteFairy on 2020/05/24.
//  Copyright © 2020 Seoul High Court. All rights reserved.
//

// Building a MODEL

import Foundation

struct MemoryGame<CardContent> {
    
    var cards : Array <Card>

    func choose(card : Card){
        print(" chosen card \(card)")
                
//        card.isFaceUp = !card.isFaceUp
    }
    
    init(numOfPairsOfCards:Int , cardContentFactory : (Int) -> CardContent){
        cards = Array<Card>()
        for pairIndex in 0..<numOfPairsOfCards{
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id : 2*pairIndex))
            cards.append(Card(content: content, id : 2*pairIndex+1))

        }
        cards.shuffle() // TASK 2
    }

    struct Card: Identifiable{
        var isFaceUp : Bool = true
        var content : CardContent
        var isMatched : Bool = false
        var id : Int
    }

}
