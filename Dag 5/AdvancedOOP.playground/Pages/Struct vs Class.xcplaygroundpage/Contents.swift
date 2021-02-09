//: [Previous](@previous)

struct vehicleStruct {
    private var id: Int
    var make: String
    var model: String
    var mileage: Int
    
    mutating func update(mileage: Int) {
        self.mileage = mileage
    }
    
    func getId() -> Int {
        return id
    }
}

class vehicleClass {
    private var _make: String
    var model: String
    private var _mileage: Int
    private var _modelYear: Int = 2018
    
    var make: String {
        get {
            return _make
        }
    }
    
    var modelYear: Int {
        get {
            return _modelYear
        }
        set {
            if newValue <= 2020 {
                _modelYear = newValue
            }
        }
    }
    
    //Därför
    var mileage: Int {
        get{
            return _mileage
        }
        set {
            
        }
    }
    
    init(make: String, model: String, mileage: Int) {
        self._make = make
        self.model = model
        self._mileage = mileage
    }
    
    func update(mileage: Int) {
        self.mileage = mileage
    }
}

//let carStruct1 = vehicleStruct(make: "Renault", model: "Trafic", mileage: 75000)
//
//var s: String = ""
//var i: Int = 0
//
//

//var carStruct2 = carStruct1
//
//carStruct2.make = "Opel"
//carStruct2.model = "Vivaro"
//carStruct2.mileage = 34000
//
//print("carStruct 1 \(carStruct1.make)")
//print("carStruct 2 \(carStruct2.make)")
//
//
//let carClass1 = vehicleClass(make: "Volvo", model: "V70", mileage: 250000)
//
//let carClass2 = carClass1
//
//carClass2.model = "Kia"

//print("carClass 1 \(carClass1.make)")
//print("carClass 2 \(carClass1.make)")


//: [Next](@next)
