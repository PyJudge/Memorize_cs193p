//
//  Array+only.swift
//  Memorize_cs193p
//
//  Created by Won Myeong Kwon on 2020/07/11.
//  Copyright © 2020 Seoul High Court. All rights reserved.
//

import Foundation

extension Array {
    var only : Element? {
        count == 1 ? first : nil
    }
}
