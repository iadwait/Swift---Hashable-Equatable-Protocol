//
//  main.swift
//  Hashable & Equatable
//
//  Created by Adwait Barkale on 22/12/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//

import Foundation

//MARK:- Equatable
// When you want to compare two objects use Equatable
// if 1 parameter value cntains type as another struct it gives us method on what to compare
// Else it will compare all the parameters if other struct is also confirmed to Equatable

//struct Person: Equatable {
//    var name: String
//}
//
//struct Car:Equatable {
//    var name: String
//    var model: String
//    var person: Person
//}

struct Person {
    var name: String
}

struct Car:Equatable {
    var name: String
    var model: String
    var person: Person
    
    // This func when Person is not Equatable tell compliler what to equate
    static func == (lhs: Car, rhs: Car) -> Bool {
        //lhs - left side obj, rhs - right side object
        return lhs.name == rhs.name && lhs.model == rhs.model && lhs.person.name == rhs.person.name
    }
}

let obj1 = Car(name: "BMW", model: "C Class", person: Person(name: "joe"))
let obj2 = Car(name: "BMW", model: "C Class", person: Person(name: "smith"))

// Same only when all the values in object match each other works with Equatable protocol.
if obj1 == obj2
{
    print("Same")
} else {
    print("Different")
}

//MARK:- Hashable
// When in dictionary you want to keep key value as object of struct use Hashable
struct user {
    let name : String
}

struct userAccount: Hashable {
    var accountIdentifier: user
    
    static func == (lhs: userAccount, rhs: userAccount) -> Bool {
        return lhs.accountIdentifier.name == rhs.accountIdentifier.name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(accountIdentifier.name)
    }
}

struct Posts {
    var text: String
}

let dictionary = [
    userAccount(accountIdentifier: user(name: "a")) : [
        Posts(text: "post 1"),
        Posts(text: "post 2")
    ], userAccount(accountIdentifier: user(name: "b")) : [
           Posts(text: "post 3"),
           Posts(text: "post 4")
       ]
]

if let user2Dict = dictionary[userAccount(accountIdentifier: user(name: "a"))]
{
    print(user2Dict)
}
