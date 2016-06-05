//: Playground - noun: a place where people can play

import UIKit

class Person {
    var eyeColor = "Blue"
    var name: String
    var speed = "10 MPH"
    var benchPress = "200 LBS"
    
    
    // initializer
    init (name: String){
        self.name = name
    }
    
    func catchPhrase() -> String{
        return "Hi!"
    }
}

var jon = Person(name: "Jon")

// this inherit from Person class
class Animorph: Person {
    // and I added a new property for this new class
    var animalType = "Dog"
    
    // convenience is like a second initializer
    convenience init (type: String, name: String){
        self.init(name: name) // call the initializer of the Parent class first
        self.animalType = type
        self.speed = "25 MPH"
    }
    
    // if I need I can override and function of the parent class
    override func catchPhrase() -> String {
        return "U-U-u-u-ri-ri-rim"
    }
}

print(jon.eyeColor)
print(jon.catchPhrase())

var dolphin = Animorph(type: "Dolphin", name: "Jack")
print(dolphin.eyeColor)
print(dolphin.catchPhrase())

// the main class should be strip down and have only the common attributes of the subclasses

class SuperHero: Person{
    var specialPower = "X-Ray vision"
    var backStory = "Chemical washed"
    
    convenience init (name: String, press: String){
        self.init(name: name)
        benchPress = press
    }
    
    override func catchPhrase() -> String {
        return "with great power... just dominate the world "
    }
}


var pukeMan = SuperHero(name: "Puke Man", press: "5000 LBS")
print(pukeMan.catchPhrase())
