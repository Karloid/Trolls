//
// Created by fox on 1/2/18.
// Copyright (c) 2018 krld. All rights reserved.
//

import Foundation

class GameEnd: MyUnit {
    override init(_ x: Int, _ y: Int) {
        super.init(x, y)
    }

    override func getSymbol() -> String {
        return "X"
    }
}
