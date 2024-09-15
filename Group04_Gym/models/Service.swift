//
//  Service.swift
//  Group04_Gym
//

class Service: IsPurchasable {
    var id: String
    var name: String
    var totalNumberOfSessions: Int
    var price: Int // Price is acording to the Servi Type?
    
    init(id: String, name: String, totalNumberOfSessions: Int, price: Int) {
        self.id = id
        self.name = name
        self.totalNumberOfSessions = totalNumberOfSessions
        self.price = price
    }
    
    var serviceDescription: String{
        return "Service desription \n ID: \(self.id), Name: \(self.name), Total number of sessions: \(self.totalNumberOfSessions), Price: \(self.price) "
    }
    
    func showReceipt(serviceType: String) {
        print("Receipt Details  \n Service: \(self.name) (\(serviceType.uppercased())), Price: \(self.price) credits")
    }
}
