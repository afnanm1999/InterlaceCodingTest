//
//  MainViewModel.swift
//  InterlaceCodingTest
//
//  Created by Afnan Mirza on 8/2/19.
//  Copyright © 2019 Afnan Mirza. All rights reserved.
//

import UIKit

class MainViewModel {
    
    // MARK: - Variables
    var postData: [GiphyPost] = [GiphyPost]()
    let reusableCell = "cell"
    
    // MARK: - Functions
    func getItemNumber() -> Int {
        return postData.count
    }
    
    func cellForItemAt(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        let cell: postCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: self.reusableCell, for: indexPath) as! postCollectionViewCell
        cell.configureCell(data: self.postData[indexPath.row])
        return cell
    }
    
    func setupCollectionViewLayout() ->  UICollectionViewLayout {
        let screenWidth = UIScreen.main.bounds.width
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        layout.itemSize = CGSize(width: screenWidth/2, height: screenWidth/2)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        return layout
    }
    
    func fetchTrending(closure: @escaping () -> Void) {
        DispatchQueue.global(qos: .background).async {
            GiphyAPI.fetchTrendingGiphy() { [weak self] (post) in
                self?.postData.removeAll()
                self?.postData = post
                
                DispatchQueue.main.async {
                    closure()
                }
            }
        }
    }
    
    func fetchData(searchText: String, closure: @escaping () -> Void) {
        DispatchQueue.global(qos: .background).async {
            GiphyAPI.searchGiphyAPI(searchQuery: searchText) { [weak self] (post) in
                self?.postData.removeAll()
                self?.postData = post
                
                DispatchQueue.main.async {
                    closure()
                }
            }
        }
    }
    
}
