//
//  Person.swift
//  mvc-test
//
//  Created by Mark Price on 8/26/15.
//  Copyright © 2015 devslopes. All rights reserved.
//

import Foundation

class Person {
    private var _firstName: String!
    private var _lastName: String!
    
    var firstName: String {
        get {
            return _firstName
        }
        
        set {
            _firstName = newValue
        }
    }
    
    var lastName: String {
        return _lastName
    }
    
    init(first: String, last: String) {
        self._firstName = first
        self._lastName = last
    }
    
    var fullName: String {
        return "\(_firstName) \(_lastName)"
    }
}