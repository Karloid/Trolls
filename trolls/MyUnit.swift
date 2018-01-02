//
// Created by fox on 1/2/18.
// Copyright (c) 2018 krld. All rights reserved.
//

import Foundation

class MyUnit {
    public var x = 0
    public var y = 0

    init(_ x: Int, _ y: Int) {

        self.x = x;
        self.y = y;
    }

    func getSymbol() -> String {
        return "?"
    }
}
