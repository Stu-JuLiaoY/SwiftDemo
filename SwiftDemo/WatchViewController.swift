//
//  WatchViewController.swift
//  SwiftDemo
//
//  Created by Ju Liaoyuan on 2017/8/22.
//  Copyright © 2017年 Fangzhiwei Information Technology Co., Ltd. All rights reserved.
//

import UIKit

class WatchViewController: UIViewController {
    
    var tapBtn: UIButton!
    var countLabel: UILabel!
    var count = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        createView()
        // Do any additional setup after loading the view.
    }
    
    func createView() {
        self.tapBtn = UIButton(type:.custom)
        self.tapBtn.frame = CGRect(x: (self.view.bounds.width - 200) / 2, y: (self.view.bounds.height - 100), width: 200, height: 40)
        self.tapBtn.titleLabel?.text = "Tap"
        self.tapBtn.titleLabel?.textColor = .black
        self.tapBtn.addTarget(self, action: #selector(counter), for: .touchUpInside)
        self.view.addSubview(self.tapBtn)
        
        self.countLabel = UILabel.init(frame: CGRect(x: 0, y: 70, width: self.view.bounds.width, height: 100))
        self.countLabel.text = String(self.count)
        self.countLabel.textColor = .red
        self.view.addSubview(self.countLabel)
    }
    
    func counter() {
        self.count += 1
        self.countLabel.text = String(self.count)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
