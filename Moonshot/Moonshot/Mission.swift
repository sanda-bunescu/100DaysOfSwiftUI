//
//  Mission.swift
//  Moonshot
//
//  Created by Sanda Bunescu on 19.09.2023.
//

import Foundation

struct Mission: Codable , Identifiable{
    struct CrewMembers: Codable{
        let name: String
        let role: String
    }
    let id: Int
    let launchDate: Date?
    let crew: [CrewMembers]
    let description: String
    
    var displayName: String{
        "Apollo \(id)"
    }
    var imageName: String{
        "apollo\(id)"
    }
    
    var dispalyFormatedDate: String{
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
    var displayDateOnScreen: String{
        launchDate?.formatted(date: .complete, time: .omitted) ?? "N/A"
    }
}
