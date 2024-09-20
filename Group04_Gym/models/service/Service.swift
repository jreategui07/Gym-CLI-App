//
//  Service.swift
//  Group04_Gym
//

class Service: IsPurchasable {
    var id: String
    var name: String
    var totalNumberOfSessions: Int
    var price: Double
    var status: ServiceStatus
    
    init(id: String, name: String, totalNumberOfSessions: Int, price: Double) {
        self.id = id
        self.name = name
        self.totalNumberOfSessions = totalNumberOfSessions
        self.price = price
        self.status = .available
    }
    
    var serviceDescription: String {
        return "ID: \(self.id), Name: \(self.name), Number of sessions: \(self.totalNumberOfSessions), Price: \(self.price) "
    }
    
    func showReceipt(serviceType: String) {
        print("Receipt Details  \n Service: \(self.name) (\(serviceType.uppercased())), Price: \(self.price) credits")
    }
}
