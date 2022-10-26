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
    var searchMenu = [Yemekler.Yemek]()
    
    override func viewDidLoad() {
        navigationController?.navigationItem.setHidesBackButton(true, animated: true)

        super.viewDidLoad()
        
        MenuRouter.createModule(ref: self)
        
        menuView?.menuCollection.delegate = self
        menuView?.menuCollection.dataSource = self
        menuView?.searchBar.delegate = self
        
        view = menuView
        view.backgroundColor = .white
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .red
        appearance.titleTextAttributes = [.foregroundColor : UIColor.white, .font : UIFont(name: "Pacifico-Regular", size: 18)!]
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        


        getAllFoods()
        
        title = "Menu"
        
    }
    
    func getAllFoods() {
        menu.removeAll()
        AF.request("http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php",method: .get).response { response in
            if let data = response.data {
                do {
                    let response = try JSONDecoder().decode(Yemekler.self, from: data)
                    if let menu = response.yemekler {
                        self.menu = menu
                        self.searchMenu = menu
                        DispatchQueue.main.async {
                            self.menuView?.menuCollection.reloadData()
                        }
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
            
        }
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
        cell.menuViewContoller = self
        cell.button.tag = indexPath.item
        
        let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/" + menu[indexPath.item].yemek_resim_adi!)
        cell.imageView.kf.setImage(with: url)
        
        return cell
    }
    

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 120, height: 160)
    }
    
    
    @objc func foodSelected(sender: UIButton) {
        print(menu[sender.tag].yemek_adi!)
        navigationController?.pushViewController(FoodViewController(), animated: true)
    }
    
    
}

extension MenuViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        menu.removeAll()
        if searchText == "" {
            menu = searchMenu
        }
        for food in searchMenu {
            if food.yemek_adi!.lowercased().contains(searchText.lowercased())  {
                menu.append(food)
            }
        }
        
        self.menuView?.menuCollection.reloadData()
    }
}
