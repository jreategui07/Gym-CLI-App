//
//  GymOwner.swift
//  Group04_Gym
//

import Foundation

class GymOwner: User {
    var gym: Gym
    
    init(id: String, name: String, gym: Gym) {
        self.gym = gym
        super.init(id: id, name: name)
    }
    
    func createService(name: String, totalSessions: Int, price: Double) {
        let newService = Service(id: UUID().uuidString, name: name, totalNumberOfSessions: totalSessions, price: price)
        gym.createwService(newService)
        print("Service \(name) created by \(self.name).")
    }
    
    func listAllServices() {
        gym.listAllServices()
    }
}
