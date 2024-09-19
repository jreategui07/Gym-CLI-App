//
//  Member.swift
//  Group04_Gym
//

import Foundation

class GymMember: User {
    var creditBalance: Double
    var bookedServices: [Service] = []
    var numberOfSessionsAttended: Int // This will help in identifying if the service can be cancelled.
    
    init(id: String, name: String, creditBalance: Double = 100) {
        self.creditBalance = creditBalance
        self.numberOfSessionsAttended = 0
        super.init(id: id, name: name)
    }
    
    func createAccount() {
     // TODO: ...
    }
    
    func bookService(_ service: Service) {
        // TODO: Booking method ensures that no service is booked twice unless completed or canceled
        if (creditBalance < service.price) {
            print("There is not sufficient funds/credits to book this service:  \(service.name)")
            return
        }
        bookedServices.append(service)
        creditBalance -= service.price
        print("Service \(service.name) booked successfully for \(name).")
        service.showReceipt(serviceType: "Booked") // check, service type is: FitnessClass / PersonalTraining. Booked / Cancelled / Completed is the status of the service
    }
    
    func cancelService(serviceId: String, member: GymMember) {
        if let index = member.bookedServices.firstIndex(where: { $0.id == serviceId }) {
            let service = member.bookedServices[index]
            
            if service.status == .completed {
                print("Service \(service.name) has already been completed. No refunds available.")
                return
            }

            bookedServices[index].status = .cancelled
            creditBalance += service.price // to refund
            print("Service \(service.name) for member \(member.name) has been cancelled. \(service.price) credits have been refunded.")
            // bookedServices.remove(at: index) // removing service from list
        } else {
            print("Service not found in \(member.name)'s booked services.")
        }
    }

    func markSessionAsAttended(serviceId: String) {
        // TODO: Has function markAttendance(id) that increases the number of attended sessions for the service represented by id in the parameter
    }
    
    func reloadCreditPoints(points: Int) {
        // TODO: ...
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
