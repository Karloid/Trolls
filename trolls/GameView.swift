//
// Created by fox on 1/2/18.
// Copyright (c) 2018 krld. All rights reserved.
//

import Foundation
import UIKit

class GameView: UIView {


    private var textFont: UIFont? = nil

    private var textFontAttributes: [String: Any]? = nil

    override init(frame: CGRect) {
        let f = CGRect(x: frame.origin.x, y: frame.origin.y, width: frame.size.width, height: frame.size.height - 200);
        super.init(frame: f)

        myInit();
    }

    private func myInit() {
        textFont = UIFont(name: "Menlo-Regular", size: 16)!;
        textFontAttributes = [
            NSFontAttributeName: textFont as Any,
            NSForegroundColorAttributeName: UIColor.black,
        ]


        backgroundColor = UIColor.white


    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        myInit();
    }

    override func draw(_ rect: CGRect) {
        /* let h = rect.height
         let w = rect.width
         let color: UIColor = UIColor.yellow

         let drect = CGRect(x: (w * 0.25), y: (h * 0.25), width: (w * 0.5), height: (h * 0.5))
         let bpath: UIBezierPath = UIBezierPath(rect: drect)

         color.set()
         bpath.stroke()
 */


        "Hello World again Hello World again ".draw(in: rect.insetBy(dx: 16, dy: 16), withAttributes: textFontAttributes)


        NSLog("drawRect has updated the view")
    }


    override func setNeedsDisplay() {
        super.setNeedsDisplay(frame)
    }
}
