//
//  ViewController.swift
//  touch_event
//
//  Created by Kiyoshi Ohashi on 2022/11/05.
//

import UIKit

class ViewController: UIViewController {
    
    var imageNameArray: [String] = ["hana", "hoshi", "onpu", "shitumon"]
    
    var imageIndex: Int = 0
    
    @IBOutlet var haikeiImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func selectedFirst() {
        imageIndex = 1
    }
    
    @IBAction func selectedSecond() {
        imageIndex = 2
    }
    
    @IBAction func selectedThird() {
        imageIndex = 3
    }

    @IBAction func selectedFourth() {
        imageIndex = 4
    }
    
    @IBAction func selectedDrug() {
        imageIndex = 5
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // imageIndexの中身が0でも5でもない時に実行されます
        if imageIndex != 0 && imageIndex != 5 {
            // touchEventを使うための設定を、定数touchに代入しています
            let touch: UITouch = touches.first!
            // タッチした画面の位置を取得して、定数locationに代入しています
            let location: CGPoint = touch.location(in: self.view)
            // UIImageViewのインスタンスを作成します。名前はaddImageViewです
            let addImageView = UIImageView()
            // addImageViewの大きさに関わるframeプロパティを設定します
            addImageView.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
            // 定数imageに、画像の情報を入れています。何故 imadeIndex - 1 をしているのか、考えてみましょう
            let image: UIImage = UIImage(named: imageNameArray[imageIndex - 1])!
            // addImageViewの画像に関するimageプロパティに、定数imageを設定します
            addImageView.image = image
            // addImageViewをタップした時に反応してくれるように、isUserInteractionEnabledプロパティをtrueにします
            addImageView.isUserInteractionEnabled = true
            // addImageViewを画面のどこに配置するのかを設定します
            addImageView.center = CGPoint(x: location.x, y: location.y)
            // 親ビューの中に子ビューを設定します（気になったら、また詳しく説明します）
            self.view.addSubview(addImageView)
        }
    }
    
    override open func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first,
              let moveImageView = touch.view as? UIImageView else {
            return
        }
        let destLocation = touch.location(in: view)
        let prevLocation = touch.previousLocation(in: view)
        let deltaX = destLocation.x - prevLocation.x
        let deltaY = destLocation.y - prevLocation.y
        moveImageView.frame.origin.x += deltaX
        moveImageView.frame.origin.y += deltaY
    }
    
    /*
    @IBAction func back() {
        self.imageView.removeFromSuperview()
    }
    */

}

