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
struct mPoint {

    var x = 0.0, y = 0.0
    mutating func moveByX(deltaX: Double, y deltaY: Double) {
    
        x += deltaX
        y += deltaY
    }
}

var somePoint = mPoint(x: 1.0, y: 1.0)
somePoint.moveByX(deltaX: 2.0, y: 3.0)
print("the point is now at (\(somePoint.x), \(somePoint.y))")

// mutating关键字允许他修改自身的属性, 但是注意: 日过常量结构体实例的存储属性里描述的那一, 你不能在常量结构体类型里面调用变异方法, 因为自身属性不能被改变, 就算他们是变量属性

// 这里会报错, "Cannot user mutating member on immutable value: 'fixedPoint is a let constant'"
let fixedPoint = mPoint(x: 2.0, y: 2.0)
// fixedPoint.moveByX(deltaX: 2.0, y: 3.0)

// 在变异方法里指定自身
struct m_Point {

    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
    
        self = m_Point(x: x + deltaX, y: y + deltaY)
    }
}

// 枚举的变异方法可以隐含设置 self属性为相同枚举正的不同成员
enum TriStateSwitch {

    case off, low, high
    mutating func next () {
    
        switch self {
            
        case .off:
            self = .low
            
        case .low:
            self = .high
            
        case .high:
            self = .off
        }
    }
}

// 上面的例子定义了三种不同的开关状态枚举, 每次调用next() 方法, 这个开关就会在三种不同状态下切换

// 类型方法: 实例方法是在特定类型实例中调用的方法, 同样可以通过在func 之前使用static 关键字俩明确一个类型方法, 同样也可以使用class 关键字来允许子类重写父类对类型方法的实现
// 类型方法和实例方法一样使用点语法调用, 使用类来调用
class SomeClass {
    
    class func someTypeMethod() {
        
        // 类型方法的使用
        print("someTypeMethod")
    }
}

SomeClass.someTypeMethod()
/*
 在类型方法中, 隐含的self属性指向类本身而不是这个类的实例, 对于结构体和枚举, 意味着可以使用self来消除类型属性和类型方法形式参数之间的歧义
 
 用法和实例属性与实例方法形式参数之间用法相同
 
 一般来说, 在类型方法函数内书写任何非完全标准的方法和属性名都会指向另一个类级别的方法和属性, 一个类型方法可以使用方法名调用另一个类型方法, 并不需要使用类型名字作为前缀, 同样, 结构体和枚举中类型方法也可以直接使用类型名最为前缀而不需要写类型名称前缀来访问属性
 
 下面的例子定义了一个叫做levelTracker的结构体, 通过不同等级或者阶层追中玩家游戏进度
 
 */

struct levelTracker {

    static var highUnlockLevel = 1
    var currentLevel = 1
   
    static func unlock(_ level: Int) -> Bool {
    
        if level > highUnlockLevel {
            
            highUnlockLevel = level
            return true
        }else {
            return false
        }
    }
    
    static func isUnlocked(_ level: Int) -> Bool {
    
        return level <= highUnlockLevel
    }
    
    // 在这里需要修改等级, 所以使用变异方法来修饰 
    // @discardableResult 关键字用来消除有返回值但是却没有接收的警告
    @discardableResult
    mutating func advance(to level: Int) -> Bool {
    
        if levelTracker.isUnlocked(level) {
            
            currentLevel = level
            return true
        }else {
            return false
        }
    }
}

class Player {
    
    var track = levelTracker()
    let playerName: String
    
    func completaTrack(_ level: Int) {
        
        let isUnlock = levelTracker.unlock(level + 1)
        print(isUnlock)
        
        // 增加新一等级
        track.advance(to: level + 1)
    }
    
    init(name: String) {
        
        playerName = name
    }
}

/*
 Player 类型创建了一个新的levelTracker实例用力啊追中玩家进度, 同时提供一个complete(level:)方法在玩家完成一个等级之后解锁
 这个方法会为所有玩家接收下一个等级并且更新玩家的进度到下一个等级
 你也可以通过为Player类创建一个实例来新建一个玩家, 然后看玩家完成等级1 的时候会发生什么
 */

var player = Player(name: "Argyrios")
player.completaTrack(1)
print("highest unlocked level is now \(levelTracker.highUnlockLevel)")

// 如果你此时创建了第二个玩家, 当进入尚未被任何玩家在游戏中解锁的等级的时候, 设置玩家当前等级的尝试都会失败
player = Player(name: "beto")

if player.track.advance(to: 6) {

    print("player is now on level 6")
    
}else {
    print("level 6 has not yet been unlocked")
}






























