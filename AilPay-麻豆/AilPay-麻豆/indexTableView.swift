//
//  indexTableView.swift
//  AilPay-麻豆
//
//  Created by JM Zhao on 2017/5/22.
//  Copyright © 2017年 JunMing. All rights reserved.
//

import UIKit

class indexTableView: UITableView, UITableViewDelegate, UITableViewDataSource {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var numberRows:Int = 50
    var changeContentSize:((_ contentSize:CGSize) -> ())?
    
    override init(frame: CGRect, style: UITableViewStyle) {
        
        super.init(frame: frame, style: style)
        self.delegate = self;
        self.dataSource = self;
        self.rowHeight = (1000 - 140) / 20
        self.contentInset = UIEdgeInsets(top: 0, left: 0, bottom:0, right: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadMoreData() {
        
        self.numberRows += 10
        self.reloadData()
        self.changeContentSize?(self.contentSize)
    }
    
    func setScrollViewContentOffSet(point: CGPoint) {
        
        self.contentOffset = point
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") {
            
            cell.textLabel?.text = "\(indexPath.row) - reusablecell"
            return cell
            
        }else {
        
            let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
            cell.textLabel?.text = "\(indexPath.row) - reusablecell"
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return numberRows
    }
    
    
    
    
    
    
    
    
    
    
    
    

}
