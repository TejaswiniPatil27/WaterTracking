//
//  DBHelper.swift
//  WaterTracking
//
//  Created by Tejaswini Patil on 17/04/24.
//

import Foundation
import UIKit
import CoreData
var dbhelperInstance = DBHelper()
class DBHelper: NSObject {
    // Reference to the managed object context
       let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func addUserObject(myUser: MyUser) {
        // Create a new managed object
        let User = User(context: self.context)
        User.name = myUser.name
        User.gender = myUser.gender
        User.weight = myUser.weight
        User.totalWaterIntake = myUser.totalWaterIntake
       
        do {
            try context.save()
            print("Data inserted successfully.")
        } catch let error as NSError {
            print("Could not save data. \(error), \(error.userInfo)")
        }
    }
    
    func getTotalWaterTaken() -> String{
        var totalWaterTaken: String = ""
        do {
            // Perform fetch request
            let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
            var result: [User] = []
            result = try context.fetch(fetchRequest)
            for data in result {
                totalWaterTaken = data.totalWaterIntake ?? ""
            }
        } catch let error as NSError {
            print("Could not fetch data. \(error), \(error.userInfo)")
        }
        return totalWaterTaken
    }
    
}
