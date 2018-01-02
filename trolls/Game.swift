//
// Created by fox on 1/2/18.
// Copyright (c) 2018 krld. All rights reserved.
//

import Foundation

class Game {

    public static let MAP_FREE: Int = 0
    public static let MAP_WALL: Int = 1

    private var width = 0

    private var height = 0
    private var map: [[Int]] = []
    private var map: [[Int]] = []

    func myInit(_ width: Int, _ height: Int) {
        self.width = width;
        self.height = height;

        mapInit()

        
    }

    private func mapInit() {
        map = Array(repeating: Array(repeating: 0, count: height), count: width)

        //TODO generate world
        for var x in 0..<width {
            for var y in 0..<height {
                if (x == 0 || y == 0 || x == width - 1 || y == height - 1) {
                    map[x][y] = Game.MAP_WALL
                } else {
                    map[x][y] = Game.MAP_FREE
                }
            }
        }
    }

    func getMap() -> [[Int]] {
        return map
    }
}
