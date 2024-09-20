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
    
    init(id: String, name: String, creditBalance: Double = 100) { // Each account starts with 100 credit points, which can be reloaded at any time.
        self.id = id
        self.name = name
        self.creditBalance = creditBalance
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
            // Use the total number of sessions for a service and number of sessions attended to identify if the service has been completed before
            if service.numberOfSessionsAttended >= service.totalNumberOfSessions {
                print("The service \(service.name) has already been completed and cannot be booked again.")
                return
            }
            
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
            service.status = .booked
            creditBalance -= service.price // The cost of the service is deducted from their balance
            bookedServices.append(service) // The service is added to the list of services the member has booked
            print("Service \(service.name) booked successfully for \(name).")
            service.showReceipt(serviceStatus: service.status.rawValue)
            print("Your new balance is: \(creditBalance)")
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
            
            if service.status != .cancelled {
                print("Service \(service.name) has already been cancelled.")
                return
            }
            
            // Unsuccessful scenario - member has attended more than 1 sessions of the service
            if service.numberOfSessionsAttended > 1 {
                print("Cannot cancel the service: \(service.name). You have attended more than 1 session.")
                return
            }
            
            // Unsuccessful scenario - service doesn’t exist in the purchased list
            if service.status != .booked {
                print("Service \(service.name) is not currently booked and cannot be canceled.")
                return
            }
            
            // Successful scenario – member has not attended any sessions for the service and exist in the purchased list
            bookedServices[index].status = .cancelled
            creditBalance += service.price
            print("Service \(service.name) for member \(name) has been cancelled. \(service.price) credits have been refunded.")
        } else {
            print("Service not found in \(name)'s booked services.")
        }
    }

    func markSessionAsAttended(serviceId: String) {
        // For any service that Gym member has booked, they can attend the sessions and mark its attendance.
        if let service = bookedServices.first(where: { $0.id == serviceId }) {
            if service.numberOfSessionsAttended < service.totalNumberOfSessions {
                service.numberOfSessionsAttended += 1 // App should maintain how many sessions member has attended.
                print("Session marked as attended for \(service.name). Total attended sessions: \(service.numberOfSessionsAttended)")
                // If member is attending the last session of the service, show a message congratulating them on completing the service.
                if service.numberOfSessionsAttended == service.totalNumberOfSessions {
                    service.status = .completed
                    print("Congratulations! You have completed all sessions for \(service.name).")
                }
            } else {
                print("All sessions for \(service.name) have already been attended.")
            }
        } else {
            print("Service not found in your booked services.")
        }
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
