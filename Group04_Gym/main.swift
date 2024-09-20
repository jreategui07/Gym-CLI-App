//
//  main.swift
//  Group04_Gym
//

import Foundation

func main() {
    let gym = Gym()

    var shouldContinue = true
    while shouldContinue {
        print("\n--- Welcome to Gym Management System ---")
        print("1. Create a gym member")
        print("2. Enter as a gym member")
        print("3. List all services")
        print("4. Create a new service (admin only)")
        print("5. Log out")
        print("0. Exit")
        print("Enter your choice: ", terminator: "")
        
        if let choice = readLine(), let option = Int(choice) {
            switch option {
            case 0:
                shouldContinue = false
                print("Exiting the Gym Management System.")
            case 1:
                print("Enter your username to sign up: ", terminator: "")
                if let memberName = readLine() {
                    let newMember = GymMember(
                        id: UUID().uuidString,
                        name: memberName
                    )
                    gym.addMember(newMember)
                    print("Member \(newMember.name) successfully signed up with ID \(newMember.id).")
                }
            case 2:
                print("Enter your username to sign in: ", terminator: "")
                if let memberId = readLine() {
                    if let loggedInMember = gym.findMember(memberId: memberId) {
                        print("Member \(loggedInMember.name) signed in successfully.")
                        
                        var loggedIn = true
                        while loggedIn {
                            print("\n--- Member Menu ---")
                            print("1. List available services")
                            print("2. Book a service")
                            print("3. Cancel a service")
                            print("0. Log out")
                            print("Enter your choice: ", terminator: "")
                            
                            if let memberChoice = readLine(), let memberOption = Int(memberChoice) {
                                switch memberOption {
                                case 0:
                                    loggedIn = false
                                    loggedInMember.logOut()
                                case 1:
                                    gym.listAllServices()
                                case 2:
                                    print("Enter service ID to book: ", terminator: "")
                                    if let serviceId = readLine() {
                                        loggedInMember.bookService(serviceId: serviceId, gym: gym)
                                    }
                                case 3:
                                    print("Enter service ID to cancel: ", terminator: "")
                                    if let serviceId = readLine() {
                                        loggedInMember.cancelService(serviceId: serviceId, gym: gym)
                                    }
                                default:
                                    print("Invalid option. Please try again.")
                                }
                            }
                        }
                    } else {
                        print("Member not found.")
                    }
                }
            case 3:
                // List all available services
                gym.listAllServices()
            case 4:
                // Create a new service (admin-only functionality)
                print("Enter service name: ", terminator: "")
                if let serviceName = readLine() {
                    let newService = Service(
                        id: UUID().uuidString,
                        name: serviceName,
                        totalNumberOfSessions: 5,
                        price: 50.0
                    )
                    gym.addService(newService)
                    print("Service \(serviceName) created successfully.")
                }
            default:
                print("Invalid option. Please try again.")
            }
        }
    }
}

main()
