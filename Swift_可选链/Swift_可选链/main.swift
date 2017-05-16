//
//  main.swift
//  Swift_可选链
//
//  Created by JM Zhao on 2017/5/15.
//  Copyright © 2017年 JunMing. All rights reserved.
//

import Foundation

// 可选链代替强制展开
/*
 你可以通过在你希望如果可选项为非nil就调用属性, 方法, 或者脚本的可选值后面使用问好(?)来明确可选链, 这和在可选值后方感叹号来强制展开他的值非常类似, 主要区别在于可选链会在可选项为nil时得体的失败, 二强制展开则在可选项为nil时触发运行时错误
 
 为了显示出可选链在可以在nil值上调用, 可选链电泳的结果一定是一个可选值, 就算你查询到属性, 方法, 或者下标返回的值是费可选, 你可以使用这个可选项返回值来检查可选链调用是成功还是由于链中出现了nil二导致没有成功
 
 另外, 可选链调用的结果与期望的返回值类型相同, 只是包装成了可选项, 通常返回int的属性可以通过可选链后会返回一个Int?
 */

class Residence {
    
    var numberOfRooms = 1
    
}

class Person {
    
    var residence:Residence?
}

// Residence 实例有一个Int 属性叫做numberOfRoom, 它带有默认值1, Person实例有一个Residence?elixir的可选residence属性
// 如果你创建一个新的person实例, 得以与可选项的特想, 他的residence属性会默认初始化为nil, 下面的代码中, john拥有值为nil的residence属性
let john = Person()

// 下面的写法会得到一个error, 因为可选类型 residence:Residence? 并未初始化,
let roomCount = john.residence!.numberOfRooms

// 可选链访问方法
if let roomCount = john.residence?.numberOfRooms {

    print("John residence has \(roomCount) room(s)")
}else {

    print("John residence has \(roomCount) room(s)")
}

// 可选链访问将告诉swift可以吧可选residence属性连接起来并且取回numberOfRooms的值, 如果residence存在的话
// 由于尝试访问numberOfRooms有失败的前缀可能, 可选链尝试返回一个Int?值, 

john.residence = Residence()
if let roomCount = john.residence?.numberOfRooms {
    
    print("John residence has \(roomCount) room(s)")
}else {
    
    print("John residence has \(roomCount) room(s)")
}

// 可选链定义模型类
class Room {

    let name:String
    init(name:String) {
        
        self.name = name
    }
}

class Residence_a {

    var rooms = [Room]()
    var numberOfRooms:Int {
    
        return rooms.count
    }
    
    subscript(i:Int) -> Room{
    
        get {
            return rooms[i]
        }
        
        set {
            rooms[i] = newValue
        }
    }
    
    func printNumberOfRooms() {
        
        print("The number of rooms is \(numberOfRooms)")
    }
    
    var address: Address?
}

class Person_a {

    var residence: Residence_a?
}

class Address {
    
    var buildingName:String?
    var buildingNumber:String?
    var street:String?
    
    func buildingIdentifier() -> String? {
        
        if buildingName != nil {
            
            return buildingName
            
        }else if buildingNumber != nil && street != nil {
        
            return "\(String(describing: buildingNumber)) \(String(describing: street))"
        }else {
            
            return nil
        }
    }
}









































