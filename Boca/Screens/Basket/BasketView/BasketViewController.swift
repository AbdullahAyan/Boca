//
//  BasketViewController.swift
//  Boca
//
//  Created by Abdullah Ayan on 24.10.2022.
//

import UIKit

class BasketViewController: UIViewController {

    var basketView: BasketView?
    var basketPresenter: ViewControllerToPresenterBasketProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.topItem?.backButtonTitle = ""
        navigationController?.navigationBar.tintColor = .white
        title = "Sepet"

        BasketRouter.createModule(ref: self)
        
        basketView?.tableView.delegate = self
        basketView?.tableView.dataSource = self

        view = basketView
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .red
        appearance.titleTextAttributes = [.foregroundColor : UIColor.white, .font : UIFont(name: "Pacifico-Regular", size: 18)!]
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
    }
}

extension BasketViewController:UITableViewDelegate,UITableViewDataSource, ViewToViewControllerBasketProtocol {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BasketTableViewCell
        cell.buttonTapped = {
            tableView.reloadData()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
}
