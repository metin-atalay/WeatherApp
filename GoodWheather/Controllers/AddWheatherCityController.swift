//
//  AddWheatherCityController.swift
//  GoodWheather
//
//  Created by Metin Atalay on 12.02.2022.
//

import Foundation
import UIKit

protocol AddWeatherDelegate {
    func addWeatherDidSave(vm : WeatherViewModel)
}

class AddWheatherCityViewController: UIViewController {
    
    @IBOutlet weak var cityNameLabel: UITextField!
    var delegate: AddWeatherDelegate?
   
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveAction(_ sender: Any) {
        
        if let city = cityNameLabel.text {
            AddWeatherViewModel().addWeather(for: city) { (vm) in
                self.delegate?.addWeatherDidSave(vm: vm)
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func clsButtonAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
