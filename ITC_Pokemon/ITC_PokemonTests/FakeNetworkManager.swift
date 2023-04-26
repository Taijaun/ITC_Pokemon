import Foundation
@testable import ITC_Pokemon

class FakeNetworkManager: Networker {
    
    func callApi(url: URL) async throws -> Data {
        
        let bundle = Bundle(for: FakeNetworkManager.self)
        
        guard let path = bundle.url(forResource: url.absoluteString, withExtension: "json") else {throw NetworkingError.invalidURL}
        
        do{
            let data = try Data(contentsOf: path)
            return data
        } catch {
            throw NetworkingError.dataNotFound
        }
        
    }
    
    
}
