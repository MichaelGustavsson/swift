//Base class, Parent class, Super class
class Vehicle {
    var make: String = ""
    var model: String = ""
    var modelYear: Int = 2000
    
    //Constructor...
//    init(make: String, model: String, modelYear: Int) {
//        self.make = make
//        self.model = model
//        self.modelYear = modelYear
//    }
    
    //Default constructor
//    init() {
//        make = ""
//        model = ""
//        modelYear = 2000
//    }
    
    func displayInfo() {
        print("I'm the super class")
    }
}

//Child class, sub class
class Bike : Vehicle{
    var wheelSize = 26
    var numberOfCogs = 2
    
    override func displayInfo() {
        super.displayInfo()
        print("I'm a bike")
    }
}

class ToddlerBike : Bike{
    var haveSupportWheels = true
    
    override func displayInfo() {
        print("I'm a toddler bike")
    }
}

//Child class, sub class
class Car : Vehicle {
    var mileage = 0
    var fuelType = ""
    
    override func displayInfo() {
        print("I'm a car")
    }
}

let kia = Car()
//kia.fuelType = "hybrid"
//kia.mileage = 1000
//kia.make = "Kia"
//kia.model = "Ceed"
//kia.modelYear = 2020
//kia.displayInfo()

//var toddler = ToddlerBike(make: "Brio", model: "Basic", modelYear: 2018)
var toddler = ToddlerBike()
//var toddler = ToddlerBike(wheelSize: 10, make: "Brio", model: "Basic", modelYear: 2018)
//toddler.haveSupportWheels = false
//toddler.displayInfo()

var crescent = Bike()
//crescent.make = "Crescent"
//crescent.model = "SuperBike"
//crescent.modelYear = 2020
//crescent.numberOfCogs = 4
//crescent.displayInfo()
//print(crescent.DbConnection(connectionName: "mySql"))

let vehicles : [Vehicle] = [kia, toddler, crescent]

for v in vehicles {
    v.displayInfo()
}

class Animal {
    func speek() {
        print("Speeking")
    }
}

class Dog : Animal {
    override func speek() {
        print("Vooof!")
    }
}

class Cat: Animal {
    override func speek() {
        print("Mjauuuu!")
    }
}

var d = Animal()

d = Cat()
d.speek()

