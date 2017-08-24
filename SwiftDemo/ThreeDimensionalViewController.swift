//
//  ThreeDimensionalViewController.swift
//  SwiftDemo
//
//  Created by Ju Liaoyuan on 2017/8/23.
//  Copyright © 2017年 Fangzhiwei Information Technology Co., Ltd. All rights reserved.
//

import UIKit
import SafariServices

class ThreeDimensionalViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIViewControllerPreviewingDelegate {
    
    var tableView: UITableView!
    let cellID = "cellID"
    

    override func viewDidLoad() {
        super.viewDidLoad()
        createView()
//        defaultConfig()
    }
    
    override func createView() {
        self.navigationItem.title = "3D Touch"
        
        tableView = UITableView.init(frame: self.view.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 50
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        self.view.addSubview(tableView)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        cell.textLabel?.text = "\(indexPath)"
        _ = self.registerForPreviewing(with: self, sourceView: cell);
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        print("peekkkkkkk")
        // get cell
        let indexPath = tableView.indexPath(for: previewingContext.sourceView as! UITableViewCell)
        
        if indexPath?.row == 0 {
            // open view controller
            let v = previewingContext.sourceView
            previewingContext.sourceRect = CGRect(origin: CGPoint(x: v.frame.origin.x - v.bounds.width/2,
                                                                  y: v.frame.origin.y - v.bounds.height/2),
                                                  size: CGSize(width: v.bounds.width,
                                                               height: v.bounds.height))
            let peeker = PeekViewController()
//            peeker.preferredContentSize = CGSize(width: 30, height: 30)
            
            return peeker
        } else {
            // open web view
            return SFSafariViewController.init(url: NSURL(string:"https://github.com/Stu-JuLiaoY")! as URL)
        }
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        print("poooooooop")
        viewControllerToCommit.preferredContentSize = CGSize(width: 300, height: 300)
        self.show(viewControllerToCommit, sender: self)
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
