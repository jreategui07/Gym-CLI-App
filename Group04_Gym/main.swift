//
//  main.swift
//  Group04_Gym
//

import Foundation

func main() {
    let authManager = AuthManager()

    var shouldContinue = true
    while shouldContinue {
        print("\n--- Welcome to Gym Management System ---")
        print("1. Sign up")
        print("2. Sign in")
        print("3. Log out")
        print("0. Exit")
        print("Enter your choice: ", terminator: "")
        
        if let choice = readLine(), let option = Int(choice) {
            switch option {
            case 0:
                shouldContinue = false
                print("Exiting the Gym Management System.")
            case 1:
                // Sign up options for Gym Owner or Gym Member
                print("\n--- Sign Up ---")
                print("1. Gym owner")
                print("2. Gym member")
                print("Enter your choice: ", terminator: "")
                
                if let signUpChoice = readLine(), let signUpOption = Int(signUpChoice) {
                    switch signUpOption {
                    case 1:
                        print("Enter gym owner name: ", terminator: "")
                        if let ownerName = readLine() {
                            authManager.signUpGymOwner(name: ownerName)
                        }
                    case 2:
                        print()
//                        guard authManager.getCurrentOwner() != nil else {
//                            print("No gym owner exists. Please sign up a gym owner first.")
//                            break
//                        }
//                        print("Enter member name: ", terminator: "")
//                        if let memberName = readLine() {
//                            authManager.signUpMember(name: memberName)
//                        }
                    default:
                        print("Invalid option.")
                    }
                }
            case 2:
                // Sign in options for Gym Owner or Gym Member
                print("\n--- Sign In ---")
                print("1. Gym owner")
                print("2. Gym member")
                print("Enter your choice: ", terminator: "")
                
                if let signInChoice = readLine(), let signInOption = Int(signInChoice) {
                    switch signInOption {
                    case 1:
                        print("Enter gym owner name: ", terminator: "")
                        if let ownerName = readLine() {
                            if let gymOwner = authManager.signInGymOwner(name: ownerName) {
                                ownerMenu(gymOwner: gymOwner, authManager: authManager)
                            }
                        }
                    case 2:
                        print("Enter member ID: ", terminator: "")
                        if let memberId = readLine() {
                            if let gymMember = authManager.signInMember(memberId: memberId) {
                                memberMenu(gymMember: gymMember, authManager: authManager)
                            }
                        }
                    default:
                        print("Invalid option.")
                    }
                }
            case 3:
                // Log out
                authManager.logOutMember()
            default:
                print("Invalid option.")
            }
        }
    }
}

func ownerMenu(gymOwner: GymOwner, authManager: AuthManager) {
    var ownerContinue = true
    while ownerContinue {
        print("\n--- Gym Owner Menu ---")
        print("1. List all services")
        print("2. Create new service")
        print("3. List all members")
        // 4. SearchService by name?
        print("0. Log out as Gym Owner")
        print("Enter your choice: ", terminator: "")

        if let ownerChoice = readLine(), let ownerOption = Int(ownerChoice) {
            switch ownerOption {
            case 0:
                ownerContinue = false
                print("Gym owner \(gymOwner.name) logged out.")
            case 1:
                gymOwner.gym.listAllServices()
            case 2:
//                print("Enter service name: ", terminator: "")
//                if let serviceName = readLine() {
//                    let newService = Service(id: UUID().uuidString, name: serviceName, totalNumberOfSessions: 5, price: 50.0, status: .available)
//                    gymOwner.createService(name: newService)
//                    print("New service \(serviceName) created.")
//                }
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
                       let price = Double(readLine() ?? "0") ?? 0
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
                       // addService(fitnessClass)
                       print("Fitness class added successfully.")
                       
                   case 2:
                       print("Enter service name: ", terminator: "")
                       let name = readLine() ?? "Unnamed Training"
                       print("Enter total sessions: ", terminator: "")
                       let sessions = Int(readLine() ?? "0") ?? 0
                       print("Enter price: ", terminator: "")
                       let price = Double(readLine() ?? "0") ?? 0
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
                       // addService(personalTraining)
                       print("Personal training added successfully.")
                       
                   default:
                       print("Invalid choice. Please try again.")
                   }
                }
                
            case 3:
                gymOwner.gym.listAllMembers()
            default:
                print("Invalid option. Please try again.")
            }
        }
    }
}

func memberMenu(gymMember: GymMember, authManager: AuthManager) {
    var memberContinue = true
    while memberContinue {
        print("\n--- Gym Member Menu ---")
        print("1. Search for a service")
        print("2. Book a service")
        print("3. Cancel a service")
        // 4. View Booked Services?
        // 5. Check Balance?
        print("0. Log out as Gym Member")
        print("Enter your choice: ", terminator: "")

        if let memberChoice = readLine(), let memberOption = Int(memberChoice) {
            switch memberOption {
            case 0:
                memberContinue = false
                authManager.logOutMember()
            case 1:
                print("Enter keyword to search for a service: ", terminator: "")
                if let keyword = readLine() {
                    gymMember.searchServices(keyword: keyword)
                }
            case 2:
                print("Enter service ID to book: ", terminator: "")
//                if let serviceId = readLine() {
//                    gymMember.bookService(serviceId: serviceId)
//                }
            case 3:
                print("Enter service ID to cancel: ", terminator: "")
//                if let serviceId = readLine() {
//                    gymMember.cancelService(serviceId: serviceId)
//                }
            default:
                print("Invalid option. Please try again.")
            }
        }
    }
}

main()
