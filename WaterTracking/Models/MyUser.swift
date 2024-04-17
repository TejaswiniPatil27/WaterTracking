//
//  MyUser.swift
//  WaterTracking
//
//  Created by Tejaswini Patil on 17/04/24.
//

import Foundation

class MyUser: Codable {
    var name, gender, weight, waterIntake, totalWaterIntake: String?
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case gender = "gender"
        case weight = "weight"
        case waterIntake = "waterIntake"
        case totalWaterIntake = "totalWaterIntake"
    }
        
    init(name: String? = nil, gender: String? = nil, weight: String? = nil, waterIntake: String? = nil, totalWaterIntake: String? = nil) {
        self.name = name
        self.gender = gender
        self.weight = weight
        self.waterIntake = waterIntake
        self.totalWaterIntake = totalWaterIntake
    }
    
}
