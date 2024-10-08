//
//  main.swift
//  Group04_Gym
//

import Foundation

func gymOwnerMenuOptions(gym: Gym) {
    var shouldContinueAsGymOwner = true
    while shouldContinueAsGymOwner {
        print("\n--- Gym Owner (admin) options ---")
        print("1. Create a new service")
        print("2. Search service by keyword")
        print("3. List all services")
        print("0. Exit")
        print("Enter your choice: ", terminator: "")
        if let choice = readLine(), let option = Int(choice) {
            switch option {
            case 0:
                shouldContinueAsGymOwner = false
                print("Exiting from the Gym Owner account.")
            case 1:
                print("Select service type")
                print("1. Fitness class")
                print("2. Personal training")
                print("0. Exit")
                print("Enter your choice: ", terminator: "")
                if let serviceTypeChoice = readLine(), let serviceType = Int(serviceTypeChoice) {
                    if serviceType == 0 {
                        break
                    }

                    print("Enter service name: ", terminator: "")
                    guard let serviceName = readLine(), !serviceName.isEmpty else {
                       print("Invalid service name. Please try again.")
                       break
                    }
                    
                    print("Enter trainer name: ", terminator: "")
                    guard let trainerName = readLine(), !trainerName.isEmpty else {
                       print("Invalid trainer name. Please try again.")
                       break
                    }
                    
                    print("Enter total number of sessions: ", terminator: "")
                    guard let totalSessionsInput = readLine(), let totalNumberOfSessions = Int(totalSessionsInput) else {
                       print("Invalid number of sessions. Please enter a valid integer.")
                       break
                    }

                    print("Enter price: ", terminator: "")
                    guard let priceInput = readLine(), let price = Double(priceInput) else {
                       print("Invalid price. Please enter a valid number.")
                       break
                    }

                    print("Enter session duration in minutes: ", terminator: "")
                    guard let durationInput = readLine(), let duration = Int(durationInput) else {
                       print("Invalid duration. Please enter a valid integer.")
                       break
                    }
                    
                    switch serviceType {
                    case 1:
                        let fitnessClass = FitnessClass(
                            id: UUID().uuidString,
                            name: serviceName,
                            totalNumberOfSessions: totalNumberOfSessions,
                            price: price,
                            trainerName: trainerName,
                            duration: duration
                        )

                        gym.addService(fitnessClass)
                        print("Fitness Class \(serviceName) created successfully.")
                    case 2:
                        let fitnessClass = PersonalTraining(
                            id: UUID().uuidString,
                            name: serviceName,
                            totalNumberOfSessions: totalNumberOfSessions,
                            price: price,
                            trainerName: trainerName,
                            sessionTime: duration
                        )

                        gym.addService(fitnessClass)
                        print("Fitness Class \(serviceName) created successfully.")
                    default:
                        print("Invalid option. Please try again.")
                    }
                }
            case 2:
                print("Enter the service name keywork: ", terminator: "")
                guard let serviceNameKeyword = readLine(), !serviceNameKeyword.isEmpty else {
                   print("Invalid value. Please try again.")
                   break
                }
                gym.searchService(serviceNameKeyword)
            case 3:
                gym.listAllServices()
            default:
                print("Invalid option. Please try again.")
            }
        }
    }
}

func gymMemberMenuOptions(gym: Gym) {
    var shouldContinueAsGymMember = true
    while shouldContinueAsGymMember {
        print("\n--- Gym Member options ---")
        print("1. Create a gym member account (member)")
        print("2. Reload credit points (member)")
        print("3. Search for service (member)")
        print("4. Purchase service (member)")
        print("5. Mark the session as attended (member)")
        print("6. Cancel the service (member)")
        print("0. Exit")
        print("Enter your choice: ", terminator: "")
        if let choice = readLine(), let option = Int(choice) {
            switch option {
            case 0:
                shouldContinueAsGymMember = false
                print("Exiting from the Gym Member account.")
            case 1:
                print("Enter your username create your account: ", terminator: "")
                if let memberName = readLine() {
                    let newMember = GymMember(
                        id: UUID().uuidString,
                        name: memberName
                    )
                    gym.addMember(newMember)
                    print("Member \(newMember.name) successfully created with ID \(newMember.id).")
                }
            case 2:
                print("Enter your member ID: ", terminator: "")
                guard let memberId = readLine(), !memberId.isEmpty else {
                   print("Invalid Member ID. Please try again.")
                   break
                }
                if let member = gym.findMember(memberId: memberId) {
                    print("Enter number of points to recharge: ", terminator: "")
                    guard let numberOfPointsInput = readLine(), let numberOfPoints = Double(numberOfPointsInput) else {
                       print("Invalid number of points. Please enter a valid number.")
                       break
                    }
                    member.reloadCreditPoints(points: numberOfPoints)
                    print("Member \(member.name) now has a balance of \(member.creditBalance) credits after recharging \(numberOfPoints) points.")
                } else {
                    print("Member with ID \(memberId) not found.")
                }
            case 3:
                print("Enter the service name keywork: ", terminator: "")
                guard let serviceNameKeyword = readLine(), !serviceNameKeyword.isEmpty else {
                   print("Invalid value. Please try again.")
                   break
                }
                gym.searchService(serviceNameKeyword)
            case 4:
                print("Enter your member ID: ", terminator: "")
                guard let memberId = readLine(), !memberId.isEmpty else {
                   print("Invalid Member ID. Please try again.")
                   break
                }
                if let member = gym.findMember(memberId: memberId) {
                    print("Enter service ID to book: ", terminator: "")
                    if let serviceId = readLine() {
                        member.bookService(serviceId: serviceId, gym: gym)
                    }
                } else {
                    print("Member with ID \(memberId) not found.")
                }
            case 5:
                print("Enter your member ID: ", terminator: "")
                guard let memberId = readLine(), !memberId.isEmpty else {
                   print("Invalid Member ID. Please try again.")
                   break
                }
                if let member = gym.findMember(memberId: memberId) {
                    print("Enter the service ID to mark as attended: ", terminator: "")
                    guard let serviceId = readLine(), !serviceId.isEmpty else {
                        print("Invalid Service ID. Please try again.")
                        break
                    }
                    member.markSessionAsAttended(serviceId: serviceId)
                } else {
                    print("Member with ID \(memberId) not found.")
                }
            case 6:
                print("Enter your member ID: ", terminator: "")
                guard let memberId = readLine(), !memberId.isEmpty else {
                   print("Invalid Member ID. Please try again.")
                   break
                }
                if let member = gym.findMember(memberId: memberId) {
                    print("Enter service ID to cancel: ", terminator: "")
                    if let serviceId = readLine() {
                        member.cancelService(serviceId: serviceId, gym: gym)
                    }
                } else {
                    print("Member with ID \(memberId) not found.")
                }
            default:
                print("Invalid option. Please try again.")
            }
        }
    }
}

func main() {
    let gym = Gym()
    
    // Your code may already have some service sessions using hard-coded data in the list.
    let fitnessClass1 = FitnessClass(id: UUID().uuidString, name: "Morning Yoga", totalNumberOfSessions: 3, price: 25.0, trainerName: "Alice", duration: 60)
    let fitnessClass2 = FitnessClass(id: UUID().uuidString, name: "Zumba", totalNumberOfSessions: 8, price: 15.0, trainerName: "Bob", duration: 50)
    let fitnessClass3 = FitnessClass(id: UUID().uuidString, name: "Pilates", totalNumberOfSessions: 12, price: 20.0, trainerName: "Carol", duration: 55)
    let personalTraining1 = PersonalTraining(id: UUID().uuidString, name: "Weight Training", totalNumberOfSessions: 5, price: 20.0, trainerName: "David", sessionTime: 45)
    let personalTraining2 = PersonalTraining(id: UUID().uuidString, name: "HIIT", totalNumberOfSessions: 6, price: 25.0, trainerName: "Eva", sessionTime: 40)
    let personalTraining3 = PersonalTraining(id: UUID().uuidString, name: "CrossFit", totalNumberOfSessions: 7, price: 90.0, trainerName: "Frank", sessionTime: 60)
    gym.addService(fitnessClass1)
    gym.addService(fitnessClass2)
    gym.addService(fitnessClass3)
    gym.addService(personalTraining1)
    gym.addService(personalTraining2)
    gym.addService(personalTraining3)
    
    // Creating test members using hard-coded data
    let member1 = GymMember(id: UUID().uuidString, name: "Jhon")
    let member2 = GymMember(id: UUID().uuidString, name: "Jane")
    let member3 = GymMember(id: UUID().uuidString, name: "Bob")
    gym.addMember(member1)
    gym.addMember(member2)
    gym.addMember(member3)

    var shouldContinue = true
    while shouldContinue {
        print("\n--- Welcome to Gym Management System ---")
        print("1. Enter as Gym Owner (admin)")
        print("2. Enter as Gym Member")
        print("0. Exit")
        print("Enter your choice: ", terminator: "")
        if let userTypeChoice = readLine(), let userType = Int(userTypeChoice) {
            switch userType {
            case 0:
                shouldContinue = false
                print("Exiting the Gym Management System.")
            case 1:
                gymOwnerMenuOptions(gym: gym)
            case 2:
                gymMemberMenuOptions(gym: gym)
            default:
                print("Invalid option. Please try again.")
            }
        }
    }
}

main()
