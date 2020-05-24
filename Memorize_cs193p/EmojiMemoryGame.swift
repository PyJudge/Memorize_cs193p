//
//  EmojiMemoryGame.swift
//  Memorize_cs193p
//
//  Created by LatteFairy on 2020/05/24.
//  Copyright © 2020 Seoul High Court. All rights reserved.
//
// Making a VM df

import Foundation

class EmojiMemoryGame{
    private var model : MemoryGame<String> = createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String>{
        let emojis   = ["👻", "🎃", "🥰", "🥶", "🕶"]
        let numOfPairsOfCards :Int = 5;//	 Int.random(in: 2..<5) // TASK 4

        return MemoryGame<String>(numOfPairsOfCards: numOfPairsOfCards){ //TASK4
            pairIndex in emojis[pairIndex]
        }
    }
    
    // MARK: -- Access to the Model
    var cards : Array<MemoryGame<String>.Card> {
        model.cards
    }
    // MARK: -- Intent(s)
    
    func choose(card:MemoryGame<String>.Card){
        model.choose(card: card)
    }
    
    
    
}
