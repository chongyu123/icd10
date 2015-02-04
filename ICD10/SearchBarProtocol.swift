//
//  SearchBarProtocol.swift
//  ICD10
//
//  Created by Mahadevan, Ramesh on 2/3/15.
//  Copyright (c) 2015 GoliaMania. All rights reserved.
//


import Foundation
import UIKit;

@objc protocol  SearchBarProtocol{
    func filteredSearchOn(searchText: NSString) -> Void;
    func filteredSearchOff()->Void;
    
   
}