//
//  CancelButton.swift
//  Bucket List crUD
//
//  Created by admin on 29/12/2021.
//
import UIKit
protocol BarButtonsDelegate: class {
    func cancelButtonPressed(by controller: AddToTableViewController)
    
    func saveButtonPressed(by controller: AddToTableViewController , with text : String , at indexPath: NSIndexPath?)

}
