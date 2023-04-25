//
//  Networker.swift
//  ITC_Pokemon
//
//  Created by Taijaun Pitt on 25/04/2023.
//

import Foundation

protocol Networker {
    
    func callApi(urlString: String) async throws -> Data
    
}
