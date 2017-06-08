//
//  TabbarController.swift
//  Swift_Enumerate
//
//  Created by JM Zhao on 2017/6/8.
//  Copyright © 2017年 奕甲智能 Oneplus Smartware. All rights reserved.
//

import UIKit

class TabbarController: UITabBarController {

    let firstVC:ViewController = ViewController()
    let secVC:SecViewController = SecViewController()
    let thirdVC:ThirdViewController = ThirdViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupChildViewController()
        self.view.backgroundColor = UIColor.white
    }

    func setupChildViewController() {
        
        setupChildViewController(controller: firstVC, image: UIImage.init(named: "tabbar_mainframe")!, selecImage: UIImage.init(named: "tabbar_mainframeHL")!, title: "frist", tag: 0)
        
        setupChildViewController(controller: secVC, image: UIImage.init(named: "tabbar_contacts")!, selecImage: UIImage.init(named: "tabbar_contactsHL")!, title: "sec", tag: 0)
        
        setupChildViewController(controller: thirdVC, image: UIImage.init(named: "tabbar_discover")!, selecImage: UIImage.init(named: "tabbar_discoverHL")!, title: "third", tag: 0)
    }
    
    
    func setupChildViewController(controller:UIViewController, image:UIImage, selecImage:UIImage, title:String, tag:Int) {
        
        controller.title = title
        controller.tabBarItem.tag = tag
        controller.tabBarItem.selectedImage = selecImage
        controller.tabBarItem.image = image
        let navi = NavigationController(rootViewController: controller)
        self.addChildViewController(navi)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
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
