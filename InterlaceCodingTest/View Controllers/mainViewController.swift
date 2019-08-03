//
//  mainViewController.swift
//  InterlaceCodingTest
//
//  Created by Afnan Mirza on 8/2/19.
//  Copyright © 2019 Afnan Mirza. All rights reserved.
//

import UIKit
import FLAnimatedImage

class mainViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet var searchBarView: UIView!
    @IBOutlet var collectionView: UICollectionView!
    
    // MARK: - Variables & Constants
    let searchController = UISearchController(searchResultsController: nil)
    var viewModel: MainViewModel = MainViewModel()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.collectionViewLayout = self.viewModel.setupCollectionViewLayout()
        self.setupSearchController()
        
        self.viewModel.fetchTrending {
            self.collectionView?.reloadData()
        }
    }
    
    // MARK: - Functions
    func setupSearchController() {
        self.searchController.searchResultsUpdater = self
        self.searchController.searchBar.delegate = self
        self.searchController.obscuresBackgroundDuringPresentation = false
        self.searchBarView.addSubview(self.searchController.searchBar)
    }
    
    func searchBarIsEmpty() -> Bool {
        return self.searchController.searchBar.text?.isEmpty ?? true
    }
}

// MARK: - UICollectionViewDataSource & UICollectionViewDelegate
extension mainViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.getItemNumber()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //        return self.viewModel.cellForItemAt(collectionView: collectionView, indexPath: indexPath)
        let cell: postCollectionViewCell = self.collectionView.dequeueReusableCell(withReuseIdentifier: viewModel.reusableCell, for: indexPath) as! postCollectionViewCell
        
        guard viewModel.postData.indices.contains(indexPath.item) else { return cell }
        
        cell.configureCell(data: viewModel.postData[indexPath.item])
        return cell
    }
}

// MARK: - UISearcController & UISearchResultsUpdating Delegate
extension mainViewController: UISearchResultsUpdating, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        self.viewModel.fetchData(searchText: searchController.searchBar.text!) {
            self.collectionView.reloadData()
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        viewModel.postData.removeAll()
        
        self.viewModel.fetchTrending() {
            self.collectionView.reloadData()
        }
    }
}
