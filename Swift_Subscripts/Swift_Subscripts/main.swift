//
//  main.swift
//  Swift_Subscripts
//
//  Created by JM Zhao on 2017/5/3.
//  Copyright © 2017年 JunMing. All rights reserved.
//

import Foundation

// 类, 结构体, 和枚举可以定义下标, 他可以作为访问集合, 列表或者序列成员元素的快捷方式, 可以使用下标通过索引值来设置或者检索值而不需要为设置和检索分贝使用实例方法, 例如, 用 someArray[index]来访问Array元素以及使用key之访问字典
// 你可以为一个类型定义多个下标, 并且下标会基于传入的索引值的类型选择合适的下标重载使用, 下标没有限制单个维度, 可以使用多个输入相残来定义下标满足自定义类型需求

// 下标语法
/*
 下标脚本允许通过在实例名后面的方括号内写一个或者多个值对该类型的实例进行查询, 类似于实例方法和计算属性, 使用关键字subscript 来定义下标, 并且指定一个或者多个输入形式参数和返回类型, 与实例方法一样. 与实例方法不同的是, 下标可以使阅读也可以是只读的, 这个行为通过计算属性中相同的getter 和setter传达
 subscript(index: Int) -> Int {
 
 get {
 // 返回一个属性下标
 }
 
 set(newValue) {
 
 // 设置一个属性下标
 }
 }
 */

struct TimeTable {
    let mutiplier: Int
    
    subscript(index: Int) -> Int {
        
        return mutiplier * index
    }
}

let threeTimeTable = TimeTable(mutiplier: 3)
print("six time three is \(threeTimeTable[6])")

// 下标确切的意思取决于使用它的上下文, 通常下标是用来访问集合, 列表或者序列中元素的快捷方式, 你可以在自己特定的列或者结构体中自由实现下标俩提供合适的功能
// 例如在Dictionary 类型实现了下标对Dictionary 实例中存放的值进行设置和读取操作, 你可以在下标的方括号中通过提供字典键类型下昂他的键来设置字典的值, 并且把一个字典值类型相同的赋值给这个下标

var numberOfLegs = ["spider": 8, "ant": 6, "cat": 4];
numberOfLegs["bird"] = 2

// 下标选项
/*
 下标可以接收任意数量的输入形式参数, 并且这些输入形式参数可以使任意类型, 下标也可以返回任意类型.
 下标可以使用变量形式参数和可变形式参数, 但是不能使用输入输出形式参数或提供默认形式参数值
 类或者
 
 */

struct Matrix {
    
    let rows: Int, columns: Int
    var grid:[Double]
    init(rows: Int, columns: Int) {
        
        self.rows = rows;
        self.columns = columns;
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    
    func indexIsValid(row: Int, column: Int) -> Bool {
        
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    
    subscript(row: Int, column: Int) -> Double {
    
        get {
        
            assert(indexIsValid(row: row, column: column), "index out of range")
            return grid[(row * columns) + column]
        }
        
        set {
        
            assert(indexIsValid(row: row, column: column), "index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}

var matrix = Matrix(rows: 2, columns: 2)
print(matrix.grid)

matrix[0, 1] = 1.5
print(matrix.grid)

matrix[1, 0] = 2.5
print(matrix.grid)

matrix[1, 1] = 3.5
print(matrix.grid)















































