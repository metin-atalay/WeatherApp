//
//  SettingsTableViewController.swift
//  GoodWheather
//
//  Created by Metin Atalay on 13.02.2022.
//

import Foundation
import UIKit

protocol SettingsDelegete {
    func done()
}

class SettingsTableViewController : UITableViewController {
    
    private var settingsViewModel = SettingsViewModel()
    
    var delegete : SettingsDelegete?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var selectedUnit = settingsViewModel.units[indexPath.row]
        settingsViewModel.selectedUnit = selectedUnit
        delegete?.done()
        self.dismiss(animated: true, completion: nil)
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsViewModel.units.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let settingsItem = settingsViewModel.units[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsCell")
        cell?.textLabel?.text = settingsItem.displayName
        
        if  settingsViewModel.selectedUnit != nil && settingsItem == settingsViewModel.selectedUnit {
            cell?.accessoryType = .checkmark
        }
        
        
        return cell!
    }
    
    
    
}
