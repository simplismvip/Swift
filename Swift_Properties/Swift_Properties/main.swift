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
print("\(rangeOfThreeItems.firstValue), \(rangeOfThreeItems.length)");
rangeOfThreeItems.firstValue = 6
print("\(rangeOfThreeItems.firstValue), \(rangeOfThreeItems.length)");

// 懒惰存储属性: 在声明之前编写修饰符lazy，表示一个懒惰的存储属性。
// 注意: 您必须始终将惰性属性声明为变量（使用var关键字），因为在实例初始化完成之后，可能无法检索其初始值。常量属性必须始终在初始化完成之前具有一个值，因此不能被声明为惰性。
class DataImporter {

    var fileName = "data.txt"
}

class DataManger {
    
    lazy var importer = DataImporter()
    var data = [String]()
}

let manger = DataManger()
manger.data.append("Some data")
manger.data.append("Some more data")
print(manger.importer.fileName, manger.data)

// 注意: 如果标记有lazy修饰符的属性同时由多个线程访问，并且该属性尚未初始化，则不能保证该属性仅被初始化一次。
// 计算属性
struct Point {

    var x = 0.0, y = 0.0
}

struct Size {
    
    var width = 0.0, height = 0.0
}

struct Rect {
    
    var origin = Point()
    var size = Size()
    var center:Point {
    
        get {
        
            let centerX = origin.x + (size.width/2)
            let centerY = origin.y + (size.height/2)
            return Point(x: centerX, y: centerY)
        }
        
        set (newCenter) {
        
            origin.x = newCenter.x - (size.width/2)
            origin.y = newCenter.y - (size.height/2)
        }
    }
}

var square = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
square.center = Point(x: 15, y: 15)
print("square.origin is now at (\(square.origin.x), \(square.origin.y))")

// 速记设定这声明: 如果计算属性的设置器未定义要设置的新值的名称，newValue则使用默认名称。这是一个替代版本的Rect结构，它利用这个速记符号
struct AlternativeRect {

    var origin = Point()
    var size = Size()
    var center:Point {
    
        get {
            let centerX = origin.x + size.width/2
            let centerY = origin.y + size.height/2
            return Point(x:centerX, y:centerY)
        }
        
        set {
            origin.x = newValue.x - size.width/2
            origin.y = newValue.y - size.height/2
        }
    }
}

// 设置只读属性: 具有getter但不设置器的计算属性称为只读计算属性。只读计算属性始终返回一个值，可以通过点语法访问，但不能设置为不同的值。
struct Cuboid {

    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
    
        return width * height * depth
    }
}

let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
print("the volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")

// 属性观察者
class StepCounter {

    var totalSteps: Int = 0 {
    
        willSet(newTotalSteps) {
        
            print("About to set totalSteps to \(newTotalSteps)")
        }
        
        didSet {
        
            if totalSteps > oldValue {
                
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}

let stepCounter = StepCounter()
stepCounter.totalSteps = 200
stepCounter.totalSteps = 360
stepCounter.totalSteps = 896

/*
 // 全局和局部变量
 上述用于计算和观察属性的功能也可用于全局变量和局部变量。全局变量是在任何函数，方法，闭包或类型上下文之外定义的变量。局部变量是在函数，方法或闭包上下文中定义的变量。
 您在前几章中遇到的全局变量和局部变量都已存储变量。存储的变量（如存储的属性）为某个类型的值提供存储，并允许设置和检索该值。
 但是，您还可以定义计算变量并定义全局或局部范围内存储变量的观察者。计算变量计算其值，而不是存储它们，并且以与计算属性相同的方式编写它们。
 
 注意:
 全局常量和变量总是以懒惰存储属性的方式懒惰地计算。与延迟存储的属性不同，全局常量和变量不需要用lazy修饰符标记。
 本地常量和变量永远不会懒惰地计算。
 
 // 类型属性
 实例属性是属于特定类型的实例的属性。每次创建该类型的新实例时，它都有自己的一组属性值，与任何其他实例分开。
 您还可以定义属于类型本身的属性，而不是该类型的任何一个实例。只有这些属性的一个副本，无论你创建了多少个类型的实例。这些属性称为类型属性。
 类型属性可用于定义通用于特定类型的所有实例的值，例如所有实例可以使用的常量属性（如C中的静态常量）或存储全局值的变量属性该类型的实例（如C中的静态变量）。
 存储类型属性可以是变量或常量。计算类型属性始终声明为可变属性，与计算的实例属性相同。
 
 注意:
 与存储的实例属性不同，您必须始终将存储的类型属性指定为默认值。这是因为类型本身没有初始化程序，可以在初始化时为一个存储类型属性赋值。
 存储类型属性在其第一次访问时被延迟初始化。它们被保证只被初始化一次，即使同时被多个线程访问，并且它们不需要被lazy修饰符标记
 
 */

// 键入属性语法
// 在OC中, 将与类关联的静态常量和变量定义为全局静态变量, 在Swift中, 类型属性将作为类型定义的部分写入类型的外部花括号中, , 并且每个类型属性都现实的定义为支持的类型
struct SomeStructure {

    static var storedTypeProperty = "Some value"
    static var computedTypeProperty: Int {
    
        return 1
    }
}

enum SomeEnumeration {
    static var storedTypeProperty = "Some value"
    static var comeputedTypeProperty: Int {
    
        return 6
    }
}

class SomeClass {
    
    static var storedTypeProrerty = "Some value"
    static var computedTypeProperty: Int {
    
        return 27
    }
    
    class var overridealbeComputedTypeProperty:Int {
        
        return 107
    }
}

// 查询和设置类型属性: 查询类型属性并使用点语法设置，就像实例属性一样。但是，类型属性将被查询并设置在类型上，而不是该类型的实例上。例如：
print(SomeStructure.storedTypeProperty)
print(SomeStructure.computedTypeProperty)
SomeStructure.storedTypeProperty = "Another value."
print(SomeStructure.storedTypeProperty)
print(SomeEnumeration.storedTypeProperty)
print(SomeEnumeration.comeputedTypeProperty)
print(SomeClass.storedTypeProrerty)
print(SomeClass.computedTypeProperty)

// 再练习一遍
// 延迟属性
class DataImporterFiles {

    var fileName = "data.txt"
    let fileSize = "1024"
}

class DataFilesManger {
    
    lazy var importer = DataImporterFiles()
    var datas = [String]()
}

let file_Manger = DataFilesManger()
file_Manger.datas.append("data.png")
file_Manger.datas.append("data.jpg")
print(file_Manger.importer.fileName, file_Manger.importer.fileSize)

// 存储属性和计算属性
// 计算属性
struct SPoint {

    var x = 0.0, y = 0.0
}
struct SSize {
    
    var width = 0.0, height = 0.0
}

struct SRect {
    
    var origin = SPoint()
    var size = SSize()
    var center:SPoint {
    
        get {
            let centerX = origin.x + size.width/2
            let centerY = origin.y + size.height/2
            return SPoint(x: centerX, y: centerY)
        }
        
        set {
            origin.x = newValue.x - size.width/2
            origin.y = newValue.y - size.height/2
        }
    }
}

// 以上例子, 设置center新的(x, y), 根据(x, y)获取center
var ssquare = SRect(origin: SPoint(x: 10, y: 10), size: SSize(width: 10, height: 10))
print(ssquare.center, ssquare.origin, ssquare.size)

ssquare.center = SPoint(x: 20, y: 20)
print(ssquare.center, ssquare.origin)

// 只读计算属性
struct SCuboid {

    var width = 0.0, height = 0.0, depth = 0.0
    
    // 计算属性只能使用 var 修饰, 因为是可变的
    var volume:Double {
    
        return width*height*depth
    }
}

// 属性观察者
class SStepCounter {

    var totlSteps: Int = 0 {
    
        willSet(newTotlSteps){
            print("About to set totalSteps to \(newTotlSteps)")
        }
        
        didSet{
            if totlSteps > oldValue {
                
                print("added \(totlSteps - oldValue) steps")
            }
        }
    }
    
    var stepCount: Int = 0 {
    
        willSet {
            print("About to set totalSteps to \(newValue)")
        }
        
        didSet {
            print("added \(oldValue, stepCount) steps")
        }
    }
}

let SSCount = SStepCounter()
SSCount.totlSteps = 101
SSCount.stepCount = 201;

// 全局和局部变量
struct SSomeStructure {

    static var storeTypeProperty = "Some Value"
    static var computedTypeProperty: Int {
    
        return 1
    }
}

enum SSomeEnumeration {
    
    static var storeTypeProperty = "Some Value"
    static var computedTypeProperty: Int {
        
        return 6
    }
}

class SSomeClass {
    
    static var storeTypeProperty = "Some Value"
    static var computedTypeProperty: Int {
        
        return 1
    }
    
    // 使用static关键字来开 类型属性
    // 使用class关键字来允许子类重写父类的实现
    class var overrideableComputedTypeProperty: Int {
        
        return 107
    }
}

class SSubSomeClass: SSomeClass {
    
    // override static var storeTypeProperty = "Some Value", 只有使用 Class 关键字修饰的类型属性才可以重写傅雷属性, static 修饰的不可以
    
    // 使用class关键字来允许子类重写父类的实现
    override class var overrideableComputedTypeProperty: Int {
        
        return 209
    }
}

// 查询和设置类型属性
print(SSomeStructure.storeTypeProperty)
SSomeStructure.storeTypeProperty = "new Value is Done"
print(SSomeStructure.storeTypeProperty)
print(SSomeEnumeration.storeTypeProperty)

print(SSomeClass.overrideableComputedTypeProperty)
print(SSubSomeClass.overrideableComputedTypeProperty)

// 模拟音频高低
struct AudioChannel {

    static let thresholdLevel = 10
    static var maxInputLevelForAllChannel = 0
    var currentLevel = 0 {
    
        willSet {
            
            print("new is \(currentLevel))")
        }
        
        didSet {
        
            if currentLevel > AudioChannel.thresholdLevel {
                
                currentLevel = AudioChannel.thresholdLevel
            }
            
            if currentLevel > AudioChannel.maxInputLevelForAllChannel {
                
                AudioChannel.maxInputLevelForAllChannel = currentLevel
            }
        }
    }
}

var leftChannel = AudioChannel()
var rightChannel = AudioChannel()

leftChannel.currentLevel = 7

print(leftChannel.currentLevel)
print(AudioChannel.maxInputLevelForAllChannel)

rightChannel.currentLevel = 11
print(rightChannel.currentLevel)
print(AudioChannel.maxInputLevelForAllChannel)









































