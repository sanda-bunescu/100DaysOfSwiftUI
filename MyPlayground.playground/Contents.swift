import Foundation
/*
var greeting = """
    Get the Xcode 14 beta, which includes SDKs for all Apple platforms.
    Leverage the simplicity and power of Swift
    and SwiftUI with a new multiplatform app experience,
    code faster with enhanced editor features, and start testing and
    deploying from Xcode Cloud to TestFlight and the App Store.
"""
print(greeting)

greeting = "aaa"
print(greeting)

let nr = 20
print(nr.isMultiple(of: 10))

let integ = 4
let doub = 4.3

let sum = Double(integ) + doub
print(sum)
*/
//**********************************************************************
//checkpoint no.1
let celsius = 24.5
let fahrenheit = celsius * 9 / 5 + 32
//Option+Shift+8 for °
print("Temperature in celsius:\(celsius)°\nTemperature in fahrenheit:\(fahrenheit) ")

//**********************************************************************

var testArray = Array<Double>()
//OR : var testArray = [Double]()
testArray.append(34.5)
testArray.append(4)
testArray.append(7)
print(testArray)


var dictionaryTest = [String: Int]()
dictionaryTest["Ana"] = 20
dictionaryTest["Doina"] = 202
dictionaryTest["ion"] = 21
dictionaryTest["Alina"] = 45

print(dictionaryTest["ion" , default: -1])
dictionaryTest.removeValue(forKey: "Doina")
print(dictionaryTest["Doina" , default: -1])

var setTest = Set<Int>()
setTest.insert(3)
setTest.insert(4)
setTest.insert(5)
setTest.insert(6)
print(setTest)
setTest.remove(3)
print(setTest)


enum days{
    case monday , tuesday , wednesday , thursday , friday , saturday , sunday
}
var day = days.monday
let day1 = days.thursday
print("\(day) \(day1)")

var namesSet = Set<String>()//Set
var names = [String]()//Array

names.append("Ana")
names.append("Ion")
print(names)

namesSet.insert("Andrei")
namesSet.insert("Ani")
print(namesSet)

var personalInfo = [String : Int]()//dictionary
personalInfo["Vasile"] = 12345
personalInfo["Ana"] = 45362
personalInfo["ion"] = 64820

print(personalInfo)

//**************************************************
//Checkpoint2

var nume = [String]()
nume.append("Ana")
nume.append("ion")
nume.append("Andrei")
nume.append("ion")
nume.append("Vlada")
nume.append("Catalina")
nume.append("Dumitru")

print(nume.count)

var numeSet = Set<String>(nume)//use sets to remove duplicates and to print the number of unique elements from the array
print(numeSet.count)

//****************************************************

let cities = ["Bucharest" , "Chisinau" , "London"]

print(cities[0...])//range operators
print(cities[0...1])

for i in 0..<5{
    print(i)
}

for _ in 1...5{
    print(cities[0])
}


var page: Int = 0
while page <= 5 {
    page += 1
    print("I'm reading page \(page).")
}

var itemsSold: Int = 0
while itemsSold < 5000 {
    itemsSold += 100
    if itemsSold % 1000 != 1000 {
        print("\(itemsSold % 1000) ")
    }
}

var number: Int = 10
while number > 0 {
    number -= 2
    if number % 2 == 0 {
        print("\(number) is an even number.")
    }
}


var setTest1 = Set<Double>()
setTest1.insert(34.6)
setTest1.insert(5)
setTest1.insert(34.6)//if there is already the same value in the set, swift will keep just one
print(setTest1)


//****************************************************
//chechpoint3
//with if statement
for i in 1...100{
    
    if i % 3 == 0 && i % 5 == 0{
        print("FizzBuzz")
    }
    if i % 3 == 0{
        print("Fizz")
    }
    if i % 5 == 0{
        print("Buzz")
    }else{
        print(i)
    }
}

//with switch statement
for i in 1...100{
    switch(i % 3 == 0 , i % 5 == 0){
    case(true,false):
        print("Fizz")
    case(false,true):
        print("Buzz")
    case(true,true):
        print("FizzBuzz")
    default:
        print(i)
    }
}

//use functions to verify if 2 words contain the same letters
func verifyLetters(word1 : String , word2 : String){
    
    for i in 0..<word1.count{
        let index = word1.index(word1.startIndex, offsetBy: i)
        let character = word1[index]
        if word2.contains(character)
        {
            print(character)
        }
    }
}

verifyLetters(word1: "abc", word2: "cba")
func verifyLetters1(word1 : String , word2 : String) -> Bool{
    word1.sorted() == word2.sorted()//return keyword is not necessary when there is one line of code that returns something
}

print(verifyLetters1(word1: "sanda", word2: "adnas"))

//Teorema lui Pitagora

func Pitagora(cateta1 : Double , cateta2 : Double) -> Double{
    sqrt(pow(cateta1, 2) + pow(cateta2, 2))
}

print(Pitagora(cateta1: 3, cateta2: 4))

//returning multiple variables from a function

func personalData() -> (name : String , id : Int , height : Double){
    ("Ana" , 123456 , 45.7)
}

let (name , id , height) = personalData()

print("\(name)'s id is: \(id) and height is: \(height)")


func evaluateJavaScript(_ input: String) {
    print("Yup, that's JavaScript alright.")
}


func multiplication(nr : Int , multiplicator : Int = 10){
    for i in 1...multiplicator{
        print(" \(i) * \(nr) is : \(i * nr)")
    }
}

multiplication(nr: 5 )


func takePicture(withFlash flash : Bool = true) {
    if flash {
        print("I'm taking a photo with flash")
    } else {
        print("I'm taking a photo")
    }
}

//*****************************************
//checkpoint4
print()
enum ErrorList: Error{
    case outOfBounds , noSquareRoot
}

func findSquareRoot(of nr: Int) throws -> Int {
    if nr < 1 || nr > 10_000 { throw ErrorList.outOfBounds }
    for i in 1...100{
        if i * i == nr{
            return i;
        }
    }
    throw ErrorList.noSquareRoot
}

do{
    print(try findSquareRoot(of: 100000))
}catch ErrorList.outOfBounds{
    print("number is too big")
}catch ErrorList.noSquareRoot{
    print("no root")
}

//************************************************
print()
var students = ["ana" , "ion" , "andrei" , "paula"]

let filteredStudents = students.filter { $0.hasPrefix("a")}

print(filteredStudents)

let sortedStudents = students.sorted { $0 > $1 } //sortarea descrescatoare

print(sortedStudents)


//**************************************************
//checkpoint 5
print()
let luckiNumber = [7 , 4 , 38 , 21 , 16 , 15 , 12 , 33 , 31 , 49]

let newArray = luckiNumber.filter{ $0 % 2 != 0 }.sorted{ $0 > $1 }.map{"\($0) is a lucky number"}

for item in 0..<newArray.count{
    print(newArray[item])
}


struct price{
    var initialPrice : Int
    var growth : Int
    var finalPrice : Int {
        get{
            initialPrice + growth
        }
        set{
            newValue
        }
    }
}


var milk = price(initialPrice: 5, growth: 1)
print(milk.finalPrice)
milk.finalPrice = 10
print(milk.finalPrice)


struct Person {
    var name: String

    mutating func makeAnonymous() {
        name = "Anonymous"
    }
}

var person = Person(name: "Ana")
print(person.name)
person.makeAnonymous()
print(person.name)

struct FacebookUser {
    private var privatePosts: [String]
    public var publicPosts: [String]
    init (publ publicPosts: [String] , _ privatePosts: [String]){
        self.privatePosts = privatePosts
        self.publicPosts = publicPosts
    }
    func showPrivate(){
        print(privatePosts)
    }
}
let user = FacebookUser(publ: ["a" , "b"] , ["c" , "d"])
print(user.publicPosts)

user.showPrivate()

struct Doctor {
    var name: String
    var location: String
    private var currentPatient = "No one"
    init(name: String , location: String){
        self.name = name
        self.location = location
    }
}
var drJones = Doctor(name: "Esther Jones", location: "Bristol")
print(drJones.name)

//static properties usage in struct
struct NewsStory {
    static var breakingNewsCount = 0
    static var regularNewsCount = 0
    var headline: String
    init(headline: String, isBreaking: Bool) {
        self.headline = headline
        if isBreaking {
            NewsStory.breakingNewsCount += 1
        } else {
            NewsStory.regularNewsCount += 1
        }
    }
}

struct SchoolClass {
    static let maxCapacity = 32
    static var field = "Science"
    var currentCapacity : Int
    init(capacity: Int){
        currentCapacity = capacity
    }
    
}

let Class2010 = SchoolClass(capacity: 25)

print(SchoolClass.field)
print(Class2010.currentCapacity)

//********************************************
//checkpoint 6

enum gearError: Error{
    case invalidGear
}
struct Car{
    let model: String
    let nrOfSeats: Int
    private(set) var gear = 0
    
    mutating func changeGear(gear: Int) throws{
        if(gear < 1 || gear > 10){ throw gearError.invalidGear }
        self.gear = gear
    }
}

var first = Car(model:"Mercedes" , nrOfSeats: 5)

do{
    try first.changeGear(gear: 5)
    print(first.gear)
}catch gearError.invalidGear{
    print("Invalid gear")
}
//**************************************************


class testingVariableProperties{
    var variable1: Int
    var variable2: String
    init(variable1: Int , variable2: String) {
        self.variable1 = variable1
        self.variable2 = variable2
    }
    func modifyVariable(modifier: String){
        variable2 = modifier
    }
}

let constantVar = testingVariableProperties(variable1: 10 , variable2: "test")

print(constantVar.variable2)

constantVar.modifyVariable(modifier: "ana")
print(constantVar.variable2)

//*****************************************
//checkpoint 7

class Animal{
    let legs : Int
    init(legs: Int){
        self.legs = legs
    }
}

class Dog: Animal{
    func speak(){
        print("bark")
    }
}
class Corgi: Dog{
    override func speak(){
        print("wwwof")
    }
}
class Poodle: Dog {
    override func speak() {
        print("wof-wof")
    }
}

class Cat: Animal{
    let isTame : Bool
    init(isTame: Bool , legs: Int){
        self.isTame = isTame
        super.init(legs: legs)
    }
    func speak(){
        print("Meawing")
    }
}
class Persian: Cat{
    override func speak() {
        print("meawwww")
    }
}
class Lion: Cat{
    override func speak() {
        print("meaw-meaw")
    }
}

let persian = Persian(isTame: true , legs: 4)
print("Persian cat speaks: ", terminator: "")
persian.speak()

let poodle = Poodle(legs: 4)
print("Poodle speaks: ", terminator:"")
poodle.speak()


//protocols with enums example
print()
protocol Shape {
    var area: Double { get }
    var perimeter: Double { get }
}

enum Square: Shape {
    case sideLength(Double)

    var area: Double {
        switch self {
        case .sideLength(let side):
            return side * side
        }
    }

    var perimeter: Double {
        switch self {
        case .sideLength(let side):
            return 4 * side
        }
    }
}

enum Circle: Shape {
    case radius(Double)

    var area: Double {
        switch self {
        case .radius(let radius):
            return Double.pi * radius * radius
        }
    }

    var perimeter: Double {
        switch self {
        case .radius(let radius):
            return 2 * Double.pi * radius
        }
    }
}

// Usage
let square = Square.sideLength(5.0)
print("Square Area: \(square.area)")
print("Square Perimeter: \(square.perimeter)")

let circle = Circle.radius(3.0)
print("Circle Area: \(circle.area)")
print("Circle Perimeter: \(circle.perimeter)")


//opaque return types


func getRandomNumber() -> some Equatable {
    Int.random(in: 1...60)
}

print(getRandomNumber())


//extensions

print()
struct Book {
    let title: String
    let pageCount: Int
    let readingHours: Int
}

extension Book{
    init(title: String, pageCount: Int) {
            self.title = title
            self.pageCount = pageCount
            self.readingHours = pageCount / 50
    }
}
let lotr = Book(title: "Lord of the Rings", pageCount: 1178, readingHours: 24)
let barbie = Book(title: "Barbie", pageCount: 124)
print(lotr.readingHours)
print(barbie.readingHours)


let t = "ANA ARE MERE"

extension String{
    func isUppercased() -> Bool{
        self == self.uppercased()
    }
}

print(t.isUppercased())


//**********************************************
//Optionals and unwrapping them(first method)
//if let creates an temporary value and uses it in the first block of if let

var weatherForecast: String? = nil //Type? is declaration of an optional
if let forecast = weatherForecast {//Use (if let newValue = optionalName) to unwrap an optional
    print("The forecast is \(forecast).")
} else {
    print("No forecast available.")
}

//unwrapping optionals(second method)
//guard let is unwrapping the optional and if it has a value it will create a new permanent value
//if the optional value is nil, guard let will execute the code from the first block
//return key word is required. We use guard let in functions to force quit the function in case of nil
func printSquare(of number: Int?) {
    guard let number = number else {
        print("Missing input")
        return
    }

    print("\(number) x \(number) is \(number * number)")
}


//unwrapping-nil coalesing(third method)

let author: Int? = nil
let testAuthor = author ?? -1// use ?? tho provide defunt value in case the optional is nil
print(testAuthor)

let test1111 = ["Vincent": "van Gogh", "Pablo": "Picasso", "Claude": "monet"]
let surnameLetter = test1111["Claude"]?.first?.uppercased() ?? "?"
print(surnameLetter)


//checkpoint 9
print()
let array: [Int]? = [10, 1, 4, 56 ,7, 234]

func checkOptionals(array: [Int]?) -> Int{
    array?.randomElement() ?? Int.random(in: 1...100)
}

print(checkOptionals(array: array))

//*********************************************************

let a = ["1" , "2" , "3"]
let b = ["4" , "56" , "32"]
let c = ["11" , "22" , "34"]
let intA = a.map{ Int($0) ?? -1 }
let intB = b.map{ Int($0) ?? -1 }
let intC = c.map{ Int($0) ?? -1 }

print(intA)
print(intB)

var str1 = "ana"
var str2 = "Ana"

if str1.lowercased() == str2.lowercased(){
    print("da")
}
