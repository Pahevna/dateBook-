//
//  DetailViewController.swift
//  task3
//
//  Created by mac on 20.01.2021.
//

import UIKit

class ListNewsViewController: UIViewController {

    // MARK: - Public Property
   
    var listNewsPresenter: ListNewsPresenterProtocol?
    
    // MARK: - Private Property
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        
        return collectionView
    }()
    
    private let searchController = UISearchController(searchResultsController: nil)
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "News"
        
        view.addSubview(collectionView)        
        setupSearchBar()
        setupCollectionView()
        setupCollectionConstraints()
        listNewsPresenter?.getNews()
    }
    
    // MARK: - Private Methods
    
    private func setupSearchBar() {
        navigationItem.searchController = searchController
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search news"
        searchController.searchBar.delegate = self 
    }
    
    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ListNewsCollectionViewCell.self,
                                forCellWithReuseIdentifier: ListNewsCollectionViewCell.identifier)
    }
    
    private func setupCollectionConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}

// MARK: - DetailViewProtocol

extension ListNewsViewController: ListNewsViewProtocol {
    
    func succes() {
        collectionView.reloadData()
    }
    
    func failure(error: Error) {
        let alert = UIAlertController(title: "Warning!", message: "Error: \(error.localizedDescription)", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// MARK: - Collection View Data Source

extension ListNewsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listNewsPresenter?.news?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListNewsCollectionViewCell.identifier, for: indexPath) as! ListNewsCollectionViewCell
        let cellData = listNewsPresenter?.news?[indexPath.item]
        let convertString = cellData?.webPublicationDate?.dateFromISOstringToddMMyyyy(date: cellData?.webPublicationDate ?? "")
        
        cell.setDataToCell(sectionName: cellData?.sectionName ?? "sectionName", webTitle: cellData?.webTitle ?? "title", webPublicationDate: convertString ?? "date", controller: self)
        return cell
    }
    
  func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {

   guard let arrayNews = listNewsPresenter?.news else { return }
    
    if indexPath.row == arrayNews.count - 1 {
        listNewsPresenter?.getMoreNews()
    }
  }
}

// MARK: - Collection View Delegate Flow Layout

extension ListNewsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
}

// MARK: - Search Bar Deleagate

extension ListNewsViewController: UISearchBarDelegate {
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        if let searchText = searchController.searchBar.text {
            if searchText.count > 0 {
                listNewsPresenter?.searchNews(searchedText: searchText)
            }
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        listNewsPresenter?.getNews()
    }
}
