//
//  ViewController.swift
//  SwiftDemo
//
//  Created by Ju Liaoyuan on 2017/8/22.
//  Copyright © 2017年 Fangzhiwei Information Technology Co., Ltd. All rights reserved.
//

import UIKit

struct LYHomeModel {
    var title: String?
    var viewController: AnyClass
}

extension UIViewController {
    func createView() {}
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var tableView: UITableView!
    
    let cellID = "cellID"
    let cellHeight: CGFloat = 50.0
    let dataSource = [LYHomeModel(title:"Watch", viewController:CounterViewController.self),
                      LYHomeModel(title:"Location", viewController: LocationViewController.self),
                      LYHomeModel(title:"3D Touch", viewController:ThreeDimensionalViewController.self)]

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createView()
        let icon = UIApplicationShortcutIcon(templateImageName: "image")
        let item = UIApplicationShortcutItem(type: "type", localizedTitle: "3D Press", localizedSubtitle: "test", icon: icon, userInfo: nil)
        UIApplication.shared.shortcutItems?.append(item)
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func createView() {
        self.tableView = UITableView.init(frame: self.view.bounds, style: UITableViewStyle.plain)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        self.view.addSubview(self.tableView)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: cellID)
        tableViewCell.textLabel?.text = self.dataSource[indexPath.row].title ?? "cell"
        return tableViewCell
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let vcClass: UIViewController.Type = self.dataSource[indexPath.row].viewController as! UIViewController.Type
        let vc = vcClass.init()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

