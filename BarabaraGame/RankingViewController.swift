//
//  RankingViewController.swift
//  BarabaraGame
//
//  Created by 森田貴帆 on 2020/05/12.
//  Copyright © 2020 森田貴帆. All rights reserved.
//

import UIKit

class RankingViewController: UIViewController {
    
    @IBOutlet var rankingLabel1: UILabel!
    @IBOutlet var rankingLabel2: UILabel!
    @IBOutlet var rankingLabel3: UILabel!
    
     let defaults: UserDefaults = UserDefaults.standard
    
    @IBAction func toTop(){
          self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()//これいるの？何を意味するかわからん
        
        rankingLabel1.text =  "1位　　" + String(defaults.integer(forKey: "score1"))
        rankingLabel2.text =  "2位　　" + String(defaults.integer(forKey: "score2"))
        rankingLabel3.text =  "3位　　" + String(defaults.integer(forKey: "score3"))


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
