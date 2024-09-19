//
//  User.swift
//  Group04_Gym
//

class User {
    var id: String
    var name: String
    
    init(id: String, name: String) {
        self.id = id
        self.name = name
    }
    
    func logIn() {
        print("\(name) has logged in.")
    }
}
