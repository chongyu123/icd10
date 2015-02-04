//
//  ICDCode.swift
//  ICD10
//
//  Created by Mahadevan, Ramesh on 2/3/15.
//  Copyright (c) 2015 GoliaMania. All rights reserved.
//

import Foundation
import UIKit;
import CoreData;

public class ICDCode : NSObject{
    var icdCdId: NSString;
    var icdCdText: NSString;
    var icdCdDesc: NSString;
    let appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate;
    
    
    //    var appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate;
    //    userEntity.userName = "helloUser";
    //    userEntity.password = "123456";
    //    appDelegate.dbContext.saveContext(appDelegate.dbContext.backgroundContext!);
    
    
    
    init(icdCdId:NSString, icdCdText: NSString, icdCdDesc: NSString){
        self.icdCdId = icdCdId;
        self.icdCdText = icdCdText;
        self.icdCdDesc = icdCdDesc;
        super.init();
    }
    class func mock()->[ICDCode]{
        var icdCodes:[ICDCode] = [];
        
        var icd:ICDCode = ICDCode(icdCdId: "00001", icdCdText: "Cholera",icdCdDesc: "Cholera");
        icdCodes.append(icd);
        
        icd = ICDCode(icdCdId: "00001", icdCdText: "Cholera",icdCdDesc: "Cholera");
        icdCodes.append(icd);
        
        icd = ICDCode(icdCdId: "00001", icdCdText: "Cholera",icdCdDesc: "Cholera");
        icdCodes.append(icd);
        
        icd = ICDCode(icdCdId: "00001", icdCdText: "Cholera",icdCdDesc: "Cholera");
        icdCodes.append(icd);
        
        icd = ICDCode(icdCdId: "00001", icdCdText: "Cholera",icdCdDesc: "Cholera");
        icdCodes.append(icd);
        
        icd = ICDCode(icdCdId: "00001", icdCdText: "Cholera",icdCdDesc: "Cholera");
        icdCodes.append(icd);
        
        icd = ICDCode(icdCdId: "00001", icdCdText: "Cholera",icdCdDesc: "Cholera");
        icdCodes.append(icd);
        icd = ICDCode(icdCdId: "00001", icdCdText: "Cholera",icdCdDesc: "Cholera");
        icdCodes.append(icd);
        
        icd = ICDCode(icdCdId: "00001", icdCdText: "Cholera",icdCdDesc: "Cholera");
        icdCodes.append(icd);
        
        return icdCodes;
    }
    
    class func mock(searchBy: NSString) -> [AnyObject]{
        var filter = NSPredicate(format: "(self.icdCdText contains[c] %@)", searchBy);
        var mocks = self.mock();
        var mutable = NSMutableArray(array: mocks);
        return mutable.filteredArrayUsingPredicate(filter!);
    }
    
    
    func save()->Void{
//        var icdORM:ICDCodeEntity = NSEntityDescription.insertNewObjectForEntityForName("IcdCode", inManagedObjectContext: appDelegate.dbContext.backgroundContext!) as ICDCodeEntity;
//        icdORM.icdCodeId = self.icdCdId;
//        icdORM.longDesc = self.icdCdDesc;
//        icdORM.shortDesc = self.icdCdText;
//        appDelegate.dbContext.saveContext(appDelegate.dbContext.backgroundContext!);
        
    }
    
}