//
//  main.swift
//  Swift--协议
//
//  Created by JM Zhao on 2017/5/22.
//  Copyright © 2017年 JunMing. All rights reserved.
//

import Foundation

// 协议
/*
 协议为方法, 属性, 以及其他特定的任务需求或者功能定义蓝图, 协议可以被类, 结构体, 枚举采纳一提供货所需功能的具体实现, 满足了协议中需求的任意类型都叫做遵循了该协议
 除了制定遵循类型必须实现的要求外, 你可以扩展一个协议以实现其中的一些需求或者实现一个符合类型的可以利用的附加功能
 协议的语法:
 protocol SomeProtocol {
 
    // protocol definition goes here
 }
 
 在自定义类型声明时, 将协议名放在类型名的冒号之后表示该类型采纳一个特定的协议, 多个协议可以用逗号分开列出
 struct SomeStructure: FirstProtocol, AnotherProtocol {
    
    // structure definition goes hers
 }

 */

// 属性要求
/*
 协议可以要求所有遵循该协议的类型提供特定名字和类型的实例属性或者类型属性, 协议并不会具体说明属性是存储属性还是计算属性, 他只具体要求属性有特定的名称和类型, 协议同时要求一个属性必须明确是可读或者可写的
 
 若协议要求一个属性为可读和可写的, 那么该属性要求不能用常量存储属性或者只读属性来满足, 若协议只要求属性为可读的, 那么任何种类的属性都能满足这个要求, 而且如果你的代码需要的话, 该属性也可以是可写的
 
 属性要求为变量属性, 在名称前面使用var 关键字, 可读写的属性使用{get set}来写在属性后面来明确, 使用{get}来明确可读的属性
 */

protocol SomeProtocol {

    var mustBeSettable:Int {get set }
    var doesNotNeedToBeSettable:Int {get}
}

protocol AnotherProtocol {
    
    static var someTypeProperty:Int {get set}
}

protocol FullyName {
    
    var fullName:String {get}
}

struct Person: FullyName {
    
    var fullName: String
}

let john = Person(fullName:"john appleseed")

/*
上面的例子定义了名为fullName的String类型存储属性, 这符合FullName协议的单一要求, 并表示Peson已经正确地遵循了该协议, 若协议的要求没有完全达到, 会报错
*/

class StarShip: FullyName {
    
    var prefix:String?
    var name: String
    init(name:String, prefix:String? = nil) {
        
        self.name = name
        self.prefix = prefix
    }
    
    var fullName: String {
    
        return (prefix != nil ? prefix! + " " : " " + name)
    }
}

// 这个类为星舰实现了fullName计算型只读属性的要求, 每个Startship 类的实例存储了一个不可选的name属性以及一个可选的prefix属性, 当prefix值存在是, fullName将prefix放在name之前以创建星舰全名

// 方法要求
/*
 协议可以要求采纳的类型实现指定的实例方法和类方法, 这些方法作为协议定义的一部分, 书写方式与正常实例和类方法完全相同, 但是不需要大括号和方法的主题, 允许变量拥有参数, 与正常方法的使用同样的规则, 但是在协议的定义中, 方法参数不能定义默认值
 
 正如类型属性要求的那样, 当协议中定义类型方法时, 你总要在其之前添加static 作为关键字, 前面的规则仍然使用
 
 protocol SomeProtocol {
 
    static func someTypeMethod()
 }
 
 */

protocol RandomNumberGenerator {
    
    func random() -> Double
}

/*
 这里RandomNumbergenerator协议要求所有采用该协议的类都必须有一个实例方法, 而且要求返回一个Double的值, 无论这个值叫什么, 尽管协议没有明确定义, 这里默认是这个值在0.0到1.0
 RandomNumberGenerator 协议并不为随机生成的过程做任何定义, 它只要求生成器提供一个生成随机数的标准过程
 这里有一个采用并遵循 RandomNumberGenerator 协议的类的实现, 这个类实现了著名的为随机数发生器算法
 */

class LinearCongruentialGenerator: RandomNumberGenerator {
    
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        
        lastRandom = ((lastRandom * a + c).truncatingRemainder(dividingBy:m))
        return lastRandom / m
    }
}

let generator = LinearCongruentialGenerator()
print("Here's a random number: \(generator.random())")
print("And another oner: \(generator.random())")

// 变异方法要求
/*
 有时候一个方法需要改变其所属的实例, 例如之类型的实例方法, 在方法的func 关键字 之前使用mutating 关键字, 来表示可以改变所属的实例, 以及该实例所有属性
 若你定义了一个协议的实例方法需求, 想要变异任何采用了该协议的类型实例, 只需要在协议里方法的定义中使用mutating关键字, 允许结构体和枚举类型能采用相应协议并满足方法需求
 */

protocol Togglable {
    
    mutating func toggle()
}

// 下面的例子定义了一个名为onOffSwitch的枚举, 这个枚举在两种状态键改变, 即枚举成员on和Off, 该枚举的toggle实现使用了mutating关键字, 以满足toggtable协议的需求

enum OnOffSwitch: Togglable {
    case off, on
    mutating func toggle() {
        
        switch self {
        case .off:
            self = .on
        
        case .on:
            self = .off
        }
    }
}

var lightSwitch = OnOffSwitch.off
lightSwitch.toggle()

// 初始化器要求
/*
 协议可以遵循协议的类型和试下指定的定义当中去, 只是不用写大括号也就是初始化器的实体
 protocol SomeProtocol {
 
    init(someParameter:Int)
 }
 
 协议初始化器要求的类实现
 你可以实现指定初始化器或者便捷初始化器来遵循改协议满足协议的初始化器的要求, 在这种情况下, 你必须使用required关键字修饰初始化器的实现
 protocol SomeProtocol {
 
    required init(someParameter:Int)
 }
 
 在遵循协议的类的所有子类中, requred 修饰的使用保证了腻味协议初始化器要求提供了一个明确的继承实现
 如果一个子类重写了父类指定的初始化器, 并且遵循了协议实现了初始化器要求, 那么就要为这个初始化器的实现添加required和override两修饰符
 
 
 protocol SomeProtocol {
 
    init()
 }
 
 class SomeSuperClass {
 
    init() {
 
    }
 }
 
 class SomeSubClass: SomeSuoerClass, SomeProtocol {
 
    required override init () {
 
        }
 }
 
 可失败初始化器要求
 如同可以失败初始化器定义一样, 协议可以遵循该协议的类型定义可是百度初始化器, 遵循协议的类型可以使用一个可失败的或者不可失败的初始化器满足一个可失败的初始化器要求, 不可事变的初始化器要求可以使用一个不可失败的初始化器或者饮食展开的可失败初始化器满足
 */

// 将协议作为类型
/*
 实际上协议本身并不实现功能, 不过你创建的任何协议都可以变为功能完备的类型在代码中使用
 */



















































































