//
//  ICDCodeParser.swift
//  ICD10
//
//  Created by Mahadevan, Ramesh on 2/3/15.
//  Copyright (c) 2015 GoliaMania. All rights reserved.
//

import Foundation

public class ICDCodeParser: NSOperation{
    let rawData:String!;
    let orderNumberRange = NSRange(location: 0, length: 4);
    let icdCodeRange = NSRange(location: 6, length: 12);
    let shortDescRange = NSRange(location: 16, length: 75);
    let longDescRange = NSRange(location: 77, length: 376);
    override init(){
        super.init();
        self.completionBlock = {
            println("Complete1");
        }
        
    }
    init(rawData:String){
        super.init();
        self.rawData = rawData;
        self.buildIcdCodes(self.rawData.componentsSeparatedByCharactersInSet(NSCharacterSet.newlineCharacterSet()));
    }
    public override func start() {
            println("Started Start");
    }
    
    override public func main () {
        println("Started 1");
        if self.cancelled {
            return
        }
        println("Started 2");
    }
    
    
    private func buildIcdCodes(rows:[String])->Void{
        for row in rows{
            
        }
    }
    
    
    private func orderNumberFromRow(row: NSString)->NSString{
        return row.substringWithRange(orderNumberRange);
    }
    
    private func icdCodeFromRow(row: NSString)->NSString{
        return row.substringWithRange(icdCodeRange);
    }
 
    private func icdShortDescFromRow(row: NSString)->NSString{
        return row.substringWithRange(shortDescRange);
        
    }

    private func icdLongDescFromRow(row: NSString)->NSString{
        return row.substringWithRange(longDescRange);
        
    }

}