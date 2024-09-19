//
//  Gym.swift
//  Group04_Gym
//

class Gym {
    var members: [GymMember] = []
    var services: [Service] = []
    
    func addMember(_ member: GymMember) {
        members.append(member)
    }

    func findMember(menberId: String) -> GymMember? {
        return members.first(where: { $0.id == menberId })
    }
    
    func findService(serviceId: String) -> Service? {
        return services.first(where: { $0.id == serviceId })
    }
    
    func createNewService(_ service: Service) {
        services.append(service)
    }
    
    func listAllServices() {
        if services.isEmpty {
            print("There are noservices available.")
            return
        }
        for service in services {
            print(service.serviceDescription)
        }
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

    func searchService(_ keyword: String) {
        let results = services.filter { $0.name.contains(keyword) }
        if results.isEmpty {
            print("No services found with the keyword '\(keyword)'.")
            return
        }
        for service in results {
            print(service.serviceDescription)
        }
    }
}
