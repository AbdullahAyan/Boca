//
//  ProfileViewController.swift
//  Boca
//
//  Created by Abdullah Ayan on 24.10.2022.
//

import UIKit

class ProfileViewController: UIViewController {

//    Delegate objects
    var profileView: ProfileView?
    var profilePresenter: ViewControllerToPresenterProfileProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.topItem?.backButtonTitle = ""
        navigationController?.navigationBar.tintColor = .white
        title = "Sepet"

        ProfileRouter.createModule(ref: self)
        
        profileView?.tableView.delegate = self
        profileView?.tableView.dataSource = self

        view = profileView
    }


}

extension ProfileViewController:UITableViewDelegate,UITableViewDataSource, ViewToViewControllerProfileProtocol {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }

    
    
}
