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
    var longDescRange = NSRange(location: 77, length: 376);

    
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
        var icdCode:ICDCode!
        var icdCdId:NSString!;
        var icdCdText:NSString!;
        var icdCdDesc:NSString!;
        var icdRow:NSString!;
        println("Start: \(NSDate())");
        var cnt=0;
        for row in rows{
            icdRow = row as NSString;
            if(icdRow.length>0){
                cnt++;
                icdCdId = icdCodeFromRow(row);
                icdCdText = icdCodeFromRow(row);
                icdCdDesc = icdLongDescFromRow(row);
                icdCode = ICDCode(icdCdId: icdCdId, icdCdText: icdCdText, icdCdDesc: icdCdDesc);
                icdCode.save();
            }
        }
        println("Complete");
        println("End: \(NSDate()), Total Processed: \(ICDCodeDataStore.instance.data.count)");
        NSNotificationCenter.defaultCenter().postNotificationName(NotificationKeys.PROCESS_COMPLETE, object: nil, userInfo: nil);
    }
    
    private func orderNumberFromRow(row: NSString)->NSString{
        var test = row.substringFromIndex(orderNumberRange.location);
        return (row.substringFromIndex(orderNumberRange.location) as NSString).stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet());
    }
    
    private func icdCodeFromRow(row: NSString)->NSString{
        return( (row.substringFromIndex(icdCodeRange.location) as NSString).substringToIndex(icdCodeRange.length-icdCodeRange.location));
    }
    
    private func icdShortDescFromRow(row: NSString)->NSString{
        return( (row.substringFromIndex(shortDescRange.location) as NSString).substringToIndex(shortDescRange.length-shortDescRange.location)).stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet());
        
    }
    
    private func icdLongDescFromRow(row: NSString)->NSString{
        return (row.substringFromIndex(longDescRange.location));
    }
    
}