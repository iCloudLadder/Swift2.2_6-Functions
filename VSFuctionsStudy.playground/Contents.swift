//: Playground - noun: a place where people can play

import UIKit

// 函数
/*
 函数是用来完成特定任务的独立的代码块。
 你给一个函数起一个合适的名字,用来标识函数做什么,并且当函数需要执行的时候,这个名字会被用于“调用”函数。
 
 
 
 在 Swift 中,每个函数都有一种类型,包括函数的参数类型和返回类型。
 你可以把函数类型当做任何其他普通变量类型一样处理,这样就可以更简单地把函数当做别的函数的参数,也可以从其他函数中返回函数。
 函数的定义可以写在其他函数定义中,这样可以在嵌套函数范围内实现功能封装。
 */


/*
 可以定义一个或多个有名字和类型的值,作为函数的输入(称为参数,parameters),也可以定义某种类型的值作为函数执行结束的输出(称为返回类型,return type)
 
 每个函数有个函数名,用来描述函数执行的任务。
 要使用一个函数时,你用函数名“调用”,并传给它匹配的输 入值(称作实参,arguments)。一个函数的实参必须与函数参数表里参数的顺序一致。
 */

func exampleFunction(onePara: Int) ->String {
    return "The parameter is \(onePara)"
}

let returnValue = exampleFunction(5)



// 无参数函数
func noParameter() ->String {
    return "This is a no parameter function"
}

// 多参函数
func sayHello(personName: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return "Hello again \(personName)"
    } else {
        return "Hello \(personName)"
    }
}
print(sayHello("Tim", alreadyGreeted: true))

// 调用函数时，函数的返回值可以被忽略。返回值可以被忽略,但定义了有返回值的函数必须返回一个值，否则报编译时error
sayHello("Swift", alreadyGreeted: true)

// 无返回值函数 函数不需要返回值时,这个函数的定义中没有返回箭头(->)和返回类型。
func noReturnValue(para: String) {
    print("The parameter is \(para)")
}
/*
 严格上来说,虽然没有返回值被定义,sayGoodbye(_:) 函数依然返回了值。没有定义返回类型的函数会返回特 殊的值,叫 Void 。
 它其实是一个空的元组(tuple),没有任何元素,可以写成 () 。
 */





// 多重返回值函数, 可以用元组(tuple)类型让多个值作为一个复合值从函数中返回。
func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        } }
    return (currentMin, currentMax)
}

let bounds = minMax([8, -6, 2, 109, 3, 71])
 print("min is \(bounds.min) and max is \(bounds.max)")
 print("min is \(bounds.0) and max is \(bounds.1)")




// >>  可选元组返回类型
/*
 如果函数返回的元组类型有可能整个元组都“没有值”,你可以使用可选的(Optional) 元组返回类型反映整个 元组可以是 nil 的事实。你可以通过在元组类型的右括号后放置一个问号来定义一个可选元组,例如 (Int, In t)? 或 (String, Int, Bool)?
 
 
 可选元组类型如 (Int, Int)? 与元组包含可选类型如 (Int?, Int?) 是不同的.可选的元组类型,整个元组是可选 的,而不只是元组中的每个元素值。
 */

func minMaxOptional(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty { return nil }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

if let bounds = minMaxOptional([8, -6, 2, 109, 3, 71]) {
    print("min is \(bounds.min) and max is \(bounds.max)")
}




// >> 函数参数名称

// 函数参数都有一个外部参数名(external parameter name)和一个局部参数名(local parameter name)。
// 外部 参数名用于在函数调用时标注传递给函数的参数,局部参数名在函数的实现内部使用。

/*
 
 */
func someFunction(firstParameterName: Int, secondParameterName: Int) {
    // function body goes here
    // firstParameterName and secondParameterName refer to
    // the argument values for the first and second parameters
}
/*
 一般情况下,第一个参数省略其外部参数名,第二个以及随后的参数使用其局部参数名作为外部参数名。所有参
 数必须有独一无二的局部参数名。尽管多个参数可以有相同的外部参数名,但不同的外部参数名能让你的代码更
 有可读性。
 */
someFunction(1, secondParameterName: 2)





// >>  指定外部参数名
// 在局部参数名前指定外部参数名,中间以空格分隔:
func someFunction(externalParameterName localParameterName: Int) {
    // function body goes here, and can use localParameterName
    // to refer to the argument value for that parameter
}

// *** 如果你提供了外部参数名,那么函数在被调用时,必须使用外部参数名。

func sayHello(to person: String, and anotherPerson: String) -> String {
    return "Hello \(person) and \(anotherPerson)!"
}
print(sayHello(to: "Bill", and: "Ted"))






// >> 忽略外部参数名

// 用一个下划线( _ )代替一个明确的参数名 , 来为第二个及后续的参数设置外部参数名
// 第一个参数默认忽略其外部参数名称,显式地写下划线是多余的。
func someFunction(firstParameterName: Int, _ secondParameterName: Int) {
// function body goes here
    // firstParameterName and secondParameterName refer to
    // the argument values for the first and second parameters
}
someFunction(1, 2)



// >> 默认参数值
// 可以在函数体中为每个参数定义 默认值(Deafult Values) 。当默认值被定义后,调用这个函数时可以忽略这 个参数。
func someFunction(parameterWithDefault: Int = 12) {
    // function body goes here
    // if no arguments are passed to the function call,
    // value of parameterWithDefault is 12
}
someFunction(6) // parameterWithDefault is 6
someFunction() // parameterWithDefault is 12

// 将带有默认值的参数放在函数参数列表的最后。这样可以保证在函数调用时,非默认参数的顺序是一致的,同时使得相同的函数在不同情况下调用时显得更为清晰

func testDefaultValues(para: Int, para0: Int = 1, para1: Int = 2, para2: Int) -> Int {
    return para + para0 + para1 + para2
}
testDefaultValues(3, para2: 4)
testDefaultValues(5, para0:7, para2: 6)
testDefaultValues(5, para1:8, para2: 6)
testDefaultValues(5,  para0:7, para1:8, para2: 6)





// >> 可变参数
/*
 
 ***** 一个函数最多只能有一个可变参数。
 
 一个可变参数(variadic parameter) 可以接受零个或多个值。函数调用时,你可以用可变参数来指定函数参数 可以被传入不确定数量的输入值。通过在变量类型名后面加入 (...) 的方式来定义可变参数
 
 *** 可变参数的传入值在函数体中变为此类型的一个数组
 
 *** 如果函数有一个或多个带默认值的参数,而且还有一个可变参数,那么把可变参数放在参数表的最后。
 */

func arithmeticMean(numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}

arithmeticMean(1, 2, 3, 4, 5)





// >> 输入输出参数
/*
 函数参数默认是常量。试图在函数体中更改参数值将会导致编译错误。
 
 如果你想要一个函数可以修改参数的值,并且想要在这些 修改在函数调用结束后仍然存在,那么就应该把这个参数定义为输入输出参数(In-Out Parameters)。

 定义一个输入输出参数时,在参数定义前加 inout 关键字。
 
 *** 只能传递变量给输入输出参数。
     当传入的参数作为输入输出参数时,需要在参数名前加 符,表示这个值可以被函数修改
 
 
 输入输出参数不能有默认值,而且可变参数不能用 inout  标记。
 
 输入输出参数和返回值是不一样的。上面的 swapTwoInts 函数并没有定义任何返回值,但仍然修改了 someInt 和 anotherInt 的值。输入输出参数是函数对函数体外产生影响的另一种方式。

 */

func swapTwoInts(inout a: Int, inout _ b: Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}
var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")








// >> 函数类型

// 每个函数都有种特定的函数类型,由函数的参数类型和返回类型组成。

// 函数类型  (Int, Int) -> Int
func addTwoInts(a: Int, _ b: Int) -> Int {
    return a + b
}
func multiplyTwoInts(a: Int, _ b: Int) -> Int {
    return a * b }


// 函数类型  () ->void
func printHelloWorld() {
    print("hello, world")
}


// 使用函数类型
// 在 Swift 中,使用函数类型就像使用其他类型一样


// 定义一个叫 mathFunction 做数’,类型是‘一个有两个 Int 型的参数并返回一个 Int 型的值的函, 函数并让这个新变量指向的变量指向 addTwoInts 函数
var mathFunction: (Int, Int) -> Int = addTwoInts
print("Result: \(mathFunction(2, 3))")


// Swift 类型推断
let anotherMathFunction = addTwoInts



// >> 函数类型作为参数类型
// 可以用 (Int, Int) -> Int 这样的函数类型作为另一个函数的参数类型。

func printMathResult(mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}
printMathResult(addTwoInts, 3, 5)


// >> 函数类型作为返回类型

// 可以用函数类型作为另一个函数的返回类型。你需要做的是在返回箭头( -> )后写一个完整的函数类型。
func stepForward(input: Int) -> Int {
    return input + 1
}
func stepBackward(input: Int) -> Int {
    return input - 1
}


func chooseStepFunction(backwards: Bool) -> (Int) -> Int {
    return backwards ? stepBackward : stepForward
}


var currentValue = 3
let moveNearerToZero = chooseStepFunction(currentValue > 0)



print("Counting to zero:")
// Counting to zero:
while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")








// >> 嵌套函数

/*
 之前所有函数都叫全局函数(global functions),它们定义在全局域中。你也可以把函数定义在 别的函数体中,称作嵌套函数(nested functions)。
 
 
 默认情况下,嵌套函数是对外界不可见的,但是可以被它们的外围函数(enclosing function)调用。一个外围 函数也可以返回它的某一个嵌套函数,使得这个函数可以在其他域中被使用。

 */


func chooseStepNestedFunction(backwards: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backwards ? stepBackward : stepForward
}


var currentValue1 = -4
let moveNearerToZero1 = chooseStepNestedFunction(currentValue1 > 0)
// moveNearerToZero now refers to the nested stepForward() function
while currentValue1 != 0 {
    print("\(currentValue1)... ")
    currentValue1 = moveNearerToZero1(currentValue1)
}






