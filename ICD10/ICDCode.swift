//
//  ICDCode.swift
//  ICD10
//
//  Created by Mahadevan, Ramesh on 2/3/15.
//  Copyright (c) 2015 GoliaMania. All rights reserved.
//

import Foundation

public class ICDCode : NSObject{
    var icdCdId: NSString?;
    var icdCdText: NSString?;
    var icdCdDesc: NSString?;
 
    
    
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
    

}