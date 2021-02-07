//
//  ServiceClient.swift
//  PopCornFlix
//
//  Created by Burak Nurçiçek on 7.02.2021.
//

import Foundation
import Alamofire

protocol ServiceClientProtocol {
    func makeRequestWithData(route: URLRequestConvertible, completion: @escaping (_ responseData: Data?, _ error: Error?) -> Void)
    func makeRequest(route: URLRequestConvertible, completion: @escaping (_ response: Any?, _ error: Error?) -> Void)
}

class ServiceClient: ServiceClientProtocol {
    
    func makeRequestWithData(route: URLRequestConvertible, completion: @escaping (_ responseData: Data?, _ error: Error?) -> Void) {
        AF.request(route).validate().responseData { (response) in
            if let request = response.request,
               let url = request.url {
            }
            completion(response.value, response.error)
        }
    }
    
    func makeRequest(route: URLRequestConvertible, completion: @escaping (_ response: Any?, _ error: Error?) -> Void) {
        AF.request(route).validate().responseJSON { (response) in
            completion(response.value, response.error)
        }
        
    }
}
