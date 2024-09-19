//
//  PersonalTraining.swift
//  Group04_Gym
//

class PersonalTraining: Service {
    var trainerName: String
    var sessionTime: Int // TODO: ask the professor if sessinTime is the duration of the class or the appoitment time
    
    init(id: String, name: String, totalNumberOfSessions: Int, price: Double, trainerName: String, sessionTime: Int) {
        self.trainerName = trainerName
        self.sessionTime = sessionTime
        super.init(id: id, name: name, totalNumberOfSessions: totalNumberOfSessions, price: price)
    }
    
    override var serviceDescription: String{
        return super.serviceDescription + ", trainerName Name: \(trainerName)"
    }
}
