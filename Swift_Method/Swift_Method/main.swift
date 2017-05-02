//
//  main.swift
//  Swift_Method
//
//  Created by JM Zhao on 2017/4/24.
//  Copyright © 2017年 JunMing. All rights reserved.
//

import Foundation

// 方法是关联了特定类型的函数. 类, 结构体, 枚举都能定义实例/类型方法.
// 实例方法
class Counter {

    var count = 0
    
    func increment() {
        count += 1
        print(self.count)
    }
    
    func increment(by amount: Int) {
        
        count += amount
        print(self.count)
    }
    
    func reset() {
        
        count = 0
        print(self.count)
    }
}

let counter = Counter()
counter.increment()
counter.increment(by: 20)
counter.reset()

// self 属性: 每个类的实例都隐含self 属性
struct Point {

    var x = 0.0, y = 0.0
    
    func isToRightOf(x: Double) -> Bool {
    
        return self.x > x
    }
}

let somepoint = Point(x: 9.9, y: 3.5)
if somepoint.isToRightOf(x: 1.0) {

    print("This point is to the right of the where x == 1,0")
}

// 在实例方法中修改值类型
// 枚举和结构体是值类型, 默认情况下, 值类型不能被自身实例方法修改, 如果想要修改想要修改, 可以选择将这个方法变异
// 然后就可以在这个方法中修改他的属性了, 并且任何修改都会写入结构体








































































