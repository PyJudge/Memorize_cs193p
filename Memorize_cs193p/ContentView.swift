//
//  ContentView.swift
//  Memorize
//
//  Created by LatteFairy on 2020/05/22.
//  Copyright © 2020 Seoul High Court. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var viewModel : EmojiMemoryGame
    
    var body: some View {
        // TASK 5 
        let font : Font
        if (viewModel.cards.count == 10){
            font = Font.subheadline
        }else{
            font = Font.largeTitle
        }

        return HStack{
            ForEach(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    self.viewModel.choose(card: card)
        	        }
            }
        }
            .padding()
            .foregroundColor(Color.orange)
//            .font(Font.largeTitle) //Original Code
            .font(font)
    }
}

struct CardView: View{
    var card : MemoryGame<String>.Card
    
    var body : some View{
        ZStack{
            if card.isFaceUp{
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                Text(card.content)
            }else{
                RoundedRectangle(cornerRadius: 10.0).fill(Color.orange)
            }
        }.aspectRatio(2/3, contentMode: .fit) // TASK 3
    }
}






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGame())
        
    }
}
