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
        
        view.backgroundColor = .red
        navigationController?.navigationBar.backgroundColor = .red
        view = menuView

        
    }


}

extension MenuViewController: ViewToViewControllerMenuProtocol, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = UICollectionViewCell()
        return cell
    }
    

    
    
}
