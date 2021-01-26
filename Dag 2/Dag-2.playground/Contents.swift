//Dag 2.

//If statements and boolean

//var ok = true
//var x = 8

//if ok || x == 10 {
//    print("Det är ok")
//} else {
//    print("Inte ok!")
//}

//Switch
//var number = 10
//var countryCode = "NO"
//
//switch number {
//case 1..<10:
//    print("Mellan 1 och 10")
//    break
//case 10...20:
//    print("Mellan 10 och 20")
//    break
//default:
//    print("Det är något annat")
//}

//Tuples...
//Ett värde som håller två delar information...
var dog = ("Liza", 12, "Billie", 7, "Ruth", 4) //Tuple
//print(dog.0)
//print(dog.1)
//print(dog.2)
//print(dog.3)

dog.0.append(" Flockledare")
dog.2.insert("B", at: dog.2.endIndex)
dog.0.insert("X", at: dog.0.index(dog.0.startIndex, offsetBy: dog.0.count))
dog

//Sets
var movies_1 = ["Star Wars", "Star Trek", "Dark Knight Rises", "Star Trek"]

var movies_2 : Set = ["Star Wars", "Star Trek", "Dark Knight Rises", "Star Trek", "Star Trek", "Dark Knight Rises"]

var movie = movies_2.contains("Dark Knight Rises")

//for m in movies_2 {
//    print(m)
//}

movies_2.insert("Avengers")
movies_2

//Dictionaries...
var vehicles = ["ABC123": "Volvo V60 T6", "DEF456": "Kia Ceed"]
vehicles["DEF456"]

//Add vehicle
vehicles["EFG789"] = "Fiat 500"
vehicles

//Update vehicle
vehicles["ABC123"] = "Volvo V60 T4"
vehicles

//Remove vehicle
vehicles.removeValue(forKey: "EFG789")
vehicles

//Some advanced play with sets and arrays
var arr1 = ["Star Wars", "Star Trek", "Dark Knight Rises"]
let arr2 = ["Avengers", "Thor", "Iron Man", "Thor", "Thor", "Avengers"]

//arr1.append(contentsOf: arr2)
//arr1 += arr2
let arr3 = arr1 + arr2

let set1 = Set(arr3)
let arr4 = Array(set1)

//Shuffle array...
var numbers = [1,2,3,4,5,6,7,8,9]
numbers.shuffle()


//Functions
func sayHello() {
    print("Hello my friend!")
}

sayHello()

func sayHello(name: String){
    print("Hello my friend \(name)!")
}

sayHello(name: "Bosse")

func sayHello(firstName: String){
    print("Hello my friend \(firstName)!")
}

//sayHello(firstName: String) = interface / signatur
func sayHello(firstName: String, lastName: String){
    print("Hello my friend \(firstName) \(lastName)!")
}

sayHello(firstName: "Bosse", lastName: "Kofot")

func sayHello(firstName: String, lastName: String, address: String) -> String{
    let result = "\(firstName) \(lastName) \(address)"
    return result
}

let info = sayHello(firstName: "Bosse", lastName: "Kofot", address: "Kumla")
print(info)

print(sayHello(firstName: "Bosse", lastName: "Kofot", address: "Kumla"))

//Optionals

var name: String? = "Bosse"

//Värdet är okänt!
//print(String(name))

//let data = name!
//print(data)

//Safe coding...
if(name != nil){
    print(String(name!))
}

if let firstName = name{
    print(firstName)
}

//Classes
class Vehicle {
    //Properties
    var regNo: String
    var make: String
    var model: String
    
    init(registrationNumber: String, make: String, model: String) {
        self.regNo = registrationNumber
        self.make = make
        self.model = model
    }
    
    deinit {
        //Clean up resource that is not used anymore...
    }
    
    func displayInfo() {
        print("\(regNo) \(make) \(model)")
    }
}

var car1 = Vehicle(registrationNumber: "ABC123", make: "Kia", model: "Ceed")
//car.make = "Kia"
//car.model = "Ceed"
//car.regNo = "ABC123"

car1.displayInfo()

var car2 = Vehicle(registrationNumber: "DEF456", make: "Volvo", model: "XC40")
car2.displayInfo()

car2.model = "V40"
car2.displayInfo()

//Struct
struct Movie {
    var title: String
    var length: Int
    var director: String
    
    func displayInfo() -> String {
        return "\(title) \(length) \(director)"
    }
}

var myMovie = Movie(title: "Star Wars", length: 170, director: "George Lucas")

print(myMovie.displayInfo())

var yourMovie = Movie(title: "Film", length: 180, director: "Bosse Kofot")
print(yourMovie.displayInfo())

yourMovie.title = "Titanic"
print(yourMovie.displayInfo())

enum FuelType{
    case diesel
    case petrol
    case hybrid
    case gas
    case electric
}

class Car {
    var regNo = ""
    var make = ""
    var model = ""
    var fuelType: FuelType = .diesel
    
    func displayInfo() -> String {
        return "\(model) \(fuelType)"
    }
}

let myCar = Car()
myCar.regNo = "ABC123"
myCar.make = "Saab"
myCar.model = "9000"
myCar.fuelType = .petrol

print(myCar.displayInfo())

