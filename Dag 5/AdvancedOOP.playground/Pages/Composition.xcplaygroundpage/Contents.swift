//: [Previous](@previous)
enum FuelType {
    case NotKnown
    case petrol
    case diesel
    case hybrid
    case electric
}

class Engine {
    var fuelType: FuelType
    var horsePower: Int
    
    init(fuelType: FuelType, hk: Int) {
        self.fuelType = fuelType
        horsePower = hk
    }
}

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
    
    //Composition
    private var _engine: Engine
    
    var fuelType: FuelType {
        get{
            return _engine.fuelType
        }
        
        set(value) {
            _engine.fuelType = value
        }
    }
    
    override var name: String {
        let make = getMake()
        return "\(make) \(model)"
    }
    
    override init(make: String, model: String){
        _engine = Engine(fuelType: .NotKnown, hk: 265)
        super.init(make: make, model: model)
        
    }
    
    init(make: String, model: String, engine: Engine) {
        _engine = engine
        
        super.init(make: make, model: model)
    }
    
    func description() -> String {
        return "\(getMake()), \(model), \(fuelType)"
    }
    
    override func start() {
        print("Starting the car")
    }
    
    override func stop() {
        print("Stoping the car.")
    }
}

let volvo = Car(make: "Volvo", model: "V70")

print("\(volvo.name)")

volvo.fuelType = FuelType.diesel

print("\(volvo.description())")
//: [Next](@next)
