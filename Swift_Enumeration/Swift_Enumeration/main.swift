//
//  main.swift
//  Swift_Enumeration
//
//  Created by JM Zhao on 2017/4/21.
//  Copyright © 2017年 JunMing. All rights reserved.
//

import Foundation

// 枚举
// Swift中的枚举更灵活，并且不必为每个枚举的情况提供一个值。如果一个值（被称为“原始”的值）被提供给每个枚举的情况下，该值可以是一个字符串，一个字符，或任何整数的值或者浮点型。
// Swift 中的枚举不会像Object-C中一样会被自动分配数字
enum CompassPoint {
    
    case north
    case sourth
    case east
    case west
}

enum Planet {
    
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

var directiontoHead = CompassPoint.west
print(directiontoHead)

// 一旦 directiontoHead 推断为 CompassPoint 类型, 则下面就可以直接使用点语法
directiontoHead = .east
print(directiontoHead)

// 使用开关语句匹配枚举值
directiontoHead = .sourth
switch directiontoHead {

case .north:
    print("Lots of planets have a north")

case .sourth:
    print("Watch out for penguins")

case .east:
    print("Where the sun rises")

case .west:
    print("Where the skies are blue")
}

// 注意: 在switch中使用枚举的情况需要完全列举, 如果有个被省略如 case .west: 没有列举, 自会报错
// 如果想使用不完全枚举, 可以考虑使用default
let somePlanet = Planet.earth
switch somePlanet {

case .earth:
    print("Mostly harmless")
default:
    print("Not a safe place for humans")
}

// 相关值










































