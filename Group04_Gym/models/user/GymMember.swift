//
//  Member.swift
//  Group04_Gym
//

import Foundation

class GymMember {
    var id: String
    var name: String
    var creditBalance: Double
    var bookedServices: [Service] = []
    var numberOfSessionsAttended: Int // This will help in identifying if the service can be cancelled.
    
    init(id: String, name: String, creditBalance: Double = 100) { // Each account starts with 100 credit points, which can be reloaded at any time.
        self.id = id
        self.name = name
        self.creditBalance = creditBalance
        self.numberOfSessionsAttended = 0
    }
    
    func signIn(memberId: String, gym: Gym) -> GymMember? {
        if let member = gym.findMember(memberId: memberId) {
            print("Member \(member.name) signed in successfully.")
            return member
        } else {
            print("Member not found.")
            return nil
        }
    }
    
    func logOut() {
        print("Member \(self.name) has logged out.")
    }
    
    func bookService(serviceId: String, gym: Gym) {
        if let service = gym.findService(serviceId: serviceId) {
            // The same service cannot be booked twice by the member unless it has been completed or canceled
            if let bookedService = bookedServices.first(where: { $0.id == serviceId }) {
                if bookedService.status != .completed && bookedService.status != .cancelled {
                    print("You have already booked the service: \(service.name). It must be completed or canceled before booking again.")
                    return
                }
            }
            
            if creditBalance < service.price { // Services can only be booked if the member has enough credits in their account.
                print("Insufficient credits to book the service: \(service.name).")
                return
            }
            
            // When a member books a service:
            creditBalance -= service.price // The cost of the service is deducted from their balance
            bookedServices.append(service) // The service is added to the list of services the member has booked
            print("Service \(service.name) booked successfully for \(name).")
            service.showReceipt(serviceType: "Booked")
        } else {
            print("Service not found.")
        }
    }
    
    func cancelService(serviceId: String, gym: Gym) {
        if let index = bookedServices.firstIndex(where: { $0.id == serviceId }) {
            let service = bookedServices[index]
            
            if service.status == .completed {
                print("Service \(service.name) has already been completed. No refunds available.")
                return
            }
            
            bookedServices[index].status = .cancelled
            creditBalance += service.price
            print("Service \(service.name) for member \(name) has been cancelled. \(service.price) credits have been refunded.")
        } else {
            print("Service not found in \(name)'s booked services.")
        }
    }

    func markSessionAsAttended(serviceId: String) {
        // TODO: Has function markAttendance(id) that increases the number of attended sessions for the service represented by id in the parameter
    }
    
    func reloadCreditPoints(points: Double) {
        self.creditBalance += points
    }
    
    func searchServices(keyword: String) {
        // TODO: ...
    }
    
    func viewBookedServices() {
        if bookedServices.isEmpty{
            print("You haven't booked any servivces yet!!")
        }
        else{
            for service in bookedServices{
                print(service.serviceDescription)
            }
        }
    }
    
    func checkBalance() {
        // TODO: check balance logic
    }
}
