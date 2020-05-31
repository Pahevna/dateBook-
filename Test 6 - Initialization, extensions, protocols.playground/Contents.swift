struct Foo {
    let str: String?
    init(text: String) {
        self.str = text
    }
    
    init(text1: String) {
        str = text1
    }

}
let a = Foo(text: "ывы")


class Person {
    var age: Int
    var name: String?
    
    required init(age: Int, name: String? = nil) {
        self.age = age
        self.name = name
        print (1)
    }
       
    convenience init (ages: Int) {
        self.init(age: ages)
    }
}

class Man: Person {
    let surname: String
    
    init(surname: String) {
        self.surname = surname
        super.init(age: 100, name: "Ivan")
    }
    
    
    required init(age: Int, name: String? = nil) {
        surname = ""
        super.init(age: age, name: name)
        self.age = age
        self.name = name
       
    }
}

extension Int {
    var summa: Int {
        return self + self
    }
}

let number = 10.summa


struct Size {
    var width = 0.0, height = 0.0
}
struct Point {
    var x = 0.0, y = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
}
extension Rect {
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size) // инициализатор вызывает почленный инициализатор структуры init(origin:size:), который хранит новую исходную точку и размеры в соответствующих свойства
    }
}
let s = Rect(center: Point(x: 10, y: 20), size: Size(width: 10, height: 30))


extension Int {
    func square() -> Int {
        return self * self
    }
}
var randomNumber = 10
print (randomNumber.square())


extension Int {
    mutating func newSquare() {
        self = self * self // Методы структуры и перечисления, которые изменяют self или его свойства, должны быть отмечены как mutating
    }
}
var someInt = 3
someInt.newSquare()



class City {
    var name: String
    var population: Int

    init(name: String, population: Int ) {
        self.name = name
        self.population = population
}
    }

extension City {
    convenience init(oldName: String) {
        self.init(name: oldName, population: 1000)
    }
    
}
    


var city = City(oldName: "Porkovsk")
city.name = "Engels"
city.population = 400_000
print ("I live in \(city.name) is population \(city.population)")



//---------------Protocols-------------

protocol NameSportsmen {
    var name: String { get }
    func print() -> String
}

class FootballPlayer: NameSportsmen {
    var name: String
    
    func print() -> String {
        return name
    }
    
    var age: Int
    let sport = "football"
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

class BasketballPlayer: NameSportsmen {
    var name: String
    
    func print() -> String {
        return name
    }
    
    var age: Int
    let sport = "basketball"
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

var footballPlayer1 = FootballPlayer(name: "Pele", age: 86)
var footbalPLayer2 = FootballPlayer(name: "Zico", age: 60)
var basketballPlayer1 = BasketballPlayer(name: "Kobi", age: 38)
var basketballPlayer2 = BasketballPlayer(name: "Shaq", age: 42)

var array: [NameSportsmen] = [footballPlayer1, footbalPLayer2, basketballPlayer1, basketballPlayer2]

func sorted(array: [NameSportsmen]) {
    for value in array {
        print(value.name)
    }
}

sorted(array: array)
 


//------проверка соответствия протоколу-----protocol compliance verification
class Coach {
    var fromClub = "Milan"
}

let coach = Coach()

var newArray: [AnyObject] = [footbalPLayer2, basketballPlayer2, coach]

for obj in newArray {
    if let objWithName = obj as? NameSportsmen {
        print("Name sportsmen is \(objWithName.name)")
    } else {
        print ("Person without age")
    }
    
}

//------------delegate-----------

protocol Skills {
    func shot()
    func pass()
}

class Striker: Skills {
    func shot() {
        print("Good shot!")
    }
    
    func pass() {
        print("Excelent pass!")
    }
}

class Junior {
    weak var delegate: Striker?
}

var striker = Striker()
var junior = Junior()

junior.delegate = striker    //попросили ответственность
junior.delegate?.shot()
junior.delegate?.pass()




