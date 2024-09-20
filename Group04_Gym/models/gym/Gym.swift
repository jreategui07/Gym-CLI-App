//
//  Gym.swift
//  Group04_Gym
//

class Gym {
    var members: [GymMember] = []
    var services: [Service] = []
    
    // member methos
    
    func addMember(_ member: GymMember) {
        members.append(member)
    }

    func findMember(memberId: String) -> GymMember? {
        return members.first(where: { $0.id == memberId })
    }
    
    func createMember(_ member: GymMember) {
        members.append(member)
    }
    
    func listAllMembers() {
        if members.isEmpty {
            print("There are no registered members.")
            return
        }
        for member in members {
            print(member.name)
        }
    }
    
    func searchMember(_ memberName: String) {
        let results = members.filter { $0.name.contains(memberName) }
        if results.isEmpty {
            print("No member found with the keyword '\(memberName)'.")
            return
        }
        for member in results {
            print(member.name)
        }
    }
    
    // service methods
    
    func addService(_ service: Service) {
        services.append(service)
    }
    
    func findService(serviceId: String) -> Service? {
        return services.first(where: { $0.id == serviceId })
    }
    
    func createwService(_ service: Service) {
        services.append(service)
    }
    
    func listAllServices() {
        if services.isEmpty {
            print("There are no services available.")
            return
        }
        for service in services {
            print(service.serviceDescription)
        }
    }

    func searchService(_ keyword: String) { // The gym membership system includes a search feature that allows users to find services by keyword
        let results = services.filter { $0.name.contains(keyword) }
        if results.isEmpty {
            print("No services found with the keyword '\(keyword)'.")
            return
        }
        print("The following services where found for the keyword '\(keyword)'.")
        for service in results {
            print(service.serviceDescription)
        }
    }
}
