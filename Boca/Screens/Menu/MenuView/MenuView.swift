//
//  MenuView.swift
//  Boca
//
//  Created by Abdullah Ayan on 23.10.2022.
//

import UIKit

class MenuView: UIView {

    var menuViewController: MenuViewController?
    
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
        
        self.backgroundColor = .red
        addSubview(menuCollection)
        menuCollection.snp.makeConstraints { make in
            make.leading.trailing.top.equalTo(safeAreaLayoutGuide)
            make.bottom.equalToSuperview()
            }

        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

