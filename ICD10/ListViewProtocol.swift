//
//  ListViewProtocol.swift
//  ICD10
//
//  Created by Mahadevan, Ramesh on 2/3/15.
//  Copyright (c) 2015 GoliaMania. All rights reserved.
//


import Foundation
import UIKit;

@objc protocol  ListViewProtocol{
    func prepareTableView(itemCellId: NSString)-> Void;
    func prepareTableView(tableView: UITableView)-> Void;
    func getNumberOfRows() -> Int;
    func onCellForRowIndexSet(tableCell: UITableViewCell, rowData: AnyObject, indexPath: NSIndexPath)-> Void;
}