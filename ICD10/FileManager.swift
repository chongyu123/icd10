//
//  FileManager.swift
//  ICD10
//
//  Created by Mahadevan, Ramesh on 2/3/15.
//  Copyright (c) 2015 GoliaMania. All rights reserved.
//

import Foundation
public class FileManager{
    
    class func pathForResource(fileName: String, ofType: String) -> String!{
        return NSBundle.mainBundle().pathForResource(fileName, ofType: ofType);
    }
    
    class func readFile(fileName: String, ofType: String) -> String{
        var fileRoot = pathForResource(fileName, ofType: ofType);
        return String(contentsOfFile: fileRoot!, encoding: NSUTF8StringEncoding, error: nil)!;
    }
    
    
    class func readTextFile(fileName: String) -> String{
        return readFile(fileName, ofType: "txt");
    }
    
    class func readTextFile(fileName: String, callback: (fileContent: String!) -> Void){
        println(fileName);
        var result = readTextFile(fileName);
        callback(fileContent:result);
        
    }
    
}