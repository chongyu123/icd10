//
//  ChangeObserverProtocol.swift
//  ICD10
//
//  Created by Mahadevan, Ramesh on 2/3/15.
//  Copyright (c) 2015 GoliaMania. All rights reserved.
//

import Foundation

@objc protocol  ChangeObserverProtocol{
    func observeChange(name: NSString, oldData: AnyObject!, newData: AnyObject!) -> Void;
    
}