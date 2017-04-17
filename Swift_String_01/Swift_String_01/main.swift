//
//  main.swift
//  Swift_String_01
//
//  Created by JM Zhao on 2017/4/14.
//  Copyright © 2017年 JunMing. All rights reserved.
//

import Foundation

// 字符串
print("Hello, World!")

// swift 可以自动推断类型, 不需要声明类型
let someString = "some string is none"
var emptyString = ""
var anotherString = String()
if emptyString.isEmpty {

    print("nothing to see here")
}

let newString = someString + emptyString+"!"
emptyString += "kong String is nothing"
print("\(newString)\n\(emptyString)")

for character in newString.characters{

    print(character)
}

for character in emptyString.characters{
    
    print(character)
}

let catCharaters:[Character] = ["C", "a", "t", "i", "🙂", "🐶"]
let catString = String(catCharaters)
print(catCharaters)

// 字符串文字中的特殊字符
// \0 (空字符), \\ (反斜杠), \t (水平选项卡tab键), \n (换行符), \r (回车符), \" (双引号), \' (单引号)
let wiseWords = "\"Image is more import than knoewledge\""
let blsckHeart = "\u{24}"
let dollarSign = "\u{2655}"
let sparklingHeart = "\u{1F496}"

print("\(wiseWords) \n \(blsckHeart) \n \(dollarSign) \n \(sparklingHeart)")

// 计数字符
let unusualMenagerie = "koala , snail, penguin, dromedary"
print("unusualMenagerie has \(unusualMenagerie.characters.count) characters")

// 字符串指数
let greeting = "Guten Tag"
print(greeting.startIndex)
print(greeting[greeting.startIndex])
print(greeting[greeting.index(after: greeting.startIndex)])
print(greeting[greeting.index(before: greeting.endIndex)])
print(greeting[greeting.index(greeting.startIndex, offsetBy:7)])

// 插入
var welcome = "hellow"
welcome.insert("!", at: welcome.endIndex)
print(welcome)

welcome.insert(contentsOf: "world".characters, at: welcome.endIndex)
print(welcome)

// 删除
welcome.remove(at: welcome.index(before: welcome.endIndex))
print(welcome)

let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex
welcome.removeSubrange(range)
print(welcome)

// 比较字符串: swift 提供三种文本值比较方式, 字符串和字符串相等, 前缀和后缀相等
// 字符串和字符串相等
let quotation = "we are a lot alike, you and i"
let sameQuotation = "we are a lot alike, you and i"
if quotation == sameQuotation{

    print("These two string are considered equal")
}

let romeoAndJuliet = [
    
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]

var actSceneCount = 0
for scene in romeoAndJuliet {

    if scene.hasPrefix("Act 1") {
    
        actSceneCount += 1
    }
}
print("there are \(actSceneCount) scenes in act 1")

var mansionCount = 0
var cellCount = 0
for scence in romeoAndJuliet {

    if scence.hasSuffix("Capulet's mansion") {
    
        mansionCount += 1
        
    }else if scence.hasSuffix("Friar Lawrence's cell") {
    
        cellCount += 1
    }
}

print("\(mansionCount) mansion scenes; \(cellCount) cell scenes")

// 字符串的Unicode表示
let dogString = "Dog!!🐶"
for codeUnit in dogString.utf8 {

    print("\(codeUnit) ", terminator: "")
}

print("")












		
