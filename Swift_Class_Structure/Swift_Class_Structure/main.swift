//
//  main.swift
//  Swift_Class_Structure
//
//  Created by JM Zhao on 2017/4/21.
//  Copyright © 2017年 JunMing. All rights reserved.
//

import Foundation

// 类和结构
// 类和结构是通用的, 灵活的构造, 成为程序代码的基础, 可以使用与常量, 变量和函数完全相同的语法来定义属性和方法向类和结构㽠功能
// Swift中不需要为类和结构车间单独的接口和实现文件, 可以在单独文件中定义一个类或者结构, 并且该类和结构的外部接口自动时期他代码可以使用

/*
 比较类和结构:
 相同点: 
 1> 都可以存储值的属性
 2> 定义提供功能的方法
 3> 使用语法定义下标来提供对其值的访问
 4> 定义初始化器以设置其初始状态
 5> 扩展其功能超出默认实现
 6> 符合协议提供特定的标砖功能
 
 不同点:
 1> 继承使一个类能够继承另一个类的特征
 2> 类型转换使能够在运行时检查和解释实例的类型
 3> 取消初始化是一个类的实例可以释放器分配的任何资源
 4> 引用计数允许对多个类实例的引用
 */

// 定义语法
class SomeClass {

    // 定义类
}

struct SomeStructure {
    
    // 定义结构
}

struct Resolution {
    
    var width = 0
    var height = 0
}

class VideoMode {
    
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name:String?
}

// 类和结构的实例化
let someResolution = Resolution()
let someVideoMode = VideoMode()

// 访问属性
print("the width of someResoltion is \(someResolution.width)")
print("the width of someVideoMode is \(someVideoMode.resolution.width)")

someVideoMode.resolution.width = 1280
print("the width of someVideoMode is now \(someVideoMode.resolution.width)")

// 成员初始化器构造类型
// 所有结构体都有一个自动生成的成员初始化器, 您可以使用他来初始化新结构实例的成员属性, 新实例的初始值可以通过名称传递给成员初始化器
// 与结构体不同, 类实例不接受默认的初始化器
let vga = Resolution(width: 640, height: 480)
print("vga is \(vga.width, vga.height)")

// 结构体和枚举都是值类型, 这意味着您创建的任何结构和枚举实例以及它们作为属性的任何值类型在代码中传递时总是被复制。
// 一个值类型被拷贝或者被传递给函数的时候, 他被分配一个变量或常数
// Swith中值类型广泛存在: 整数(Int) 浮点数(float), 布尔值(Bool), 字符串(String), 数组(Array), 字典(Dictionary)均为之类型

let hd = Resolution(width: 1902, height: 1080)
var cinema = hd
print("hd values \(hd.width, hd.height), cinema values \(cinema.width, cinema.height)")

cinema.width = 2048
cinema.height = 2160
print("hd values \(hd.width, hd.height), cinema values \(cinema.width, cinema.height)")

// 同样的行为也适合枚举
enum CompassPoint {

    case north, sourch, east, west
}

var currentDirection = CompassPoint.west
let remembereDirection = currentDirection
currentDirection = .east

if remembereDirection == .west {

    print("The remembered direction is still .west")
}

// 类是引用类型: 当引用类型被分配给变量或常量时，或者将其传递给函数时，不会复制引用类型。而不是复制，而是使用对相同现有实例的引用。
let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEigthy = tenEighty
alsoTenEigthy.frameRate = 30.0
print("The frameRate property of tenEighty is now \(tenEighty.frameRate)")

// 注意: tenEighty 并且 alsoTenEighty 被声明为常量而不是变量。但仍然可以更改tenEighty.frameRate，alsoTenEighty.frameRate因为这些tenEighty和alsoTenEighty常量本身的值并没有实际改变。tenEighty而且alsoTenEighty它们本身并不“存储” VideoMode实例，而是指VideoMode幕后的实例。它是改变frameRate的底层的属性VideoMode，而不是常量引用的值VideoMode

// 身份运营商
/*
 因为类是引用类型, 因此多个常量和变量可以引用猕猴的类的单个实例, （结构和枚举也是如此，因为当它们被分配给一个常量或变量，或者被传递给一个函数时，它们总是被复制。）有时可以找到两个常量或变量是否与类完全相同的实例, 为了实现这一点，Swift提供了两个身份运营商：
 
 1> (===)  一致
 2> (!==)  不一致
 
 相同”意味着类类型的两个常量或变量指的是完全相同的类实例
 “等于”意味着两个实例被视为“相等”或“等价”的价值，对于类型设计者定义的“相等”的某些适当含义。
 
 */

if tenEighty === alsoTenEigthy {

    print("tenEighty and alsoTenEighty refer to the same VideoMode instance.")
}

// 类和结构体选择使用哪一个
/*
 作为一般原则: 以下条件使用结构体
 
 1> 该结构的主要目的是封装一些相对简单的数据值。
 2> 在分配或传递该结构的实例时，期望封装的值将被复制而不是引用是合理的。
 3> 由结构存储的任何属性本身都是值类型，也将被预期复制而不是引用。
 4> 该结构不需要从另一个现有类型继承属性或行为。
 
 结构的良好候选人的例子包括:
 
 1> 几何形状的大小，可能封装了width属性和height属性，都是类型Double。
 2> 引用一个系列中的范围的方法，也许封装一个start属性和一个length属性Int。
 3> 在3D坐标系中，A点也许包封x，y和z特性，每种类型的Double。
 */

// 字符串，数组和字典的分配和复制行为
// 在Swift中, 许多基本的数据类型，如String，Array以及Dictionary被实现为结构。这意味着，当将数据分配给一个新的常量或变量，或者当它们被传递给一个函数或者方法时，就会复制字符串，数组和字典等数据。
// 这种行为与Foundation：不同NSString，NSArray并且NSDictionary被实现为类而不是结构。基础中的字符串，数组和字典总是作为对现有实例的引用分配和传递，而不是副本。










































