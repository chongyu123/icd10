//
//  ICDCodeDownloader.swift
//  ICD10
//
//  Created by Mahadevan, Ramesh on 2/3/15.
//  Copyright (c) 2015 GoliaMania. All rights reserved.
//

import Foundation

public class ICDCodeDownloader:  NSOperation{
    var rawData : NSString = "";
    let dataFile: NSString = "icd-codes";
    
    override init(){
        super.init();
        self.completionBlock = {
            println("Complete");
        }
    }
    
    override public func main () {
        if self.cancelled {
            return
        }
        if(!ICDCode.isExists()){
            FileManager.readTextFile(dataFile, callback: { (fileContent) -> Void in
                
                println("read File");
                var parser:ICDCodeParser = ICDCodeParser(rawData:fileContent);
                parser.start();
            })
            println("Started ");
        }else{
            println("Contains");
            self.cancel();
        }
        
    }
    
    
    
}