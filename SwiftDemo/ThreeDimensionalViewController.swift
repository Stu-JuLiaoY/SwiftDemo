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
    
    override func registerForPreviewing(with delegate: UIViewControllerPreviewingDelegate, sourceView: UIView) -> UIViewControllerPreviewing {
        let cell = sourceView as! UITableViewCell
        let indexPath = tableView.indexPath(for: cell)
        if indexPath?.row == 0 {
            return PeekViewController() as! UIViewControllerPreviewing
        } else {
            return SFSafariViewController.init(url: NSURL(string:"https://github.com")! as URL) as! UIViewControllerPreviewing
        }
        
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
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
