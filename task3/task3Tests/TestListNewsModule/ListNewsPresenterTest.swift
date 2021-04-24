//
//  NewsListPresenterTest.swift
//  task3Tests
//
//  Created by mac on 19.04.2021.
//

import XCTest
@testable import task3

class MockListNewsView: ListNewsViewProtocol {
    func succes() {
    }
    
    func failure(error: Error) {
    }
}

class MockNetworkService: NetworkServiceProtocol {
    var news: [News]!
    let currentPage = 0
    
    init() {}
    
    convenience init(news: [News]?) {
        self.init()
        self.news = news
    }
    
    func getNews(page: Int, completion: @escaping (Result<([News]?, Int?), Error>) -> Void) {
        if let news = news {
            completion(.success((news, currentPage)))
        } else {
            let error = NSError(domain: "", code: 0, userInfo: nil)
            completion(.failure(error))
        }
    }
}

class ListNewsPresenterTest: XCTestCase {
    var view: MockListNewsView!
    var presenter: ListNewsPresenter!
    var networkService: NetworkServiceProtocol!
    var news = [News]()
    
    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
        view = nil
        presenter = nil
        networkService = nil
    }
    
    func testGetSuccesNews() {
        let currentNews = News(sectionName: "Foo", webPublicationDate: "Baz", webTitle: "Bar")
        news.append(currentNews)
        
        view = MockListNewsView()
        networkService = MockNetworkService(news: [currentNews])
        presenter = ListNewsPresenter(view: view, networkService: networkService)
        
        var catchNews: ([News]?,Int?)
        
        networkService.getNews(page: 0) { (result) in
            switch result {
            case.success(let news):
                catchNews = news
            case.failure(let error):
                print(error)
            }
        }
        XCTAssertNotNil(catchNews, "catchNews not nill")
        XCTAssertEqual(catchNews.1, 0) 
    }

}
