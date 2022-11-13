//
//  dragViewController.swift
//  touch_event
//
//  Created by Kiyoshi Ohashi on 2022/11/05.
//

import UIKit

class dragViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.isUserInteractionEnabled = true
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        print(type(of: touch.view))
        
        if touch.view == imageView {
            // 指の移動先の座標
            let destLocation = touch.location(in: self.view)
            // 指の移動前の座標
            let prevLocation = touch.previousLocation(in: self.view)
            // 取得した座標を格納する変数
            var myFrame = imageView.frame
            
            let deltaX = destLocation.x - prevLocation.x
            let deltaY = destLocation.y - prevLocation.y
            
            myFrame.origin.x += deltaX
            myFrame.origin.y += deltaY
            
            imageView.frame = myFrame
        }
    }
    
}
