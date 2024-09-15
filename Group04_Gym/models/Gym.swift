//
//  Gym.swift
//  Group04_Gym
//

import Foundation

class Gym {
    var services: [Service] = []
    
    func addService(_ service: Service) {
        services.append(service)
    }
    
    func searchService(byKeyword keyword: String) {
        let results = services.filter { $0.name.contains(keyword) }
        if results.isEmpty {
            print("No services found with the keyword '\(keyword)'.")
        } else {
            for service in results {
                print(service.serviceDescription)
            }
        }
    }
    
    func listAllServices() {
        if services.isEmpty {
            print("No services available.")
        } else {
            for service in services {
                print(service.serviceDescription)
            }
        }
    }
    
    func menu() {
        while true {
            print("\n--- Gym Menu ---")
            print("1. Gym Owner")
            print("2. Gym Member")
            print("3. Exit")
            print("Enter your choice: ", terminator: "")
            
            if let choice = readLine(), let option = Int(choice) {
                switch option {
                case 1:
                    gymOwnerMenu()
                case 2:
                    gymMemberMenu()
                case 3:
                    print("Exiting the program.")
                    return
                default:
                    print("Invalid choice. Please try again.")
                }
            }
        }
    }
    
    func gymOwnerMenu() {
        while true {
            print("\n--- Gym Owner Menu ---")
            print("1. Add Service")
            print("2. List All Services")
            print("3. SearchService BY name")
            print("3. Back")
            print("Enter your choice: ", terminator: "")
            
            if let choice = readLine(), let option = Int(choice) {
                switch option {
                case 1:
                    addServiceMenu()
                case 2:
                    listAllServices()
                case 3:
                    return
                default:
                    print("Invalid choice. Please try again.")
                }
            }
        }
    }
    
    func gymMemberMenu() {
        let member = Member(id: "M001", name: "John Doe")
        
        // Example member
        while true {
            print("\n--- Gym Member Menu ---")
            print("1. Book Service")
            print("2. Cancel Service")
            print("3. View Booked Services")
            print("4. Check Balance")
            print("5. Back")
            print("Enter your choice: ", terminator: "")
            
            if let choice = readLine(), let option = Int(choice) {
                switch option {
                case 1:
                    listAllServices()
                    print("Enter the ID of the service you want to book: ", terminator: "")
                    if let serviceId = readLine(), let service = services.first(where: { $0.id == serviceId }) {
                        member.bookService(service)
                    } else {
                        print("Service not found.")
                    }
                case 2:
                    print("Enter the ID of the service you want to cancel: ", terminator: "")
                    if let serviceId = readLine() {
                        member.cancelService(serviceId)
                    }
                case 3:
                    member.viewBookedServices()
                case 4:
                    member.checkBalance()
                case 5:
                    return
                default:
                    print("Invalid choice. Please try again.")
                }
            }
        }
    }
    
    func addServiceMenu() {
        print("\n--- Add Service ---")
        print("1. Fitness Class")
        print("2. Personal Training")
        print("Enter your choice: ", terminator: "")
        
        if let choice = readLine(), let option = Int(choice) {
            switch option {
            case 1:
                print("Enter service name: ", terminator: "")
                let name = readLine() ?? "Unnamed Class"
                print("Enter total sessions: ", terminator: "")
                let sessions = Int(readLine() ?? "0") ?? 0
                print("Enter price: ", terminator: "")
                let price = Int(readLine() ?? "0") ?? 0
                print("Enter duration: ", terminator: "")
                let duration = Int(readLine() ?? "0") ?? 0
                print("Enter trainer name: ", terminator: "")
                let trainer = readLine() ?? "Unknown Trainer"
                
                let fitnessClass = FitnessClass(
                    id: UUID().uuidString,
                    name: name,
                    totalNumberOfSessions: sessions,
                    price: price,
                    trainerName: trainer,
                    duration: duration
                )
                addService(fitnessClass)
                print("Fitness class added successfully.")
                
            case 2:
                print("Enter service name: ", terminator: "")
                let name = readLine() ?? "Unnamed Training"
                print("Enter total sessions: ", terminator: "")
                let sessions = Int(readLine() ?? "0") ?? 0
                print("Enter price: ", terminator: "")
                let price = Int(readLine() ?? "0") ?? 0
                print("Enter session time: ", terminator: "")
                let sessionTime = Int(readLine() ?? "0") ?? 0
                print("Enter trainer name: ", terminator: "")
                let trainer = readLine() ?? "Unknown Trainer"
                
                let personalTraining = PersonalTraining(
                    id: UUID().uuidString,
                    name: name,
                    totalNumberOfSessions: sessions,
                    price: price,
                    trainerName: trainer,
                    sessionTime: sessionTime
                )
                addService(personalTraining)
                print("Personal training added successfully.")
                
            default:
                print("Invalid choice. Please try again.")
            }
        }
    }
}
