//
//  Grid.swift
//  Memorize_cs193p
//
//  Created by Won Myeong Kwon on 2020/07/10.
//  Copyright © 2020 Seoul High Court. All rights reserved.
//

import SwiftUI

struct Grid <Item,ItemView> : View where Item: Identifiable, ItemView: View{
    var items : [Item]
    var viewForItem: (Item) -> ItemView // function as type
    
    init(_ items : [Item], viewForItem : @escaping (Item) -> ItemView) {
        self.items = items
        self.viewForItem  = viewForItem
    }
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: GridLayout(itemCount: self.items.count, in: geometry.size))
        }
    }
    
    func body(for layout: GridLayout) -> some View {
        ForEach(self.items){ item in
            self.body(for: item, in: layout)
        }
    }
    
    func body(for item: Item, in layout: GridLayout) -> some View {
        let index = items.firstIndex(matching: item)
        return Group { // when if clause is not satisfied, still needs to return some View, so wrap the if clause with Group(as a viewBuilder)
            if index != nil { // To safely force-unwrap index ,
                viewForItem(item)
                    .frame(width: layout.itemSize.width, height: layout.itemSize.height)
                    .position(layout.location(ofItemAt: index!)) // force-unwrap!
            }
        }
    }
}


