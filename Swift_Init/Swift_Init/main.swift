//
//  main.swift
//  Swift_Init
//
//  Created by JM Zhao on 2017/5/3.
//  Copyright © 2017年 JunMing. All rights reserved.
//

import Foundation

// 初始化
/*
 初始化视为类, 结构体, 枚举准备实例的过程, 这个过程需要给实例里的每一个存储属性设置一个初始值并且在新实例可以使用之前
 执行任何其他所必须的配置或初始化, 
 你通过定义初始化器来实现这个初始化过程, 它更像是一个用来创建特定类型新势力的特殊方法, 不同于OC中的初始化器, Swift中初始化器不返回值
 这些初始化器主要的角色就是确保早第一次使用之前某类型的新实例能够正确初始化
 类类型的实例同样可以实现一个反初始化器, 他会在这个类的实例被释放之前执行任意的自定义清理,
 */

// 为存储属性设置初始化值
// 在创建类和结构体的实例时必须为所有的存储属性设置一个合适的初始值, 存储属性不能遗留在不确定状态

/*
 
 初始化器
 初始化器在创建特定类型的实例时被调用, 在这个简单的形式中, 初始化器就像是一个没有参数的实例方法, 使用init 关键字
 init() {

     // 初始化操作写在这里
 }
*/

struct Fahrenheit {
    var temperature: Double
    init() {
        temperature = 32.0
    }
}

var f = Fahrenheit()
print("The default temperature is \(f.temperature) Fahrenheit")

// 默认属性
struct Fahrenheits {

    var temperature = 32.0
}

// 自定义初始化
struct Celsius {

    var temperatureinCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureinCelsius = (fahrenheit - 32.0) / 1.8
    }
    
    init(fromKelvin kelvin: Double) {
        temperatureinCelsius = kelvin - 273.15
    }
}

let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
let freezingPointOfWater = Celsius(fromKelvin: 273.15)

// 形式参数名和实际参数名
struct Color {

    let red, green, blue: Double
    init(red: Double, green: Double, blue: Double) {
        
        self.red = red
        self.green = green;
        self.blue = blue
    }
    
    init(white: Double) {
        
        red = white;
        green = white;
        blue = white
    }
}

let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
let halfGray = Color(white: 0.5)
// let varyGreen = Color(0.0, 1.0, 0.0)

// 无实际参数表情和初始化器形式参数
// 如果不想为初始化器形式参数使用实际参数标签, 可以写一个下环线 _ 替代明确的时机参数标签可以重写默认行为

struct Celsius_a {
    var temperatureInCelsius:Double
    init(fromFahrenheit fahrenheit: Double) {
        
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    
    init(fromKelvin kelvin: Double) {
        
        temperatureInCelsius = kelvin - 237.15
    }
    
    init(_ celsius: Double) {
        
        temperatureInCelsius = celsius
    }
}

let bodyTemperature = Celsius_a(37.0)

// 可选属性类型
// 如果自定义类型有一个逻辑上是允许无值存在, 则需要使用可选属性类型
class SurveyQuestion {

    var text: String
    var response: String?
    init(text: String) {
        
        self.text = text;
    }
    
    func ask() {
        
        print(text)
    }
}

let cheeseQuestion = SurveyQuestion(text: "Do you like cheese ?")
cheeseQuestion.ask()
cheeseQuestion.response = "Yes, I do like chess"

// 在初始化中非配常量属性
// 在初始化的任意时刻, 都可以为常量属性赋值, 只要他在初始化结束的时候设置了确定的值即可, 一旦设置常量属性被赋值, 就不能再更改了
// 注意: 对于类实例俩说, 常量属性在初始化中只能通过引用的类来修改, 她不能被子类修改
class SurveyQuestion_a {
    
    let text: String
    var response: String?
    init(text: String) {
        
        self.text = text;
    }
    
    func ask() {
        
        print(text)
    }
}

// 默认初始化器
class ShoppingListItem {
    var name: String?
    var quantity = 1
    var purchased = false
}

var item = ShoppingListItem()

// 结构体类型的成员初始化器
// 如果结构体中没有任何自定义初始化器, 他会自动获取一个成员初始化器, 不同于默认初始化器, 结构体会接收成员初始化器即使他的存储属性没有默认值
// 这个成员初始化器是一个快速初始化新结构体实例成员属性的方式, 新实例的属性初始值可以通过名称传递到成员初始化器里

struct Size {
    var width = 0.0, height = 0.0
}

let twoByTwo = Size(width: 2.0, height: 2.0)

// 值类型的初始化器委托
// 初始化器可以调用其他初始化器来执行部分实例的初始化, 这个过程叫做初始化器委托
// 初始化器委托的运作, 以及允许哪些形式的委托, 这些规则对于值类型和类类型是不同的, 值类型不支持继承, 所以他们的初始化器委托过程相当简单, 因为他们只能提供他们自己为另一个初始化器委托, 但是类可以继承, 这意味着类有额外的责任确保他们继承的所有存储属性在初始化期间都分配了一个合适的值, 这些责任在下边的类的继承和初始化里做详细描述

// 对于值类型, 当自定义的初始化器可以使用 self.init 从相同的值类型里引用其他初始化器, 你只能从初始化器里调用 self.init
// 如果你为值类型低昂一了自定义初始化器, 你就不能访问那个类型的默认初始化器

struct Size_a {
    var width = 0.0, height = 0.0
}

struct Point_a {
    var x = 0.0, y = 0.0
}

struct Rect_a {
    
    var origin = Point_a()
    var size = Size_a()
    init() {}
    init(origin: Point_a, size: Size_a) {
        
        self.origin = origin
        self.size = size
    }
    
    init(center: Point_a, size: Size_a) {
        
        let originX = center.x - size.width / 2
        let originY = center.y - size.height / 2
        self.init(origin: Point_a(x: originX, y: originY), size: size)
    }
}

// 类的继承和初始化
// 所有类的存储属性-包括从他的傅雷继承的所有属性, 都必须在初始化期间分配初始值
// Swift为类类型定义了两种初始化器以确保所有的存储属性接收一个初始值, 这些就是所谓的之低昂初始化器和便捷初始化器

// 指定初始化器和便捷初始化器
// 指定初始化器是类的主要初始化器, 指定的初始化器可以初始化所有那个类引用的属性并且会调用合适的父类初始化器接续初始化过程给父类链
// 类偏向于少量指定初始化器, 并且一个类通常只有一个指定初始化器, 指定初始化器是初始化开始并且持续初始化过程到父类链的传送点
// 每个类有一个指定初始化器, 如同自动初始化器的继承描述的那一, 在默写情况下, 这些需求通过从父类继承一个或多个指定初始化器来满足

// 便捷初始化器是次要的, 为一个类支持初始化器, 你可以子在相同的类里定义一个便捷初始化器来调用指定初始化器为便捷初始化器来给指定初始化器设置默认形式参数, 你也可以为具体的使用情况或输入的值类型定义一个便捷初始化器从而促进这个列的实例
// 如果你的类不需要便利初始化器你可以不提供他, 在为通用初始化模式创建快捷方式以节省时间或者类的初始化更加清晰明了的时候创建便捷初始化器

// 指定初始化器和便捷初始化器语法
// 用与值类型的简单初始化器相同的方式俩写类的指定初始化器
/*
 // 指定初始化器
    init(paraments) {

        statements
    }
 
 // 便捷初始化器
     cenvenience init(paraments) {
 
         stataments
     }
*/

// 类类型的初始化器委托
// 类类型初始化器之间的委托调用有以下三个规则
// 规则1> 指定初始化器必须从他的直系父类调用指定初始化器
// 规则2> 便捷初始化器必须从相同的类里调用另一个初始化器
// 规则3> 便捷初始化器最终必须滴啊用一个指定初始化器
// 简单记忆以上规则方法: 指定初始化器必须总是向上委托, 遍历初始化器必须总是横向委托

// 两段式初始化
// Swift的初始化是一个两段式过程, 在第一阶段, 每一个存储属性被引入类分配一个初始值, 一旦每个存储属性的初始状态被确定, 第二个阶段就开始了, 每个类都有机会子啊新的实例准备使用之前来定制他的存储属性
// 两段式初始化过程的使用让初始化更加安全, 同事在每个类的成绩结构给与了完备的灵活性, 两段式初始化过程可以防止属性值在初始化之前被访问, 还可以防止属性被另一个初始化器意外的赋予不同的值

// 初始化器的继承和重写
// Swift的子类不会默认继承弗雷德初始化器, Swift的这种机制防止父类的简单初始化器被一个更专用的子列继承并用来创建一个没有完全或错误初始化的新势力的发生
// 

class Vehicle {
    
    var numberOfWheels = 0
    var description:String {
    
        return "\(numberOfWheels) wheels"
    }
}

let vehicle = Vehicle()
print("vehicle: \(vehicle.description)")

class Bicycle: Vehicle {
    
    override init() {
        super.init()
        numberOfWheels = 2
    }
}

let bicycle = Bicycle()
print("Bicycle: \(bicycle.description)")

// 注意: 子类可以在初始化时修改继承的变量属性, 但是不嗯呢刚修改继承过来的常量属性
// 自动初始化器的继承
// 如上所述, 子类默认不会继承父类初始化器, 总之, 在特定情况下父类初始化器可以被自动继承, 实际上, 这意味着在许多场景中你不必重写父类初始化器, 只要可以安全操作, 你就可以毫不费力的继承父类初始化器
// 假设你为你的子类引入的任何新的属性都提供了默认值, 请遵守一下两个规则
// 规则 1> 如果你的子类没有任何指定初始化器, 他会自动继承父类所有的指定初始化器 规则 2> 如果你的子类提供了所有父类指定初始化器的实现---要么是通过规则1> 继承来的, 要么通过在定义中提供自定义实现的, 那么他将自动继承所有的父类便捷初始化器

// 指定和便利初始化器的操作
class Food {

    var name: String
    init(name: String) {
        
        self.name = name
    }
    
    convenience init() {
    
        self.init(name: "[Unnamed]")
    }
    
}

let namemeat = Food(name:"bacon")
let mySteryMeat = Food()

class RecipeIngredient: Food {
    
    var quantity: Int
    init(name: String, quantity: Int) {
        
        self.quantity = quantity
        super.init(name: name)
    }
    
    override convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
}

class ShoppingListItem_a: RecipeIngredient {
    
    var purchased = false
    var description: String {
    
        var output = "\(quantity) x \(name)"
        output += purchased ? "✅":"❎"
        return output
    }
}

// 类 RecipeIngredient 有一个指定初始化器和一个便利初始化器

// 可失败初始化器
// 定义类, 结构体或者枚举初始化时可以失败在某些情况下会有大用处, 这个失败可以由一下集中当时触发, 包括给初始化传入无效的形式参数, 或者缺少某种外部所需要的资源, 又或者其他阻止初始化的情况
// 为了处理可失败的情况, 在类, 结构体, 或者枚举中定义一个或者多个可失败初始化器, 通过init关键字后面添加?来写
// 注意; 无法定义可失败和非可失败的初始化器为相同的形式参数类型和名称
// 可失败的初始化器创建了一个初始化类型的可选值, 你可以通过在可失败初始化器写return nil语句, 来表明可失败初始化器在何种情况下会触发初始化失败
// 例如: 可失败初始化器为数字类型转换器做实现, 为了确保数字类型转换保持值不变, 使用init(exactly:)初始化器, 如果无法保持值不变, 则初始化失败
let wholeNumber: Double = 12345.0
let pi = 3.14159
if let valueMaintained = Int(exactly:wholeNumber) {

    print("\(wholeNumber) conversion to int maintains value")
}

let valueChanged = Int(exactly:pi)
if valueChanged == nil {

    print("\(pi) conversion to int maintains value")
}

struct Animal {
    
    let species:String
    init?(species: String) {
      
        if species.isEmpty { return nil }
        self.species = species
    }
}

let someCreature = Animal.init(species: "Giraffe")
if let giraffe = someCreature {

    print("An animal was initialized with a species of \(giraffe.species)")
}

let anonymousCreature = Animal.init(species: "")
if anonymousCreature == nil {
    
    print("An animal was not initialized")
}

// 枚举的可失败初始化器
// 可以使用一个可失败初始化器来在带一个或者多个形式参数的枚举中选择合适的情况, 如果提供的形式参数没有匹配合适的情况初始化器就可能会失败
enum TemperatureUnit {

    case Kelvin, Celsius, Fahrenheit
    init?(symbol:Character) {
        
        switch symbol {
            
        case "K":
            self = .Kelvin
        case "C":
            self = .Celsius
        case "F":
            self = .Fahrenheit
        default:
            return nil
        }
    }
}

let fahrenheitUnit = TemperatureUnit(symbol: "F")
if fahrenheitUnit != nil {

    print("This is a defined temperature unit, so initialization succeeded")
}

let unknownUnit = TemperatureUnit(symbol: "X")
if unknownUnit == nil {

    print("This is a defined temperature unit, so initialization failed")
}

// 带有原始值的枚举会自动获取一个可失败初始化器 init?(rawValue:), 改可失败初始化器接收一个名为rawValue的合适的原始值类型形式参数如果找到了匹配的枚举情况就可以选择其一, 或者没汇总爱到匹配的值就触发初始化失败
enum TemperatureUnit_a:Character {

    case Kelvin = "K", Celsius = "C", Fahrenheit = "F"
}

let fahrenheitUnit_a = TemperatureUnit_a(rawValue: "F")
if fahrenheitUnit != nil {
    
    print("This is a defined temperature unit, so initialization succeeded")
}


let unknownUnit_a = TemperatureUnit_a(rawValue: "X")
if unknownUnit == nil {
    
    print("This is a defined temperature unit, so initialization failed")
}

// 初始化失败的传递
// 类结构体或者枚举的可失败初始化器可以横线委托到同一个类, 结构体或者枚举里的另一个可失败初始化器, 类似的, 子列的可失败初始化器可以向上委托到父类的可失败初始化器
// 无论哪种情况, 如果你委托到另一个初始化器导致了初始化失败, 那么整个初始化过程也会立即失败, 并且任何初始化代码都不会执行
class Product {

    let name: String
    init?(name: String) {
        if name.isEmpty {return nil}
        self.name = name
    }
    
}

class CartItem: Product {
    
    let quantity: Int
    init?(name: String, quantity: Int) {
        
        if quantity < 1 {return nil}
        self.quantity = quantity;
        super.init(name: name)
    }
}

// 这时会正确初始化
if let twoSocks = CartItem.init(name: "sock", quantity: 2) {

    print("item: \(twoSocks.name), quantity: \(twoSocks.quantity)")
}

// 这时因为 quantity = 0导致初始化失败
if let zeroShirts = CartItem.init(name: "shirt", quantity: 0) {

    print("item: \(zeroShirts.name), quantity: \(zeroShirts.quantity)")
}else {

    print("Unable to initialoze zero shirts")
}

// 这时因为 name 为空导致初始化失败
if let oneUnnamed = CartItem.init(name: "", quantity: 1) {

    print("item: \(oneUnnamed.name), quantity: \(oneUnnamed.quantity)")
}else {

    print("Unable to initialoze zero shirts")
}

// 重写可失败初始化器
// 可以在子类中重写父类的可失败初始化器, 就好比其他的初始化器, 或者你可以使用子类的非可失败初始化器重写父类的可失败初始化器, 这样允许你定义一个初始化不会失败的子列, 尽管父类的初始化允许失败
// 如果你用非可失败的之类初始化器重写了一个可失败初始化器, 向上委托到附列初始化器的唯一办法就是强制展开父类可失败初始化器的结果
class Document {

    var name:String?
    
    init() {}
    init?(name: String) {
        
        self.name = name;
        if name.isEmpty {return nil}
    }
}

class AutomaticallyNamedDocument: Document {
    
    override init() {
    
        super.init()
        self.name = "[Unitled]"
    }
    
    override init(name: String) {
        
        super.init()
        if name.isEmpty {
            
            self.name = "[Unitled]"
        }else {
        
            self.name = name
        }
    }
}

// AutomaticallyNamedDocument 类用非可失败的init(name:) 重写了父类可失败初始化器init(name:), 因为AutomaticallyNamedDocument 类用不同方式处理了空字符串的情况, 他的初始化器不会失败, 所以它提供了非可失败初始化器俩代替
// 你可以在初始化器里使用强制展开来付出父类调用一个可失败初始化器作为子类非可失败车速会花裙的一部分
class UntitledDocument: Document {

    override init() {
        
        super.init(name: "[Untitled]")!
    }
}
// 这种情况下, 如果父类的init(name: )初始化器曾以空字符串做名字调用, 强制展开操作会导致运行时错误, 总之, 由于他强调了一个字符畅想, 那么你可以看到初始化器不会失败, 所以这时不会有运行时错误发生
// 可失败初始化器init !
// 通常来讲我们通过在init 关键字后添加 ? 的方式来定义一个可失败初始化器以创建一个合适的类的可选项实例, 另外, 你也可以使用可失败初始化器创建一个隐式展开具有合适类型的可选项实例, 通过在init后面添加惊叹号(init !)而不是问号
// 可以在init? 初始化器中为托调用init! 初始化器, 反之亦然, 你也可以使用init! 重写inti?, 反之亦然, 你还可以使用init委托调用init!, 尽管init!初始化器导致初始化失败时会触发断言

// 必要初始化器
// 在类的初始化器钱添加required 修饰符, 来表明所有该类的子类都必须实现该初始化器
class someclass {

    required init() {
    
        
    }
}

// 当子类从写父类的必要初始化器时, 必须在子类的初始化器前同样添加required 修饰符以确保当其他子列继承该类是, 该初始化为必要初始化器, 而此时子类重写父类初始化器时不需要添加ovrride关键字
class SomeSubClass: someclass {

    required init() {
        
        // 注意: 如果子列继承的初始化器能够满足需求吗子你无须显示在子列中提供必要初始化器的实现
    }
}

// 通过闭包和函数来设置属性的默认值
// 如果某个存储属性的默认值需要自定义或者设置, 你可以使用闭包或者全局函数来为属性提供默认值, 当这个属性属于是实例初始化时, 闭包或者函数就会被调用, 并且它的返回值就会作为属性的默认值
// 这种闭包或者函数通常会创建一个和属性相同的临时值, 处理这个值以表示初始的状态, 并且把这个临时值返回作为属性的默认值
// 这种闭包或者函数通常会创建一个和属性相同的临时值, 处理这个值以表示初始状态, 并且把这个临时值返回作为属性默认值

/*
class SomeClass_a {

    let someProperty: SomeType = {
    
        return someValue
    }()
    
}
*/
// 注意如果花括号的结尾跟一个没有参数的圆括号, 这是告诉Swift 立即执行, 如果你忽略了这对圆括号, 你就胡IBA闭包作为值付给了属性且不会范湖闭包值
// 注意: 如果你使用闭包俩初始化属性, 请记住闭包执行的时候, 实例的其他部分还没有被初始化, 这就意味着你不能在比暴力读取任何其他的属性, 即使这些属性有默认值, 你也不能隐士self属性, 或者调用实例方法

















































