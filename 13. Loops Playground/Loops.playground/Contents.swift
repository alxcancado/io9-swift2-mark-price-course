//: Playground - noun: a place where people can play

import UIKit

var ages = [12, 21, 22, 18]


for x in 0 ..< ages.count {
    var age = ages[x]
    
}

/////////////////////

var oddNumbers = [Int]()

for x in 0 ..< 100 {
    if x % 2 != 0 {
        oddNumbers.append(x)
    }
}

var sums = [Int]()

for x in oddNumbers {
    sums.append(x+5)
}

print (sums)

