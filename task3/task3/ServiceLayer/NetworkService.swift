//
//  NetworkService.swift
//  task3
//
//  Created by mac on 19.01.2021.
//

import Foundation

protocol NetworkServiceProtocol {
    func getNews(page: Int, completion: @escaping (Result<([News]?, Int?), Error>) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    
    private let apiKey = "17b0d369-2abc-4aac-9f22-97619b66faf9"
  
    func getNews(page: Int, completion: @escaping (Result<([News]?, Int?), Error>) -> Void) {
        
        let urlString = "https://content.guardianapis.com/search?api-key=\(apiKey)&page=\(page)"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                guard let data = data else { return }
                do {
                    let dataResponse = try JSONDecoder().decode(DataResponse.self, from: data)
                    let news = dataResponse.item?.news
                    let currentPage = dataResponse.item?.currentPage
                    completion(.success((news, currentPage)))
                } catch {
                    completion(.failure(error))
                }
        }.resume()
    }
}
