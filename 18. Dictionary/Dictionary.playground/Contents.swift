//: Playground - noun: a place where people can play

import UIKit

// key, value
var webster: [String: String] = ["krill":"any of the small crustaceans", "fire":"a burning mas of material"]

var webst: [Int: String] = [04: "my fav number", 32: "My age now"]

// it maybe return nothing, so

// if exists the key "krill" in webst dictionary, then I do something
if let krill = webster["krill"] {
    print(krill)
}

if let krill = webster["banana"] {
    print(krill)
}


// clear a dictionary
webster = [:]

if webster.isEmpty {
    print("dictionary is empty!")
}

var highScore: [String: Int] = ["alxcancado":1001,"player43":100,"DesathBySpongeBob":1000]

print(highScore["alxcancado"])


// loop in dictionary
// go ahead and look for this key and this value in highScore dictionary
for (user, score) in highScore {
    print("\(user): \(score)")
}

// add a new value
highScore["blahblauser"] = 2

