//
// Created by fox on 1/2/18.
// Copyright (c) 2018 krld. All rights reserved.
//

import Foundation
import UIKit

class GameView: UIView {


    private var textFont: UIFont? = nil

    private var textFontAttributes: [String: Any]? = nil

    private var worldWidth: NSInteger = 0
    private var worldHeight: NSInteger = 0

    private var actualArea: CGRect = CGRect()

    override init(frame: CGRect) {
        super.init(frame: frame)

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

        worldWidth = (NSInteger)(actualArea.width / size.width);
        worldHeight = (NSInteger)(actualArea.height / size.height);

        backgroundColor = UIColor.white


    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        myInit();
    }

    override func draw(_ rect: CGRect) {

        var str = ""


        var row: NSInteger = 0
        while (row < worldHeight) {
            var col: NSInteger = 0
            while (col < worldWidth) {
                str = str + "#"
                col = col + 1
            }
            row = row + 1
        }


        str.draw(in: actualArea, withAttributes: textFontAttributes)
    }


    override func setNeedsDisplay() {
        super.setNeedsDisplay(frame)
    }
}
