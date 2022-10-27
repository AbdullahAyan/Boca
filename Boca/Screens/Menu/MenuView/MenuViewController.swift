//
//  MenuViewController.swift
//  Boca
//
//  Created by Abdullah Ayan on 23.10.2022.
//

import UIKit
import Alamofire
import Kingfisher
class MenuViewController: UIViewController {
    
    var menuView: MenuView?
    
    var menuPresenter: ViewControllerToPresenterMenuProtocol?
    
    var menu = [Yemekler.Yemek]()
    var constantMenu = [Yemekler.Yemek]()
    
    override func viewDidLoad() {
        navigationController?.navigationItem.setHidesBackButton(true, animated: true)

        super.viewDidLoad()
        
        MenuRouter.createModule(ref: self)
        
        menuView?.menuCollection.delegate = self
        menuView?.menuCollection.dataSource = self
        menuView?.searchBar.delegate = self
        menuPresenter?.menuInteractor?.getAllFoods()

        
        view = menuView
        view.backgroundColor = .white
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .red
        appearance.titleTextAttributes = [.foregroundColor : UIColor.white, .font : UIFont(name: "Pacifico-Regular", size: 18)!]
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        

        
        title = "Menu"
        
    }
    
}

extension MenuViewController: ViewToViewControllerMenuProtocol,
                              UICollectionViewDelegate,
                              UICollectionViewDataSource,
                              UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menu.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuCollectionViewCell", for: indexPath) as! MenuCollectionViewCell
        
        cell.namelabel.text = menu[indexPath.item].yemek_adi
        cell.priceLabel.text = menu[indexPath.item].yemek_fiyat! + "₺"
        cell.button.tag = indexPath.item
        menuPresenter?.setImage(imageView: cell.imageView, foodName: menu[indexPath.item].yemek_resim_adi!)
        
        return cell
    }
    

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 120, height: 160)
    }
    
    
    @objc func foodSelected(sender: UIButton) {
        navigationController?.pushViewController(FoodViewController(food: menu[sender.tag]), animated: true)
    }
    
    
}

extension MenuViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        menuPresenter?.filterMenu(constantMenu: constantMenu, menu: menu, searchText: searchText)
        self.menuView?.menuCollection.reloadData()
    }
}


extension MenuViewController: PresenterToViewControllerMenuProtocol {
    func sendMenuToViewController(menu: [Yemekler.Yemek]) {
        self.menu = menu
        self.constantMenu = menu
        self.menuView?.menuCollection.reloadData()
    }
    


}
