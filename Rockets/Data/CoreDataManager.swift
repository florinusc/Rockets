//
//  CoreDataManager.swift
//  Rockets
//
//  Created by Florin Uscatu on 21.02.2021.
//

import UIKit
import CoreData

class CoreDataManager {
    
    func save(rockets: [Rocket]) throws {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        try deleteEntries()
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "RocketEntity", in: managedContext)!
        for rocket in rockets {
            let rocketObject = NSManagedObject(entity: entity, insertInto: managedContext)
            rocketObject.setValue(rocket.name, forKeyPath: "name")
            rocketObject.setValue(rocket.imageUrl, forKeyPath: "imageUrl")
            rocketObject.setValue(rocket.successRate, forKeyPath: "successRate")
            rocketObject.setValue(rocket.active, forKeyPath: "active")
            rocketObject.setValue(rocket.country, forKeyPath: "country")
            rocketObject.setValue(rocket.description, forKeyPath: "rocketDesc")
            rocketObject.setValue(rocket.dateOfFirstFlight, forKeyPath: "dateOfFirstFlight")
            rocketObject.setValue(rocket.costPerLaunch, forKeyPath: "costPerLaunch")
            rocketObject.setValue(rocket.wikipediaUrl, forKeyPath: "wikipediaUrl")
        }
        try managedContext.save()
    }
    
    func fetchRockets() throws -> [Rocket] {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { throw CustomError.general }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "RocketEntity")
        return try managedContext.fetch(fetchRequest).compactMap { Rocket(object: $0) }
        
    }
    
    private func deleteEntries() throws {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedObjectContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "RocketEntity")
        let request: NSBatchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        try managedObjectContext.execute(request)
        try managedObjectContext.save()
    }
    
}
