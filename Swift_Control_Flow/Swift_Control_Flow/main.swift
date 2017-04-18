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

// 忽略序列值的打印
let base = 3
let power = 10
var answer = 1
for _ in 1...power {

    answer *= base
}

print("\(base) to the power of \(power) is \(answer)")

// stride 函数相当于python中的分片操作, 可以设置补偿
// 非闭合范围
let minuteInterval = 5
for tickMark in stride(from: 0, to: 60, by: minuteInterval) {

    print(tickMark)
}

// 闭合范围
for tickMark in stride(from:0, through:30, by: minuteInterval) {

    print(tickMark)
}

// while 循环: 1> while 在每次通过循环的开始时评估其状态。2> repeat- while在每次通过循环结束时评估其状态。
let finalSquare = 25
var board = [Int](repeating:0, count: finalSquare+1) // // repeatElement(<#T##element: T##T#>, count: <#T##Int#>)
print(board)

var number = 0
while number < finalSquare {

    number += 1
    if number % 2 == 0 {
    
        print("number is \(number)")
    }
}

var number_1 = 0
repeat {
    number_1 += 1
    if number_1 % 2 == 0 {
        
        print("number_1 is \(number_1)")
    }
    
} while number_1 < finalSquare

// if 语句
var temperatureInFahrenheit = 30
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
}

// Switch 语句
let samecharacter:Character = "z"
switch samecharacter {
    
case "a":
    print("the character is a")
    // fallthrough
    
case "z":
    print("the character is z")
    // fallthrough
default:
    print("some other character")
}

// swift 中switch 语句必须是可执行语句, 否则报错
switch samecharacter {
case "a": break // swift 中是switch 语句必须是可执行语句, 否则报错
case "b":
    print("the letter A")
default:
    print("not the letter A")
    
}

// 多值匹配
let anotherCharacter:Character = "a"
switch anotherCharacter {
case "a", "A":
    print("the letter A")
    
default:
    print("not the letter A")
}

// 间隔匹配
let approximateCount = 62
let countedThings = "moons orbiting Saturn"
let naturalCount:String
switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "many"
default:
    naturalCount = "many"
}
print("There are \(naturalCount) \(countedThings).")

// 元组(Tuples)
let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("\(somePoint) is at the origin")
case (_, 0):
    print("\(somePoint) is at the x-axis")
case (0, _):
    print("\(somePoint) is at the y-axis")
case (-2...2, -2...2):
    print("\(somePoint) is inside the box")
default:
    print("\(somePoint) is outside of the box")
}

// Value Bindings, 这种情况下只要一个值匹配, 另一个值直接赋值
let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with a y value of \(y)")
case (let x, let y):
     print("somewhere else at (\(x), \(y))")
}

// where 条件语句
let yetAnotherPoint = (1, -1)

// 用where 语句检查 yetAnotherPoint 元组中的两个元素是否相等
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}

let stillAnotherPoint = (9, 0)
switch stillAnotherPoint {
case (let distance, 0):
    print("On an x_axis, \(distance) from the origin")
    
case (0, let distance):
    print("On an y_axis, \(distance) from the origin")
    
default:
    print("Not on an axis")
}

// 控制转移语句: continue/ break/ fallthrough/ return/ throw


// guard 语句
func greet(person:[String:String]) {

    // 如果person["name"] 有值则赋值给那么, 如果条件不满足自进入else语句
    guard let name = person["name"] else {
        
        return
    }
    
    print("hellow \(name)!")
    
    // 如果person["location"] 有值则赋值给那么, 如果条件不满足自进入else语句
    guard let location = person["location"] else {
        
        print("i hope the weather is nice near you")
        return
    }
    
    print("I hope the weather is nice in \(location).")    
}

greet(person: ["name": "john"])
greet(person: ["name": "Jane", "location": "Cupertino"])

/*
 一个guard语句，像一个if语句，根据表达式的布尔值执行语句。您使用guard语句要求条件必须为true，以便执行语句后的代码guard。不像if语句，一个guard语句总是有一个else条款，将里面的代码else，如果条件不满足子句被执行。
 
 如果guard语句的条件得到满足，代码执行后继续guard语句的右括号。即使用任选的结合作为条件的一部分分配值的任何变量或常量可用于该代码块的其余部分guard语句出现英寸
 
 如果不符合条件，else则执行分支中的代码。该分支必须控制转移，退出其中的代码块guard出现的语句。它可以做到这一点与控制权转移的语句，如return，break，continue，或者throw，也可以调用一个函数或方法不返回，如fatalError(_:file:line:)。
 
 使用guard语句要求提高代码的可读性，相比于做有相同的检查if语句。它允许您编写通常执行的代码，而不将其包装在else块中，并且它允许您将处理违规要求的代码保留在要求旁边。
 */
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    






















































