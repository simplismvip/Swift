//
//  main.swift
//  Swift_Function
//
//  Created by JM Zhao on 2017/4/18.
//  Copyright © 2017年 JunMing. All rights reserved.
//

import Foundation

// 函数的定义和调用
func greet(person:String) -> String {

    let greeting = "Hellow " + person + " !"
    return greeting
}

print(greet(person: "Jim"))

// 函数参数和返回值
func sayHellow() ->String {

    return "hellow world"
}
print(sayHellow())

// 具有多个参数的函数
func greet(person: String, alreadyGreeted:Bool) -> String {

    if alreadyGreeted {
        
        return greet(person: person)
    }else {
        return sayHellow()
    }
}
print(greet(person: "tony", alreadyGreeted: true))

// 无返回值的函数
func greets(person: String) {

    print("hellow, \(person) !")
}

greets(person: "stack")

// 忽略函数返回值
func printAndCount(string: String) -> Int {

    print(string)
    return string.characters.count
}

func printWithoutCounting(string:String) {

    let _ = printAndCount(string: string)
}

print(printAndCount(string: "hellow, world"))
printWithoutCounting(string: "hellow, world")

// 具有多个返回值的函数
func minMax(array:[Int]) -> (min:Int, max:Int) {

    var currentMin = array[0]
    var currentMax = array[0]
    
    for value in array[1..<array.count] {
    
        if value < currentMin {
        
            currentMin = value
            
        }else if value > currentMax {
            
            currentMax = value
        }
    }
    
    return (currentMin ,currentMax)
}

let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
print("min is \(bounds.min) and max is \(bounds.max)")

// 可选元组返回类型
func getMinAndMax(array:[Int]) -> (min:Int, max:Int)? {

    var minValue = array[0]
    var maxValue = array[0]
    for value in array[0..<array.count] {
    
        if value<minValue {
        
            minValue = value
            
        }else if value > maxValue {
        
            maxValue = value
        }
    }
    
    return (minValue, maxValue)
}

if let bounds = getMinAndMax(array: [8, -6, 2, 109, 3, 71]) {
    
    print("min is \(bounds.min) and max is \(bounds.max)")
}

// 函数参数标签和参数名称
func someFunction(fparament fristParament: Int, sparament secondParament: Int) -> (frist:Int, second:Int) {

    // fparament fristParament: Int 参数标签 参数名字 返回值类型
    return (fristParament, secondParament)
}

print(someFunction(fparament: 10, sparament: 10))

// 省略参数标签
func someFunctions(_ firstparmentName: Int, secondParament: Int) {

    print(firstparmentName, secondParament)
}

someFunctions(1, secondParament: 2)

// 默认参数值
func defaultFunction(paramentWithoutDefault:Int, paramentWithDefault:Int = 12) {

    print(paramentWithDefault, paramentWithoutDefault)
}

defaultFunction(paramentWithoutDefault: 10)
defaultFunction(paramentWithoutDefault: 10, paramentWithDefault: 20)

// 变量参数, 每个函数中最多可以有一个变量参数
func varableParment(_ number:Double...) {

    print(number)
}

func varableParamentString(_ string: String..., array:Array<Int>) {

    print(string, array)
}

varableParment(1.0, 2.0, 3.0, 4.0, 5.0, 6.0)
varableParment(1.0, 2.0, 3.0)
varableParamentString("1", "1", "1", "1", "1", array: [1, 2, 3, 4, 5])
varableParamentString("1", "1", "1", array: [1, 2, 3, 4, 5])

// 输入参数
func swapTwoInts(_ a: inout Int, _ b: inout Int) -> Int {

    let tempTwoIntsA = a
    a=b
    b=tempTwoIntsA
    return b
}

var someInt = 3
var anotherInt = 107
print(swapTwoInts(&someInt, &anotherInt))

// 函数类型: 每个函数都有一个特定的函数类型，由参数类型和函数的返回类型组成。
// 函数类型类似于匿名函数或者OC中的block块

// (Int, Int) -> Int
func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}
func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}

// () -> Void 型
func printHelloWorld() {
    print("hello, world")
}

// 使用函数类型: 可以将常量或变量定义为函数类型，并为该变量分配适当的函数
var mathFunction:(Int, Int) -> Int = addTwoInts
print(mathFunction(2, 3))

var multioFunction:(Int, Int) -> Int = multiplyTwoInts
print(multioFunction(2, 3))

// 函数类型作为参数类型
let anotherMathFunction = addTwoInts
func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {

    print("result: \(mathFunction(a, b))")
}
printMathResult(anotherMathFunction, 10, 20)

// 函数类型作为返回类型
// 以下两个函数是 (int) -> int 类型
func stepForward(_ input: Int) -> Int {

    return input + 1
}

func stepBackward(_ input: Int) -> Int {

    return input - 1
}

func chooseFunction(backward: Bool) -> (Int) -> Int {

    return backward ? stepBackward : stepForward
}

var currentValue = 3
let moveNearFunctionZero = chooseFunction(backward: currentValue > 0)
while currentValue != 0 {

    print("\(currentValue)...")
    currentValue = moveNearFunctionZero(currentValue)
}
print("zero!")

// 嵌套函数: 目前为止所有函数都是在全局范围内定义, Swift还可以在函数内部定义函数
func chooseFunctions(backward: Bool) -> (Int) -> Int {

    func stepForwards(_ input: Int) -> Int {
        
        return input + 1
    }
    
    func stepBackwards(_ input: Int) -> Int {
        
        return input - 1
    }
    
    return backward ? stepForwards : stepBackwards
}

var currentValues = -4
let moveNearerToZero = chooseFunctions(backward: currentValues > 0)
while currentValue != 0 {
    
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")






































