//
//  ICDCodeEntity.swift
//  ICD10
//
//  Created by Mahadevan, Ramesh on 2/4/15.
//  Copyright (c) 2015 GoliaMania. All rights reserved.
//

import Foundation
import CoreData

@objc(ICDCodeEntity)
public class ICDCodeEntity: NSManagedObject {
    
    @NSManaged var icdCodeId: String
    @NSManaged var isHeader: String
    @NSManaged var longDesc: String
    @NSManaged var orderNumber: String
    @NSManaged var shortDesc: String
    
}
