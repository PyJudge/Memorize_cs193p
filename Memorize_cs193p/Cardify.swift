//
//  Cardify.swift
//  Memorize_cs193p
//
//  Created by Won Myeong Kwon on 2020/07/13.
//  Copyright © 2020 Seoul High Court. All rights reserved.
//

import SwiftUI

struct Cardify: AnimatableModifier{

    var rotation : Double
    var isFaceUp: Bool {
        rotation < 90
    }

    var animatableData: Double {
        get{ rotation }
        set{rotation = newValue}
    }

    init(isFaceUp: Bool) {
        rotation = isFaceUp ? 0 : 180
    }

    func body(content: Content) -> some View {
        ZStack{
            Group{
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                content
            }.opacity(isFaceUp ? 1 : 0)
            
            RoundedRectangle(cornerRadius: cornerRadius).fill(Color.orange)
                .opacity(isFaceUp ? 0 : 1)
        }
        .rotation3DEffect(Angle.degrees(rotation), axis: (0, 1, 0))
    }
    
    private let cornerRadius : CGFloat = 10.0 // Should be CGFloat, not int or double, to use inside Rounded Rectangle
    private let edgeLineWidth : CGFloat = 3
}

extension View {
    func cardify(isFaceUp : Bool) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
