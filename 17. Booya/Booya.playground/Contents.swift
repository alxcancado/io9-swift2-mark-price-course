//: Playground - noun: a place where people can play

import UIKit

//Warmup - BooYa
//Section 4, Lecture 43
//Warmup
//Create a loop that iterates 200 times starting at 1
//If the value of the current iteration is a multiple of 3 print the word "Boo"
//If the value of the current iteration is a multiple of 5 print the word "Ya"
//If the value of the current iteration is a multiple of 3 AND a multiple of 5 print the word "BooYa"

for var i = 1; i <= 200; i += 1 {
    
    // multiple of 3 and 5
    if i % 3 == 0 && i % 5 == 0 {
        print("BooYa")
    } else if i % 3 == 0{
        print("Boo")
    } else if i % 5 == 0 {
        print("Ya")
    }
    
}
