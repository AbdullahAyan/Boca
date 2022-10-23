//
//  MenuView.swift
//  Boca
//
//  Created by Abdullah Ayan on 23.10.2022.
//

import UIKit

class MenuView: UIView {

    var menuViewController: MenuViewController?
    
    private(set) lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        
        searchBar.placeholder = "Ne yemek istersiniz ?"
        searchBar.autocorrectionType = .no
        searchBar.autocapitalizationType = .none

        return searchBar
    }()
    
    private(set) lazy var menuCollection: UICollectionView = {
        let flow = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flow)
        collectionView.backgroundColor = .white
        
        let nibCell = UINib(nibName: "MenuCollectionViewCell", bundle: nil)
        collectionView.register(nibCell, forCellWithReuseIdentifier: "MenuCollectionViewCell")
                
        return collectionView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        addSubview(searchBar)
        searchBar.snp.makeConstraints { make in
            make.top.trailing.leading.equalTo(safeAreaLayoutGuide)
            
        }
        
        addSubview(menuCollection)
        menuCollection.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom)
            make.leading.trailing.equalTo(safeAreaLayoutGuide)
            make.bottom.equalToSuperview()
            }

        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

