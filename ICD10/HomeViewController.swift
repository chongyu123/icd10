//
//  HomeViewController.swift
//  ICD10
//
//  Created by Mahadevan, Ramesh on 2/3/15.
//  Copyright (c) 2015 GoliaMania. All rights reserved.
//

import Foundation
import UIKit

class HomeViewController: ListViewController, UISearchBarDelegate, UISearchDisplayDelegate   {
    
    @IBOutlet weak var filterSearch: UISearchBar!

    @IBOutlet weak var icdList: UITableView!
    @IBAction func onRefresh(sender: AnyObject) {
        
        self.refreshList();
    }
    
    
    var icdCodes:[ICDCode] = ICDCode.mock();
    var selectedItem:ICDCode?;
    
    
    override func viewDidLoad() {
        super.viewDidLoad();
        self.tableView = icdList;
        self.prepareTableView("icdCode");
        self.dataContext = icdCodes;
        filterSearch.delegate=self;
        
    }
    
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated);
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated);
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "detailItem"){
            var rowIdx = self.icdList.indexPathForSelectedRow()?.row;
            selectedItem = self.icdCodes[rowIdx!];
//            var detailView = segue.destinationViewController as TaskyDetailViewController;
//            detailView.dataContext = selectedTasky;
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
        return 65;
    }
    
    
    override func onCellForRowIndexSet(tableCell: UITableViewCell, rowData: AnyObject, indexPath: NSIndexPath, canUserInteract: Bool) -> Void{
        var cell = tableCell as ItemCell;
        var icdCode = rowData as ICDCode;
        cell.icdCode.text = icdCode.icdCdId;
        cell.icdText.text = icdCode.icdCdText;
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar){
        searchBar.text = "";
        searchBar.resignFirstResponder();
        var result = ICDCode.mock();
        self.dataContext = result;
        self.icdList.scrollEnabled=true;
        self.icdList.userInteractionEnabled = true;
        isSearchOn = false;
        self.tableView.reloadData();
        self.navigationController?.setNavigationBarHidden(false, animated: true);
    }
    
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchBar.resignFirstResponder();
        var result = ICDCode.mock(searchBar.text);

        self.dataContext = result;
        self.tableView.reloadData();
        self.navigationController?.setNavigationBarHidden(false, animated: true);
        self.icdList.scrollEnabled=true;
        self.icdList.userInteractionEnabled = true;
        
    }
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar){
        searchBar.setShowsCancelButton(true, animated: true);
        self.navigationController?.setNavigationBarHidden(true, animated: true);
        isSearchOn = true;
        self.icdList.userInteractionEnabled = false;
        self.icdList.scrollEnabled=false;
        self.icdList.reloadData();
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar){
        searchBar.setShowsCancelButton(false, animated: true);
    }
    
}
