//
//  main.swift
//  Swift_Inheritance
//
//  Created by JM Zhao on 2017/5/3.
//  Copyright © 2017年 JunMing. All rights reserved.
//

import Foundation

// 继承

// 1> 定义一个基类: 不从任何类继承的类都是所谓基类
// 注意: Swift 类 会从 个通 基类继承。你没有指定特定 类的类都会以基类的形式创建。
// 下面的例子定义了一个叫做Vehicle的基类, 这个基类定义了成为currentSpeed的存储属性, 默认0.0, currentSpeed属性的值备用在一个成为description的String 只读计算属性来创建一个 Vehicle的描述
// Vehicle 基类也定义了一个makeNoise的方法, 这个方法实际上不会为这个Vehicle 基类的实例做任何事, 但是稍后他可以被Vehicle的子类定义

class Vehicle {
    
    let name = "Car_1"
    var currentSpeed = 0.0
    var description: String {
    
        return "traveling at \(currentSpeed) miles per hour"
    }
    
    func makeNoise() {
        
        // 空实现
    }
}

let someVehicle = Vehicle()
print("Vehicle: \(someVehicle.description)")

/*
// 子类
class SomeSubclass: SomeSuperclass {

    // 子类描述写在这里
}
*/

class Bicycle: Vehicle {
    
    var hasBasket = false
}

let bicycle = Bicycle()
bicycle.hasBasket = true
bicycle.currentSpeed = 15.0
print("Bicycle: \(bicycle.description)")

// 子类本身也可以被继承, 下个例子创建一个Bicycle的子类, 成为tandem两座自行车
class Tandem:Bicycle {

    var currentNumberOfPassengers = 0
}

let tandem = Tandem()
tandem.hasBasket = true;
tandem.currentSpeed = 22.0
tandem.currentNumberOfPassengers = 2
print("Tandem: \(tandem.description)")

// 重写
// 子类可以提供自己的实例方法, 类型方法, 实例属性, 类型属性或下标脚本的自定义实现, 否则会从父类继承, 这就是重写
// 要重写而不是继承一个特征, 你需要在你的重写定义前面添加override 关键字, 说明你打算重写而不是一外地提供一个相同的定义

// 访问父类的方法, 属性, 下标脚本
// 子类中使用super前缀访问父类的方法, 属性, 或者下标
//  个命名为 someMethod() 的重写 法可以通过

// 重写方法
class Train: Vehicle {
    
    override func makeNoise() {
        
        print("Choo Choo")
    }
}

let train = Train()
train.makeNoise()

// 重写属性
/*
 你可以提供 个 定义的Getter(和Setter，如果合适的话)来重写任意继承 的属性， 论在最开始继承的属性实现为储属性还是计算属性。继承的属 性是存储还是计算属性 对 类透明——它仅仅知道继承的属性有个特定 名字和类型。你必须声明你重写的属性名字和类型，以确保编译 可以检 查你的重写是否匹配  类中有相同名字和类型的属性。

 */

class Car: Vehicle {

    var gear = 1
    override var description: String {
        
        return super.description + "in gear \(gear)"
    }
    
    // Swift 可以吧存储属性覆盖为计算属性, 但是不能把计算属性覆盖为存储属性
    override var currentSpeed: Double {
    
        get {
            return 10
        }
        
        set {
            self.currentSpeed = newValue;
        }
    }
}































































