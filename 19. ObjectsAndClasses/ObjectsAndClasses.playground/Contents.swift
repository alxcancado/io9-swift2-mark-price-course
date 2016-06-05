//: Playground - noun: a place where people can play

import UIKit

var vehicleName = "SXR"
var odometer = 1000
var tires = 4

// objects: put lots of logical pieces together into a class


// BLUEPRINT
class Vehicle {
    var engine = "4 cylinder"
    var color = "Silver"
    var odometer = 0
    
    // constructor/initializer
    init(engine: String, color: String) {
        self.engine = engine
        self.color = color
    }
    
    init(){
        
    }
    
    func enterMiles(miles: Int){
        odometer += miles
    }
}

// create new objects by instantiate the class
var srx = Vehicle(engine: "6 cylinders", color: "Red")
var volvo = Vehicle()
var silverado = Vehicle()

print(srx.color)
print(volvo.color)

var vehicles = [Vehicle]()
vehicles.append(srx)
vehicles.append(volvo)
vehicles.append(silverado)

print(srx.odometer)
srx.enterMiles(1400)
print(srx.odometer)

////////////////// better yet with data encapsulation
class Car {
    private var engine = "4 cylinder"
    private var color = "Silver"
    private var _odometer = 0
    
    // getter and setter (accessors and mutators)
    var odometer: Int {
        get {
            return _odometer
        }
        set {
            // by doing this we don't let _odometer being changed freely, without any validation
            if newValue > _odometer {
                _odometer = newValue
            }
        }
    }
    
    // constructor/initializer
    init(engine: String, color: String) {
        self.engine = engine
        self.color = color
    }
    
    init(){
        
    }
    
    func enterMiles(miles: Int){
        odometer += miles
    }
}
/////////////////////////////////////////////////
// well, all vars should be privates and accessed by getters and setters. ideally.