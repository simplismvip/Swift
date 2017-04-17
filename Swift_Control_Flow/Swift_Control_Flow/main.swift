//
//  main.swift
//  Swift_Control_Flow
//
//  Created by JM Zhao on 2017/4/17.
//  Copyright © 2017年 JunMing. All rights reserved.
//

import Foundation

// for-in 循环
let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {

    print("hellow \(name)!")
}

let numberOflegs = ["spider":8, "ant":6, "cat":4]
for (name, legCount) in numberOflegs {

    print("\(name)s have \(legCount) legs")
}

for index in 1...5 {

    print("\(index) time 5 is \(index * 5)")
}

for index in 1..<5 {

    print("\(index) time 5 is \(index * 5)")
}

