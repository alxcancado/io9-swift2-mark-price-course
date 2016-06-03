//: Playground - noun: a place where people can play

import UIKit

var name = ["me", "na", "yea"]

var numbers = [1, 2, 3]

var yesOrNot = [false, false, true, false]

var mixed = [false, 1, "blah", "20"] // don't do this. really.

var countries = [String]()

var colors = [String](count: 3, repeatedValue: "blue")

colors[0] = "green"
colors[1] = "pink"
colors[2] = "white"

var favCars = [String]()
favCars.append("BMW M3")
favCars.append("Audi S7")
favCars.append("Ford Punto")

favCars.removeAtIndex(2)

favCars.append("1969 Chevy Camaro")

favCars.insert("Nissan GTR", atIndex: 0)


var shoppingCart = [String]()
var budget = 500.0
var currentAmount = 0.0

func addItemToCart(item: String, price: Double){
    
    if currentAmount + price <= budget {
        
        shoppingCart.append(item)
        currentAmount += price
    } else {
        print ("no greenies")
    }
}

addItemToCart("Star Foz", price: 49.90)

print (currentAmount)

addItemToCart("Pie", price: 2.20)
print (currentAmount)
addItemToCart("Sony PS4 Console", price: 399.90)
print (shoppingCart)



