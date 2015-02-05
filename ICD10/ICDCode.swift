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
        var result = queryICDCodes(100);
        println("Result \(result.count)");
        var cnt=0;
        for icdEntity in ICDCodeDataStore.instance.data {
            if(cnt==0){
                println("Result Is : \(icdEntity as ICDCode)");
            }
            cnt++;
        }
        return ICDCodeDataStore.instance.data;
    }
    
    class func mock(searchBy: NSString) -> [AnyObject]{
        var filter = NSPredicate(format: "(self.icdCdText contains[c] %@)", searchBy);
        var mocks = self.mock();
        var mutable = NSMutableArray(array: mocks);
        return mutable.filteredArrayUsingPredicate(filter!);
    }
    
    
    func save()->Void{
        ICDCodeDataStore.instance.save(self);
//        var icdORM:ICDCodeEntity = NSEntityDescription.insertNewObjectForEntityForName("ICDCodeEntity", inManagedObjectContext: appDelegate.dbContext.backgroundContext!) as ICDCodeEntity;
//        icdORM.icdCodeId = self.icdCdId;
//        icdORM.longDesc = self.icdCdDesc;
//        icdORM.shortDesc = self.icdCdText;
//        icdORM.isHeader = "YES";
//        appDelegate.dbContext.saveContext(appDelegate.dbContext.backgroundContext!);
        
    }
    
    class func isExists() -> Bool{
        let appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate;
        var fetchReq: NSFetchRequest = NSFetchRequest(entityName: "ICDCodeEntity");
        fetchReq.fetchLimit = 1;
        var result = appDelegate.dbContext.managedObjectContext!.executeFetchRequest(fetchReq, error:nil);
        var exists = result?.count > 0 ? true : false;
        return exists;
    }
    
    class func queryICDCodes(fetchLimit: Int) -> [AnyObject]{
        let appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate;
        var fetchReq: NSFetchRequest = NSFetchRequest(entityName: "ICDCodeEntity");
        fetchReq.returnsObjectsAsFaults=false;
        fetchReq.shouldRefreshRefetchedObjects=true;
        fetchReq.fetchLimit = fetchLimit;
        var result = appDelegate.dbContext.managedObjectContext!.executeFetchRequest(fetchReq, error:nil);
        println(result);
        return result!;
    }
    
}