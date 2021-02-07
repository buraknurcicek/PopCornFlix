//
//  String+Extension.swift
//  PopCornFlix
//
//  Created by Burak Nurçiçek on 7.02.2021.
//

import Foundation

// MARK: - Localized String Methods -
extension String {
    
    func toLocalize() -> String{
        return NSLocalizedString(self, comment: "")
    }
    
}
