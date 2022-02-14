//
//  WeatherListTableViewController.swift
//  GoodWheather
//
//  Created by Metin Atalay on 12.02.2022.
//

import Foundation
import UIKit

class WeatherListTableViewController: UITableViewController,AddWeatherDelegate,SettingsDelegete {
   
    
    private var weatherList = WeatherListViewModel()
    
    func addWeatherDidSave(vm: WeatherViewModel) {
        weatherList.addWeatherViewModel(vm)
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherList.numberOfRows()
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "wheatherCell", for: indexPath) as! WheatherTableViewCell
        
        let weather = weatherList.modalAt(indexPath.row)
        cell.cityNameLabel.text = weather.city
        cell.temperature.text = weather.temperature.formatAsDegree()
        
        return cell
    }
    
    func done() {
     
        
        let userDefaults = UserDefaults.standard
        var unitValue = ""
        if let value = userDefaults.value(forKey: "unit") as? String {
            unitValue = value
        }

        
        weatherList.updateUnit(to: Unit(rawValue: unitValue)!)
        
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddWheatherCityViewController" {
            
            guard let nav  = segue.destination as? UINavigationController else {
                fatalError("navigation not found")
            }
            
            guard let addWeathercityVC = nav.viewControllers.first as? AddWheatherCityViewController else {
                fatalError("page not found")
            }
            
            addWeathercityVC.delegate = self
            
        }
        
        if segue.identifier == "SettingsTableViewController" {
            if let page = segue.destination as? SettingsTableViewController {
                page.delegete = self
            }
                
        }
    }
    
    
}
