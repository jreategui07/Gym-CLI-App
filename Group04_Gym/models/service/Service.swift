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
    var numberOfSessionsAttended: Int // This will help in identifying if the service can be cancelled.
    
    init(id: String, name: String, totalNumberOfSessions: Int, price: Double) {
        self.id = id
        self.name = name
        self.totalNumberOfSessions = totalNumberOfSessions
        self.price = price
        self.status = .available
        self.numberOfSessionsAttended = 0
    }
    
    var serviceDescription: String {
        return "ID: \(self.id), Name: \(self.name), Number of sessions: \(self.totalNumberOfSessions), Price: \(self.price) "
    }
    
    func showReceipt(serviceStatus: String) {
        print("Receipt Details:")
        print("Service: \(self.name) (\(serviceStatus.uppercased())), Price: \(self.price) credits")
    }
}
