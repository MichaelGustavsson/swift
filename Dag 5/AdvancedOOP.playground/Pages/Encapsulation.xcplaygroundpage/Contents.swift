//: [Previous](@previous)

class Vehicle {
    private let make: String
    private let _model: String
    
    var name: String {
        fatalError()
    }
    
    var model: String {
        get {
            return _model
        }
    }
    
    init(make: String, model: String) {
        self.make = make
        _model = model
    }
    
    func getMake() -> String {
        return make
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
        return "\(getMake()) \(model)"
    }
    
    override func start() {
        print("Starting the car")
    }
    
    override func stop() {
        print("Stoping the car.")
    }
}

//: [Next](@next)
