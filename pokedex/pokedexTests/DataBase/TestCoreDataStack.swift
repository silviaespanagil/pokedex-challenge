//
//  TestCoreDataStack.swift
//  pokedexTests
//
//  Created by Silvia España on 26/5/22.
// https://www.raywenderlich.com/11349416-unit-testing-core-data-in-ios

import XCTest
import CoreData
@testable import pokedex

class TestCoreDataStack: CoreDataStack {
    
    private let modelName = "Model"
    
    override init() {
        
        super.init()
        
        let persistentStoreDescription = NSPersistentStoreDescription()
        persistentStoreDescription.type = NSInMemoryStoreType
        
        let container = NSPersistentContainer(name: modelName)
        
        container.persistentStoreDescriptions = [persistentStoreDescription]
        
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        
        storeContainer = container
    }
}
