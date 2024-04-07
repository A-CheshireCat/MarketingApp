//
//  NetworkManager.swift
//  MarketingApp
//
//  Created by Alexandra on 07.04.2024.
//

import Foundation

final class NetworkManager {
    static let instance = NetworkManager()
    
    private let channelsURL = "https://api.jsonserve.com/1XaHGy"
    
    private init() {}
    
    func getChannels(completion: @escaping (Result<[ChannelModel], MAError>) -> Void){
        guard let url = URL(string: channelsURL) else {
            completion(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let _ = error {
                completion(.failure(.generalError))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.serverError))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode([ResponseChannel].self, from: data)
                
                var channels = [ChannelModel]()
                decodedData.forEach { data in
                    channels.append(ChannelModel(responseChannel: data))
                }
                
                completion(.success(channels))
            } catch {
                completion(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
}
