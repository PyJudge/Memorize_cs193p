//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by LatteFairy on 2020/05/22.
//  Copyright © 2020 Seoul High Court. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel : EmojiMemoryGame
    
    var body: some View {
        VStack{
            Grid(viewModel.cards){ card in
                CardView(card: card).onTapGesture {
                    withAnimation(.linear(duration: 0.75)) {
                        self.viewModel.choose(card:card)
                    }
                    //self.viewModel.choose(card: card)
                }
                    .padding(5)
            }
                .padding()
                .foregroundColor(Color.orange)
            Button(action: {
                withAnimation(.easeInOut) {
                    self.viewModel.resetGame()
                }
            }, label: {
                Text("New Game")
            })
        }
    }
}

struct CardView: View{
    var card : MemoryGame<String>.Card
    
    var body : some View{
        GeometryReader { geometry in
            self.body(for: geometry.size) //geometry.size ~ CGSize (which has width and height in it)
        }
    }
    
    @ViewBuilder
    private func body(for size: CGSize) -> some View  {
        if card.isFaceUp || !card.isMatched{
            ZStack{
                Pie(startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: 110-90), clockwise: true).padding().opacity(0.40)
                Text(self.card.content)
                    .font(Font.system(size: fontSize(for: size))) //Original Code]
                    .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
                    .animation(card.isMatched ? Animation.linear(duration: 1).repeatForever(autoreverses: false) : Animation.default)
            }
            .cardify(isFaceUp: card.isFaceUp)
            .transition(AnyTransition.scale)
        }

    }
    
    // MARK: -- Drawing Constants
    func fontSize(for size : CGSize) -> CGFloat{
        min(size.width, size.height) * 0.7
    }

}






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(card: game.cards[2])
        return EmojiMemoryGameView(viewModel: game)
        
    }
}
