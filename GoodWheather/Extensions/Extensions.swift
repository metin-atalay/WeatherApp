//
//  String+Extensions.swift
//  GoodWheather
//
//  Created by Metin Atalay on 13.02.2022.
//

import Foundation

extension String {
    
    func escaped() -> String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }
    
}
