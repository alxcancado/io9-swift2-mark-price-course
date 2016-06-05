//: Playground - noun: a place where people can play

import UIKit

// optionals are here to try to make the coding better and trusty.
// ?: you may or not have a value in there: hey, check this var and see if it is not nil
// !: called unwraping: take an optional and Give me a value! If there is nothing, then crash!
var lotteryWinnings: Int?


// don't ever implicity an unwraping thing

// we need the '?' because we don't know if we have or not a value. so,
if lotteryWinnings != nil {
    print(lotteryWinnings!) // now we can use the '!'
}

lotteryWinnings = 100

// if let syntax: we take the value and put in a new constant var if the value exists
// this is the prefered way, most cases seeing around
if let winnings = lotteryWinnings {
    print(winnings)
}

// any time I use a '?' mark, I need to use 'if let'. that's the law!

class Car {
    var model: String? // because we don't know yet
}

var vehicle: Car?

// what if we want to get the model of the car?
if let v = vehicle {
    if let m = v.model {
        print(m)
    }
}


vehicle = Car()
vehicle?.model = "Bronco" // hey, vehicle is optional, I don't know if we gona have the value

print(vehicle?.model) // saying, I don't know if there is a value or not but print it if we need it. Or I don't care if works or not ;)

// a better way, forces to handle the situation
if let v = vehicle, let m = v.model {
    print(m)
}

var  cars:[Car]?
cars = [Car]()

// if is not nil, store in this constant, but also, when the counter is greater than 0
if let carArr = cars where carArr.count > 0 {
    // only execute if it is not nil AND if more than 0
} else {
    // hey, if cars has a value, go there and append
    cars?.append(Car())
}

// Optional handle conditions that there is no values



// implicity unwrap optional. If we use it we need to initializa it in any way! Better initializa with a default value, like: var age = 0. That will save the app from crashing
class Person {
    var _age: Int?
    
    // if we use '!' we need to garantee a value
    var age: Int {
        
        if _age == nil {
            _age = 10
        }
        return _age!
    }
    
    func setAge(newAge: Int){
        self._age = newAge
    }
}

var jack = Person()
print(jack._age)

// in resume: if we don't know the value, use '?'. If we can/need garantee a value use '!'. 
// On handling optionals: if we care about the result, use 'if let'. If don't care, use quotetion marks like in  'car?.model'
















