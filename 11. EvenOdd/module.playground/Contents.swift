//: Playground - noun: a place where people can play

import UIKit

func isEven(number: Int) -> Bool {
    
    if number % 2 == 0 {
        return true
    } else {
        return false
    }
}

if isEven(3){
    print("The number is Even")
} else {
    print("The number is Odd")
}

if isEven(2){
    print("The number is Even")
} else {
    print("The number is Odd")
}
