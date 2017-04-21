//
//  main.swift
//  Swift_Properties
//
//  Created by JM Zhao on 2017/4/21.
//  Copyright © 2017年 JunMing. All rights reserved.
//

import Foundation

// 属性
/*
 属性将值与特定类, 结构, 枚举关联. 存储的实现将常量和变量值存储为实例的一部分, 给属性赋值则有类, 结构和枚举提供
 存储和计算属性通常与特定类型的实例相关, 然而属性可以与类型本身关联, 这些属性被称为类型的属性
 此外, 还可以定义属性观察器俩见识属性值的改变, 可以使用自定义操作. 属性观察器可以添加到自定义的存储属性, 也可以添加到子类从其超类中继承
 
 */

// 存储属性
// 在其最简单的形式中，存储的属性是作为特定类或结构的实例的一部分存储的常量或变量。存储的属性可以是变量存储的属性（由var关键字引入）或常量存储的属性（由let关键字引入）。
struct FixedLengthRange {

    var firstValue:Int
    let length:Int
}

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)




























