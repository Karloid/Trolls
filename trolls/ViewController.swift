//
//  ViewController.swift
//  trolls
//
//  Created by fox on 1/2/18.
//  Copyright © 2018 krld. All rights reserved.
//

import UIKit


class MainViewController: UIViewController {

    private var f: GameView? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        view.backgroundColor = UIColor.green
        f = GameView(frame: view.frame, game: Game());
        view.addSubview(f!)
        f!.setNeedsDisplay()

        /*let b = UIButton(frame: CGRect(x: view.frame.width / 2, y: view.frame.height / 2, width: 100, height: 56))
        b.setTitle("Test", for: UIControlState.normal)
        b.backgroundColor = UIColor.red
        b.addTarget(self, action: #selector(onButtonClick), for: UIControlEvents.touchUpInside)
        view.addSubview(b)*/

        
        UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
    }

    override var shouldAutorotate: Bool {
        return false
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }

    func onButtonClick() {
        view.setNeedsDisplay()
        NSLog("onButtonClick")
        f!.setNeedsDisplay()
    }
}
