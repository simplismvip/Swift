//
//  main.swift
//  Swift_Closures
//
//  Created by JM Zhao on 2017/4/18.
//  Copyright © 2017年 JunMing. All rights reserved.
//

import Foundation

// Closures: 闭包
// 闭包是独立功能的块, Swift中的闭包类似于C 和Object-C中的块, 闭包可以从定义它的上下文中捕获并存储任何常量和变量的引用

// 闭包表达式是一种以简短而集中的语法编写内联闭包的方法。关闭表达式提供了几种语法优化，以缩短形式写入闭包，而不会失去清晰度或意图。下面的闭包表达式示例通过sorted(by:)在多个迭代中改进方法的单个示例来说明这些优化，每个迭代以更简洁的方式表示相同的功能。

// 分类方法, Swift的标准库提供了一种方法sorted(by:)，该方法根据您提供的排序闭包的输出对已知类型的值进行排序。一旦完成排序过程，该sorted(by:)方法将返回与旧的数组相同的类型和大小的新数组，其中的元素按正确的排序顺序排列。原始数组不被该sorted(by:)方法修改。

// Swift 中sorted(by: ) 方法以字符串相反的字母顺序对值的数组进行排序, 这是要排序的初始数组
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

// sorted(by: )接收一个闭包, 它接收于数组内容相同类型的两个参数, 并返回一个bool值, 以说明一旦值被排序, 第一个值应该出现在第二个值之前或者之后. 
// 这个例子排序的是 String 值的数组, 因此排序关闭需要的是一个类型函数 (String, String) -> Bool

// 将闭包提供给方法, 并且作为参数
func backward(_ s1:String, _ s2: String) -> Bool {

    return s1 > s2
}

func addward(_ s1:String, _ s2:String) -> String {

    return s1 + s2
}

var reversedNames = names.sorted(by: backward)
print(reversedNames)

var backType:(String, String) -> Bool = backward
var addType:(String, String) -> String = addward
func funcType(back:(String, String) -> Bool, addType:(String, String) -> String, s1:String, s2:String) -> (s1:String, s2:String) {

    let string = back(s1, s2) ? addType(s1, s2) : "\(s1)*\(s2)"
    return (string, "\(s1)--\(s2)")
}

let stype = funcType(back: backType, addType: addType, s1: "b", s2: "a")
print(stype)

let fuw = funcType(back: {(s1: String, s2: String) -> Bool in
    
    return s1 > s2

}, addType: {(s1:String, s2:String) -> String in
    
    return s1 + s2

}, s1: "a", s2: "b")

print(fuw)

// 闭包表达式写法
/*
 
 {  (参数) -> 返回值类型 in
 
    声明
 }
 
 */

let numbers:Array<Int> = [12, 4, 5, 2, 43, 56, 3, 42, 9]
let nu = numbers.sorted(by: { (n1: Int, n2: Int) -> Bool in

    return n1 > n2
})

// 尾随闭包
let digitnames = [0: "Zero", 1: "One", 2: "Two", 3: "Three", 4: "Four", 5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"]
let nums = [16, 58, 510]

let strings = nums.map { (number) -> String in
    
    var number = number
    var output = ""
    repeat {
    
        output = digitnames[number % 10]! + output
        number /= 10
        
    } while number > 0
    
    return output
}

print(strings)

// 获取闭包中的数值: 闭包可以从定义它的周围上下文中捕获常量和变量。即使定义常量和变量的原始范围不再存在，闭包也可以引用并修改这些常量和变量的值。
func makeIncrementer(forIncrement amount: Int) -> () -> Int {

    var runningTotal = 0
    func incrementer() -> Int {
        
        runningTotal += amount
        return runningTotal
    }
    
    return incrementer
}

let incrementer = makeIncrementer(forIncrement: 10)
print(incrementer())
print(incrementer())
print(incrementer())

let incrementBySeven = makeIncrementer(forIncrement: 7)
print(incrementBySeven())
print(incrementer())

// 闭包是引用类型
// 在上面的例子中，incrementBySeven和incrementer是常量，但是这些常量引用的闭包仍然能够增加runningTotal他们捕获的变量。这是因为函数和闭包是引用类型。
// 无论何时为常量或变量分配函数或闭包，您实际上将该常量或变量设置为对函数或闭包的引用。在上面的例子中，它incrementer指的是闭包的选择是不变的，而不是封闭本身的内容。

let reference = incrementer
print(reference())

// 逃逸闭包: 如果一个闭包被作为一个参数传递给一个函数,并且在函数return之后才被唤起执行,那么这个闭包是逃逸闭包.并且这个闭包的参数是可以“逃出”这个函数体外的.
var completionHandlers:[() -> Void] = []

// 这个例子中闭包被放进数组 completionHandlers 中, 在函数执行完毕的时候闭包并未执行, 因此要用逃逸闭包, Swift中默认是非逃逸闭包, 因此使用逃逸闭包的时候需要在闭包前添加关键字 @escaping
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {

    completionHandlers.append(completionHandler)
}

func someFunctionWithNonescapingClosure(closure: () -> Void) {

    closure()
}

class SomeClass {
    
    var x = 10
    func doSomething() {
        
        someFunctionWithEscapingClosure {
            self.x = 100
        }
        
        someFunctionWithNonescapingClosure {
            x = 200
        }
    }
}

let instance = SomeClass()
instance.doSomething()
print(instance.x)

completionHandlers.first?()
print(instance.x)

// 自动闭包: 一个autoclosure是自动创建来包装被真实作为参数传递给函数的表达式的封闭件
// 自动闭包可以让一段代码延迟执行, 只有在需要执行的地方才开始执行, 这在依稀而比较消耗性能的地方十分有帮会组
var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count)
// Prints "5"

let customerProvider = {customersInLine.remove(at: 0)}
print(customersInLine.count)
// Prints "5"

print("now serving \(customerProvider()) !")
print(customersInLine.count)
// Prints "4"

// 从以上打印的结果来看, 在调用闭包之前, 数组元素没有被删除, 如果不调用闭包, 数组元素永远不会被删除, 闭包起到了延迟调用的作用

// 因而如果将闭包作为参数传递给函数的时候, 也会得到延迟调用的作用
func server(customer customerProvider: @autoclosure () -> String) {

    print("now serving \(customerProvider())")
}

// 没有添加@autoclosure关键字操作
// server(customer: {customersInLine.remove(at: 0)})

// 添加@autoclosure关键字, 可以直接写参数而不用写闭包, 像传递字符串参数一样传递闭包
server(customer: customersInLine.remove(at: 0))

// 逃逸闭包和自动闭包同时使用
var customerProviders:[() -> String] = []

func collectCustomerProviders(_ customerProvider:@autoclosure @escaping () -> String ) {

    customerProviders.append(customerProvider)
}

collectCustomerProviders(customersInLine.remove(at: 0))
collectCustomerProviders(customersInLine.remove(at: 0))
print("Collected \(customerProviders.count) closures.")

for customerProvider in customerProviders {
    print("Now serving \(customerProvider())!")
}

// 在上面的代码中，函数不是调用传递给它的customerProvider参数作为参数，而是collectCustomerProviders(_:)将闭包附加到customerProviders数组。该数组被声明在函数的范围之外，这意味着数组中的闭包可以在函数返回后执行。因此，customerProvider必须允许参数的值转义该函数的作用域













































