//
//  GenericValueProtocol.swift
//  PopCornFlix
//
//  Created by Burak Nurçiçek on 7.02.2021.
//

import Foundation

public protocol GenericValueProtocol {
    
    associatedtype Value
    var value: Value { get }
    
}
