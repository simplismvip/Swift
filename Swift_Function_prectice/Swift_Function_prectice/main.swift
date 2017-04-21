//
//  main.swift
//  Swift_Function_prectice
//
//  Created by JM Zhao on 2017/4/21.
//  Copyright © 2017年 JunMing. All rights reserved.
//

import Foundation

func printAndAdd(string:String, string1:String) -> String {

    return string + string1
}

func ignoreReturnValue(string:String) {

    let _ = printAndAdd(string: "Swift", string1: "3.1")
}

// 多个返回值函数
func minAndMax(array:[Int]) -> (min:Int, max:Int, mid:Int)? {

    let min = array[0]
    let mid = array[0]
    let max = array[0]
    
    return (min, mid, max)
}

if let t = minAndMax(array: [1, 2, 3]) {

    print("min is \(t.min), mid is \(t.mid), max is \(t.max)")
}

// 函数参数标签和参数名称
func someFunction(fp fparament: Int, sp sparament: Int) -> (fp: Int, sp: Int)? {

    return (fparament, sparament)
}

if let p = someFunction(fp: 9, sp: 10) {

    print("fp is \(p.fp), sp is \(p.sp)")
}

// 省略参数标签
func someFunc(_ fparament: Int, _ sparament: Int) {

    print(fparament + sparament)
}

someFunc(10, 20)

// 默认参数表述
func defaultFunc(wparamrnt:Int, dparament:Int = 12) -> Int {

    return wparamrnt + dparament
}

print(defaultFunc(wparamrnt: 10))
print(defaultFunc(wparamrnt: 10, dparament: 20))

// 多选参数
func moreParament(number:Int..., n2:Int) -> Int {

    for value in number {
       
        print(value)
    }
    
    return n2
}

print(moreParament(number: 1, 2, 3, 4, 5, 6, n2: 10))

// 输入参数
func inputParament(a: inout Int, b: inout Int) -> Int {

    return a + b
}

var a = 10
var b = 20
print(inputParament(a: &a, b: &b))

// 函数类型
func funcTypeadd(a: Int, b:Int) -> Int {

    return a+b
}

func funcTypemulit(a: Int, b: Int) -> Int {

    return a*b
}

// var mulit:(Int, Int) -> Int = funcTypemulit, 相当于自己写了一个可变类型, mulit是变量名, (Int, Int) -> Int 是变量类型, funcTypemulit 是赋值
var addf:(Int, Int) -> Int = funcTypemulit(a:b:)
print(addf(20, 30))

var mulit:(Int, Int) -> Int = funcTypemulit
print(mulit(10, 20))

var inputf:(inout Int, inout Int) -> Int = inputParament
print(inputf(&a, &b))

// 函数类型作为参数传入
func funcTypeParment(mulit:(Int, Int) -> Int, addf:(Int, Int) -> Int, a: Int, b: Int) {

    let n = mulit(a, b) + addf(a, b)
    print(n)
}

funcTypeParment(mulit: mulit, addf: addf, a: 10, b: 20)

// 函数类型作为返回值
func funcTypeParmentReturn(isAdd:Bool) -> (Int, Int) -> Int {

    return isAdd ? funcTypemulit : funcTypemulit
}












































