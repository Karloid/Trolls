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

        let size: CGSize = "#".size(attributes: textFontAttributes)
        actualArea = frame.offsetBy(dx: 3, dy: 12).insetBy(dx: 16, dy: 16)

        let worldWidth = (NSInteger)(actualArea.width / size.width) - 2;
        let worldHeight = (NSInteger)(actualArea.height / size.height);

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

        let worldWidth = map.count
        let worldHeight = map[0].count
        var y: Int = 0
        while (y < worldHeight) {
            var x: Int = 0
            while (x < worldWidth) {

                var s = "#"
                if (map[x][y] == Game.MAP_FREE) {
                    s = " ";
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


    override func setNeedsDisplay() {
        super.setNeedsDisplay(frame)
    }
}
