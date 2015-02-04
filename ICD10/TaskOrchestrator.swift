//
//  TaskOrchestrator.swift
//  ICD10
//
//  Created by Mahadevan, Ramesh on 2/3/15.
//  Copyright (c) 2015 GoliaMania. All rights reserved.
//

import Foundation

public class TaskOrchestrator: NSOperationQueue{

    override init(){
        var parser:ICDCodeDownloader = ICDCodeDownloader();
        parser.qualityOfService = .Background;
//        parser.addDependency(ICDCodeParser());

        NSOperationQueue.mainQueue().addOperation(parser);
    }
    
}