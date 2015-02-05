//
//  ICDCodeDataStore.swift
//  ICD10
//
//  Created by Mahadevan, Ramesh on 2/4/15.
//  Copyright (c) 2015 GoliaMania. All rights reserved.
//

import Foundation
public class ICDCodeDataStore{
    var data:[ICDCode] = [ICDCode]();
    private init(){
    }
    
    class var  instance : ICDCodeDataStore{
        
        struct ICDCodeDataStoreInstance{
            static let instance = ICDCodeDataStore();
        }
        return ICDCodeDataStoreInstance.instance;
    }
    
    
    func save(icdCode: ICDCode)->Void{
        self.data.append(icdCode);
    }
    
    
}