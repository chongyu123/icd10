//
//  DBContext.swift
//  ICD10
//
//  Created by Mahadevan, Ramesh on 2/4/15.
//  Copyright (c) 2015 GoliaMania. All rights reserved.
//

import Foundation
import CoreData;
import UIKit;

class DBContext : NSObject{
    
    let dataStore: DataStore!;
    
    override init(){
        super.init()
        // all CoreDataHelper share one CoreDataStore defined in AppDelegate
        let appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate;
        self.dataStore = appDelegate.dataStore;
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "contextDidSaveContext:", name: NSManagedObjectContextDidSaveNotification, object: nil)
    }
    
    deinit{
        NSNotificationCenter.defaultCenter().removeObserver(self);
    }
    
    lazy var managedObjectContext: NSManagedObjectContext? = {
        // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.) This property is optional since there are legitimate error conditions that could cause the creation of the context to fail.
        let coordinator = self.dataStore.persistentStoreCoordinator
        if coordinator == nil {
            return nil
        }
        var managedObjectContext = NSManagedObjectContext()
        managedObjectContext.persistentStoreCoordinator = coordinator
        return managedObjectContext
        }();
    
    lazy var backgroundContext: NSManagedObjectContext? = {
        // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.) This property is optional since there are legitimate error conditions that could cause the creation of the context to fail.
        let coordinator = self.dataStore.persistentStoreCoordinator
        if coordinator == nil {
            return nil
        }
        var backgroundContext = NSManagedObjectContext(concurrencyType: NSManagedObjectContextConcurrencyType.PrivateQueueConcurrencyType)
        backgroundContext.persistentStoreCoordinator = coordinator
        return backgroundContext
        }();
    
    // MARK: - Core Data Saving support
    
    
    // save NSManagedObjectContext
    func saveContext (context: NSManagedObjectContext) {
        var error: NSError? = nil
        if context.hasChanges && !context.save(&error) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog("Unresolved error \(error), \(error!.userInfo)")
            abort()
        }
    }
    
    func saveContext () {
        self.saveContext( self.backgroundContext! )
    }
}