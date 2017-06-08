//
//  SecViewController.swift
//  Swift_Enumerate
//
//  Created by JM Zhao on 2017/6/8.
//  Copyright © 2017年 奕甲智能 Oneplus Smartware. All rights reserved.
//

import UIKit

class SecViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let label = UILabel(frame: CGRect(x: 100.0, y: 100.0, width: 100.0, height: 50.0))
        label.text = "第\(0)个"
        label.textColor = UIColor.red
        self.view.addSubview(label)
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 64, height: 64))
        button.setTitle("Sec", for: UIControlState.normal)
        button.center = self.view.center
        button.addTarget(self, action: #selector(pushNext(sender:)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(button)
    }

    func pushNext(sender:UIButton) {
        
        let fourVC = FourViewController()
        fourVC.title = self.title
        self.navigationController?.pushViewController(fourVC, animated: true)
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
