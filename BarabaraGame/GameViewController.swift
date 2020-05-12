//
//  GameViewController.swift
//  BarabaraGame
//
//  Created by 森田貴帆 on 2020/05/12.
//  Copyright © 2020 森田貴帆. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet var imageview1: UIImageView!//上
    @IBOutlet var imageview2: UIImageView!//中
    @IBOutlet var imageview3: UIImageView!//下
    @IBOutlet var resultLabel: UILabel!
    var timer: Timer!
    var score: Int = 1000
    let defaults: UserDefaults = UserDefaults.standard //スコア保存のための変数。アプリ閉じても保存可能。keyでアプリ内のどこからでも呼び出し可能
    let width: CGFloat = UIScreen.main.bounds.size.width //画面はば。iphneの画面サイズ取得
    var positionX: [CGFloat] = [0.0, 0.0, 0.0]//画像位置の配列。CGFloatは少数の配列
    var dx:[CGFloat] = [1.0, 0.5, -1.0]//画像の動かす幅の配列
    
    func start(){
        resultLabel.isHidden = true
        timer = Timer.scheduledTimer(timeInterval: 0.005, target: self, selector: #selector(self.up), userInfo: nil, repeats: true)
        timer.fire()
    }
    
    @objc func up(){
        for i in 0..<3 {
            //端にきたら動かす向きを逆にする
            if positionX[i] > width || positionX[i] < 0{
                dx[i] = dx[i] * (-1)
            }
            positionX[i] += dx[i]//画像の位置をdx分ずらす
        }
        imageview1.center.x = positionX[0]//上の画像をずらした位置に移動させる
        imageview2.center.x = positionX[1]//真ん中の画像を〜
        imageview3.center.x = positionX[2]
            
    }
    
    //ストップボタンを押す
    @IBAction func stop(){
        if timer.isValid == true{
            timer.invalidate()
        }
        
        for i in 0..<3 {
                 score = score - abs(Int(width/2 - positionX[i])) * 2//スコアの計算
              }
                  
              resultLabel.text = "Score：" + String(score)
              resultLabel.isHidden = false
    }
    
    @IBAction func retry(){
        score = 1000
        positionX = [width/2,width/2,width/2]
        if timer.isValid == false{
            self.start()
        }
    }
    
    @IBAction func toTop(){
        self.dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        positionX = [width/2,width/2,width/2]//画像位置を画面の中心に
        self.start()//前ページで書いたstartを呼び出す
        // Do any additional setup after loading the view.
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
