//
//  Array+Identifiable.swift
//  Memorize_cs193p
//
//  Created by Won Myeong Kwon on 2020/07/11.
//  Copyright © 2020 Seoul High Court. All rights reserved.
//

import Foundation

extension Array where Element: Identifiable{
    func firstIndex(matching: Element) -> Int? { // name "index" to "firstIndex", "of Item" to "matching"
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        return nil // not found! 
        
    }
}
