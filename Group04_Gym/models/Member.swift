//
//  Member.swift
//  Group04_Gym
//

class Member {
    var id: String
    var name: String
    var creditBalance: Int
    var servicesBooked: [Service] = [] // Stores a list of booked services (FitnessClass, PersonalTraining or both)
    // TODO: // Has attribute to represent number of sessions attended in any booked service. This will help in identifying if the service can be cancelled.
    
    // TODO: ask the professor if "Create new account" is the init method of the class menber
    // setting creditBalance 100 as default credit for member during initialization
    init(id: String, name: String, creditBalance: Int = 100) {
        self.id = id
        self.name = name
        self.creditBalance = creditBalance
    }
    
    func bookService(_ service: Service) {
        // TODO: Booking method ensures that no service is booked twice unless completed or canceled
        if (creditBalance < service.price) {
            print("There is not sufficient funds/credits to book this service")
        }else{
            servicesBooked.append(service)
            creditBalance -= service.price
            
            service.showReceipt(serviceType: "Booked") // check, service type is: FitnessClass / PersonalTraining. Booked / Cancelled / Completed is the status of the service
        }
    }
    
    func cancelService(_ serviceId: String) {
        if let index = servicesBooked.firstIndex(where: { $0.id == serviceId }) {
            let findService = servicesBooked.remove(at: index)
            
            creditBalance += findService.price
            findService.showReceipt(serviceType: "Canceled") // check, service type is: FitnessClass / PersonalTraining. Booked / Cancelled / Completed is the status of the service
        }
        else{
            print("Cannot find the service in your booked services!!")
        }
    }
    
    func viewBookedServices() {
        if servicesBooked.isEmpty{
            print("You haven't booked any servivces yet!!")
        }
        else{
            for service in servicesBooked{
                print(service.serviceDescription)
            }
        }
    }
    
    func checkBalance() {
        // TODO: check balance logic
    }
    
    func markAttendance(id: String) {
        // TODO: Has function markAttendance(id) that increases the number of attended sessions for the service represented by id in the parameter
    }
}
