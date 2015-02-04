//
//  BaseModel.swift
//  ICD10
//
//  Created by Mahadevan, Ramesh on 2/3/15.
//  Copyright (c) 2015 GoliaMania. All rights reserved.
//

import Foundation
public class BaseModel : ChangeObserverProtocol{
    let dirtyModelNotificationKey = "CRUDBaseModel.Dirty";
    
    var isDirty:Bool!{
        willSet(newData){
            
        }
        didSet{
            onDirtyModel();
        }
    };
    
    init(){
        isDirty = false;
    
    }
    
    
    func observeChange(name: NSString, oldData: AnyObject!, newData: AnyObject!) -> Void{
        if(!self.isDirty){
            self.isDirty = true;
        }
    }
    
    private func onDirtyModel()-> Void{
        NSNotificationCenter.defaultCenter().postNotificationName(dirtyModelNotificationKey, object: self)
    }
    
    
}