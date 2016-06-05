//: Playground - noun: a place where people can play

import UIKit

class Shape {
    var area: Double?
    
    func calculateArea(){
        
    }
    
    func printArea(){
        print("The area is \(area)")
    }
}


class Rectangle: Shape {
    var width = 1.0
    var height = 1.0
    
    init(width: Double, height: Double){
        self.width = width
        self.height = height
    }
    
    override func calculateArea() {
        area = width * height
    }
}

class Circle: Shape {
    var radius = 1.0
    
    init(radius: Double){
        self.radius = radius
    }
    
    
    override func calculateArea() {
        area = 3.14 * radius * radius
    }
}





////////////////////
var circle = Circle(radius: 5.0)
var rectangle = Rectangle(width: 20, height: 5)

circle.calculateArea()
rectangle.calculateArea()

print(circle.area)
print(rectangle.area)

////////////

class Enemy{
    var hp = 100
    var attackPower = 10
    
    init(hp: Int, attack: Int){
        self.hp = hp
        self.attackPower = attack
    }
    
    func defendAttack(incommingAttackPower: Int){
        hp -= incommingAttackPower
    }
}

class AngryTroll: Enemy {
    var immunity = 10
    
    override func defendAttack(incommingAttackPower: Int) {
        if incommingAttackPower < immunity {
            hp += 1
        } else {
            // call the super class (the parent class) if the attack is ok
            super.defendAttack(incommingAttackPower)
        }
    }
}
