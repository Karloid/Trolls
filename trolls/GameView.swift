//
// Created by fox on 1/2/18.
// Copyright (c) 2018 krld. All rights reserved.
//

import Foundation
import UIKit

class GameView: UIView {


    private var textFont: UIFont? = nil

    private var textFontAttributes: [String: Any]? = nil

    private var actualArea: CGRect = CGRect()

    private var game: Game? = nil

    private var cellSize: CGSize = CGSize()

    override init(frame: CGRect) {
        super.init(frame: frame)

        myInit();
    }

    init(frame: CGRect, game: Game) {
        super.init(frame: frame)
        self.game = game;
        myInit();
    }

    private func myInit() {
        textFont = UIFont(name: "Menlo-Regular", size: 16)!;
        textFontAttributes = [
            NSFontAttributeName: textFont as Any,
            NSForegroundColorAttributeName: UIColor.black,
        ]

        cellSize = "#".size(attributes: textFontAttributes)
        actualArea = frame.offsetBy(dx: 3, dy: 12).insetBy(dx: 16, dy: 16)

        let worldWidth = (NSInteger)(actualArea.width / cellSize.width) - 2;
        let worldHeight = (NSInteger)(actualArea.height / cellSize.height);

        backgroundColor = UIColor.white

        game!.myInit(worldWidth, worldHeight)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        myInit();
    }

    override func draw(_ rect: CGRect) {

        var str = ""


        var map = game!.getMap()

        var units = game!.getUnits();

        let worldWidth = map.count
        let worldHeight = map[0].count
        var y: Int = 0
        while (y < worldHeight) {
            var x: Int = 0
            while (x < worldWidth) {

                var uToDraw: MyUnit? = nil
                var i = 0
                for u in units {
                    if (u.x == x && u.y == y) {
                        uToDraw = u
                        units.remove(at: i)
                        break
                    }
                    i += 1
                }
                var s = "#"
                if (uToDraw != nil) {
                    s = uToDraw!.getSymbol()
                } else {
                    if (map[x][y] == Game.MAP_FREE) {
                        s = " ";
                    }
                }

                str = str + s
                x = x + 1
            }
            y = y + 1
            if (y < worldHeight) {
                str = str + "\n"
            }
        }

        str.draw(at: actualArea.origin, withAttributes: textFontAttributes)
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {

        for item in touches {
            //game.clickOn(event)
            var loc = item.location(in: self)

            if (actualArea.contains(loc)) {
                loc = CGPoint(x: loc.x - actualArea.origin.x, y: loc.y - actualArea.origin.y)

                game!.clickOn((Int)(loc.x / cellSize.width), (Int)(loc.y / cellSize.height))
                setNeedsDisplay()
            }
            return
        }
    }

    override func setNeedsDisplay() {
        super.setNeedsDisplay(frame)
    }
}
