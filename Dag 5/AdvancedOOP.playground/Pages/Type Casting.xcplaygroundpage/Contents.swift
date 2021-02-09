//: [Previous](@previous)

class Vehicle {
    var make: String = ""
    
}

class Car : Vehicle {
    var registrationNumber: String
    
    init(make: String, regNo: String) {
        self.registrationNumber = regNo
        super.init()
        self.make = make
    }
    
    func drive() -> String {
        return "The car is driving"
    }
}

class Bike : Vehicle {
    
    func cycling() -> String {
        return "The bike is rolling away"
    }
}

var vehicles = [Vehicle]()

var volvo = Car(make: "Volvo", regNo: "ABC123")
var kia = Car(make: "Kia", regNo: "VYT678")
var bike = Bike()


vehicles.append(volvo)
vehicles.append(kia)
vehicles.append(bike)

for vehicle in vehicles {
    
//    if vehicle is Car {
//        print("This is a car")
//
//        let car = vehicle as! Car
//        print(car.drive())
//    } else if vehicle is Bike {
//        print("This is a bike")
//
//        let bike = vehicle as! Bike
//        print(bike.cycling())
//    }
    
    if let car = vehicle as? Car {
        car.drive()
    }
    
    if  let bike = vehicle as? Bike {
        bike.cycling()
    }
}
//: [Next](@next)
