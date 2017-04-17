//
//  main.swift
//  Swift_Collection_Type
//
//  Created by JM Zhao on 2017/4/17.
//  Copyright © 2017年 JunMing. All rights reserved.
//

import Foundation

// Swift 提供三种主要的集合类型, 成为数组, 集合, 和字典

// 创建一个空数组
var someInts = [Int]()
print("someInts is of tyoe [Int] with \(someInts.count) items")
someInts.append(3)
print("someInts is of tyoe [Int] with \(someInts.count) items")
someInts = []
print("someInts is of tyoe [Int] with \(someInts.count) items")

// 创建默认值数组
var threeDoubles = Array(repeating: 0.0, count:3)
print("someInts is of tyoe [Int] with \(threeDoubles.count) items")
print(threeDoubles)

var anotherThreeDoubles = Array(repeating: 2.5, count:3)
print(anotherThreeDoubles)

// 数组直接相加创建新数组
var sumArray = threeDoubles + anotherThreeDoubles
print(sumArray)

// 创建一个字符串数组, 只允许存放字符串, 可以实现声明存储类型, 也可以自动推断
var shoppingList: [String] = ["Egg", "Milk"]
var sList = ["Egg", "Milk"]
print(shoppingList, sList)

// 访问和修改数组方法
print("The shopping list contains \(shoppingList.count) items.")
if shoppingList.isEmpty {

    print("the shopping list is empty")

} else {

   print("the shopping list is not empty")
}

// 往数组添加元素
shoppingList.append("flour")
print("shoppingList array is \(shoppingList)")

shoppingList += ["baking power"]
print("shoppingList array is \(shoppingList)")

shoppingList += ["chocolate spread", "cheese", "butter"]
print("shoppingList array is \(shoppingList)")

// 根据索引替换
shoppingList[0] = "six eggs"
print("shoppingList array is \(shoppingList)")

// 根据范围替换
shoppingList[4...6] = ["bananas", "Apples"]
print("shoppingList array is \(shoppingList)")

// 根据索引插入
shoppingList.insert("Maple Syrup", at: 0)
print("shoppingList array is \(shoppingList)")

// 根据索引移除, 返回新元素
let mapleSyrup = shoppingList.remove(at: 0)
print("shoppingList array is \(mapleSyrup)")

let apples = shoppingList.removeLast()
print("apples array is \(apples)")

// 数组迭代
for item in shoppingList {
    
    print("item is \(item)")
}

for (index, value) in shoppingList.enumerated() {

    print("item \(index + 1): \(value)")
}

// 集合: 集合无序
// 集合类型的哈希值
var letters = Set<Character>()
print("letters is of type Set<Character> With \(letters.count)")

letters.insert("a")
print("letters is of type Set<Character> With \(letters.count)")

letters = []
print("letters is of type Set<Character> With \(letters.count)")

var favoriteGenres:Set<String> = ["Rock", "Classical", "Hip Top"]
print("favoriteGenres is \(favoriteGenres)")

// 注意: 一组类型不能从一个数组单独字面推测，这样的类型Set必须显式声明。但是，由于Swift的类型推断，如果要使用包含相同类型值的数组文字来初始化集合，则不必编写该集合的类型。而初始化favoriteGenres可以用较短的形式写成：
var f: Set = ["Rock", "Classical", "Hip hop"] // Swift 会根据数组内元素相同来推断集合重元素为字符串
print("favoriteGenres is \(favoriteGenres)")

// 访问和修改集合
print("I have \(favoriteGenres.count) favorite music genres")
if favoriteGenres.isEmpty {

    print("as for as music goes , i am not picky")

} else {

    print("i have particular music preferences")
}

favoriteGenres.insert("jazz")
print("I have \(favoriteGenres.count) favorite music genres")

if let removedgenre = favoriteGenres.remove("Rock") {

    print("\(removedgenre) ? i am over it")
} else {

    print("i never much cared for that")
}

// 检查集合是否包含特定项目
if favoriteGenres.contains("Funk") {

    print("i get up on the good foot")
} else {

    print("it is too funky in there")
}

// 迭代
for genre in favoriteGenres {

    print("1== \(genre)")
}

// 迭代后再完成排序后输出
for genre in favoriteGenres.sorted() {

    print("2== \(genre)")
}

// 集合的数学操作
let oddDigits: Set = [1, 3, 5, 7, 9, 2, 8]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

// 1> 交集
let newSet = oddDigits.intersection(evenDigits)
print("\(newSet)")

// 2> 并集
let symmetricSet = oddDigits.symmetricDifference(evenDigits)
print("\(symmetricSet)")

// 3> 并集
let unionSet = oddDigits.union(evenDigits)
print(unionSet)

// 4> 差集
let subtractingSet = oddDigits.subtracting(evenDigits).sorted()
print(subtractingSet)

// 集合成员比较
let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

// 使用该isSubset(of:)方法确定集合的所有值是否包含在指定的集合中
let b = houseAnimals.isSubset(of: farmAnimals)
print("\(b)")

// 使用该isSuperset(of:)方法来确定集合是否包含指定集合中的所有值。
let b1 = farmAnimals.isSubset(of: houseAnimals)
print("\(b1)")

// 使用该isDisjoint(with:)方法确定两个集合是否没有共同的值。
let b2 = cityAnimals.isDisjoint(with: farmAnimals)
print("\(b2)")

// 使用isStrictSubset(of:)或isStrictSuperset(of:)方法来确定集合是子集还是超集，但不等于指定集。
let b3 = farmAnimals.isStrictSubset(of: houseAnimals)
print("\(b3)")


// 字典
// 创建空字典
var namesOfIntegers = [Int:String]()
print(namesOfIntegers)

namesOfIntegers[16] = "sixteen"
print(namesOfIntegers)

namesOfIntegers = [:]
print(namesOfIntegers)

// 创建一个字典的字典
var airports:[String:String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
print(airports)

var airp = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
print(airp)

// 访问和修改字典
print("the airpots dictionary countains \(airports.count) items")
if airports.isEmpty {

    print("the airports dictionary is empty")
    
} else {

    print("the airports dictionary is not empty")
}

airports["LHR"] = "london hearthrow"

if let oldValues = airports.updateValue("Dublin Airport", forKey: "DDD") {

    print("the old value for dub was \(oldValues)")
}

print("\(airports)")

if let airportName = airports["DUB"] {

    print("The name of the airport is \(airportName).")
}else {

    print("That airport is not in the airports dictionary.")
}

// 根据key删除字典
airports["APL"] = "Apple International"
print(airports)

// airports["APL"] = nil
airports.removeValue(forKey: "APL")
print(airports)

// 字典迭代
for (key, values) in airports {

    print("key is \(key), values is \(values)")
}

// 如果你需要使用字典的键或值与需要的一个API Array实例，初始化的新阵列keys或values财产：
let keys = [String](airports.keys)
let values = [String](airports.values)
print(keys, values)


