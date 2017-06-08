//
//  NavigationController.swift
//  Swift_Enumerate
//
//  Created by JM Zhao on 2017/6/8.
//  Copyright © 2017年 奕甲智能 Oneplus Smartware. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let navBar = UINavigationBar()
        navBar.tintColor = UIColor.white
        let attribute = [NSForegroundColorAttributeName:UIColor.gray, NSFontAttributeName: UIFont.systemFont(ofSize: 20)]
        navBar.titleTextAttributes = attribute
        self.setValue(navBar, forKey: "navigationBar")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
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
