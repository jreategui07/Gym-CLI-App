//
//  AuthManager.swift
//  Group04_Gym
//

import Foundation

class AuthManager {
    private var currentOwner: GymOwner?
    private var currentMember: GymMember?
    private var gym: Gym?

    func signUpGymOwner(name: String) {
        if currentOwner != nil {
            print("A gym owner already exists.")
            return
        }
        
        let ownerId = UUID().uuidString
        let gym = Gym()
        currentOwner = GymOwner(id: ownerId, name: name, gym: gym)
        print("Gym owner \(name) successfully signed up.")
    }

    func signInGymOwner(name: String) -> GymOwner? {
        if let owner = currentOwner, owner.name == name {
            print("Gym owner \(name) signed in successfully.")
            return owner
        } else {
            print("Gym owner not found.")
            return nil
        }
    }

    func signUpMember(name: String, initialCredit: Double = 100.0) {
        guard let owner = currentOwner else {
            print("No gym owner exists. Cannot sign up member.")
            return
        }
        
        let memberId = UUID().uuidString
        let newMember = GymMember(id: memberId, name: name, creditBalance: initialCredit)
        owner.gym.addMember(newMember)  // Add member to current owner's gym
        print("Member \(name) successfully signed up with ID \(memberId).")
    }

    func signInMember(memberId: String) -> GymMember? {
        guard let owner = currentOwner else {
            print("No gym owner exists. Cannot sign in member.")
            return nil
        }

        if let member = owner.gym.findMember(memberId: memberId) {
            currentMember = member
            print("Member \(member.name) signed in successfully.")
            return member
        } else {
            print("Member not found.")
            return nil
        }
    }

    func getCurrentMember() -> GymMember? {
        return currentMember
    }

    func logOutMember() {
        if let member = currentMember {
            print("Member \(member.name) has logged out.")
            currentMember = nil
        } else {
            print("No member is currently logged in.")
        }
    }
}
