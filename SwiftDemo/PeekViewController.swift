//
//  PeekViewController.swift
//  SwiftDemo
//
//  Created by Ju Liaoyuan on 2017/8/23.
//  Copyright © 2017年 Fangzhiwei Information Technology Co., Ltd. All rights reserved.
//

import UIKit

class PeekViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageView = UIImageView.init(image: #imageLiteral(resourceName: "image.jpeg"))
        imageView.frame = CGRect(x: (self.view.bounds.width - 300) / 2, y: (self.view.bounds.height - 300) / 2, width: 300, height: 300)
        self.view.addSubview(imageView)

        // Do any additional setup after loading the view.
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
