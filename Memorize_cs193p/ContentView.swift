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
        HStack{
            ForEach(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    self.viewModel.choose(card: card)
                }
            Divider()
            }
        }
            .padding()
            .foregroundColor(Color.orange)

    }
}

struct CardView: View{
    var card : MemoryGame<String>.Card
    
    var body : some View{
        GeometryReader { geometry in
            self.body(for: geometry.size) //geometry.size ~ CGSize (which has width and height in it)
        }
    }
    
    func body(for size: CGSize) -> some View  {
        ZStack{
            if self.card.isFaceUp{
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                Text(self.card.content)
            }else{
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.orange)
            }
        }
            .font(Font.system(size: fontSize(for: size))) //Original Code

    }
    
    // MARK: -- Drawing Constants
    
    let cornerRadius : CGFloat = 10.0 // Should be CGFloat, not int or double, to use inside Rounded Rectangle
    let edgeLineWidth : CGFloat = 3
    func fontSize(for size : CGSize) -> CGFloat{
        min(size.width, size.height) * 0.75
    }
}






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGame())
        
    }
}
