//
//  MenuViewController.swift
//  Boca
//
//  Created by Abdullah Ayan on 23.10.2022.
//

import UIKit

class MenuViewController: UIViewController {
    
    var menuView: MenuView?
    
    var menuPresenter: ViewControllerToPresenterMenuProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MenuRouter.createModule(ref: self)
        
        menuView?.menuCollection.delegate = self
        menuView?.menuCollection.dataSource = self
        
        view = menuView
        view.backgroundColor = .white
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .red
        appearance.titleTextAttributes = [.foregroundColor : UIColor.white, .font : UIFont(name: "Pacifico-Regular", size: 24)!]
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance


        
        title = "Boca"
        
    }
    
    
}

extension MenuViewController: ViewToViewControllerMenuProtocol,
                              UICollectionViewDelegate,
                              UICollectionViewDataSource,
                              UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //        let cell = MenuCollectionViewCell()
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuCollectionViewCell", for: indexPath) as! MenuCollectionViewCell
        return cell
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 110, height: 160)
    }

//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 3.0
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout
//        collectionViewLayout: UICollectionViewLayout,
//                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 4.0
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    
}
