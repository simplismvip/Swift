//
//  ViewController.swift
//  Swift_Enumerate
//
//  Created by JM Zhao on 2017/6/8.
//  Copyright © 2017年 奕甲智能 Oneplus Smartware. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var tableView:UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = UIButton.init(type: UIButtonType.system)
        button.setTitle("第一个", for: UIControlState.normal)
        button.addTarget(self, action: #selector(pushNext(sender:)), for: UIControlEvents.touchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: 64, height: 64)
        button.center = self.view.center
        self.view.addSubview(button)
        
    }

    func creatTableView() {
        
        self.tableView = UITableView(frame: self.view.bounds, style: UITableViewStyle.plain)
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        self.view.addSubview(self.tableView!)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
    }
    
    func pushNext(sender:UIButton) {
        
        let fourVC = FourViewController()
        self.navigationController?.pushViewController(fourVC, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

