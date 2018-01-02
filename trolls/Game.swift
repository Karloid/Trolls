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
    private var units: [MyUnit] = []

    private var player = Player(0, 0)
    private var gameEnd = GameEnd(0, 0)

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

        let r = Int(arc4random_uniform(4))
        if (r == 0) {
            player.x = 1;
            player.y = 1;
        } else if (r == 1) {
            player.x = width - 2;
            player.y = 1;
        } else if (r == 2) {
            player.x = width - 2;
            player.y = height - 2;
        } else if (r == 3) {
            player.x = 1;
            player.y = height - 2;
        }

        units.append(player)
        units.append(gameEnd)
    }

    func getMap() -> [[Int]] {
        return map
    }

    func clickOn(_ x: Int, _ y: Int) {
        NSLog("Click on %d %d", x, y)
        if (x < 0 || x >= map.count || y < 0 || y >= map[0].count) {
            NSLog("Ignored")
            return
        }

        units = units.filter {!($0 is ClickPlace)}
        
        units.append(ClickPlace(x, y))
    }

    func getUnits() -> [MyUnit] {
        return units
    }
}
