//
//  FitnessClass.swift
//  Group04_Gym
//

class FitnessClass: Service {
    var trainerName: String
    var duration: Int
    
    init(id: String, name: String, totalNumberOfSessions: Int, price: Int, trainerName: String, duration: Int) {
        self.trainerName = trainerName
        self.duration = duration
        super.init(id: id, name: name, totalNumberOfSessions: totalNumberOfSessions, price: price)
    }
    
    override var serviceDescription: String{
        return super.serviceDescription + ", TrainerName Name: \(trainerName)"
    }
}
