//: [Previous](@previous)


//Abstrakt klass = kontrakt, tvingande kontrakt
//Barn klasser måste implementer egenskaper och metoder
//Kan ej instantieras
class Vehicle {
    let make: String
    let model: String
    
    var name: String {
        fatalError()
    }
    
    init(make: String, model: String) {
        self.make = make
        self.model = model
    }
    
    func start() {
        fatalError()
    }
    
    func stop() {
        fatalError()
    }
}

class Car: Vehicle {
    
    override var name: String {
        return "\(make) \(model)"
    }
    
    override func start() {
        print("Starting the car")
    }
    
    override func stop() {
        print("Stoping the car.")
    }
}

let myCar = Car(make: "Volvo", model: "V70")

myCar.start()
myCar.stop()

print("\(myCar.name)")

//: [Next](@next)
