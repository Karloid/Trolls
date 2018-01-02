//
// Created by fox on 1/2/18.
// Copyright (c) 2018 krld. All rights reserved.
//

import Foundation

class Player: MyUnit {
    private var dir = Direction.UP

    override init(_ x: Int, _ y: Int) {
        super.init(x, y)
    }

    override func getSymbol() -> String {
        switch (dir) {
        case .UP:
            return "^"
        case .DOWN:
            return "V"
        case .LEFT:
            return "<"
        case .RIGHT:
            return ">"
        }
        return "@"
    }
}
