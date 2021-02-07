//
//  VisualContents.swift
//  PopCornFlix
//
//  Created by Burak Nurçiçek on 7.02.2021.
//

import UIKit

public typealias CommonIcons = VisualContents.CommonIcons

public enum VisualContents {
    
    public enum CommonIcons: GenericValueProtocol {
       
        public typealias Value = UIImage

        case launchScreen
        case favorite
        case unfavorite
        
        public var value: UIImage {
            switch self {
            case .launchScreen:
                return UIImage(imageLiteralResourceName: "launchScreen")
            case .favorite:
                return UIImage(imageLiteralResourceName: "favorite_selected")
            case .unfavorite:
                return UIImage(imageLiteralResourceName: "favorite_unselected")
            
            }
        }
    }
    
    
    
}
