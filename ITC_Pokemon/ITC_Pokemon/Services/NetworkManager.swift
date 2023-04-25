//
//  NetworkManager.swift
//  ITC_Pokemon
//
//  Created by Taijaun Pitt on 25/04/2023.
//

import Foundation

class NetworkManager: Networker {
    
    func callApi(url: URL) async throws -> Data {
        
        // Structured concurrency
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            return data
        } catch let error{
            throw error
        }
        
    }
    
    
    
}
