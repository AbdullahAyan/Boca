//
//  ProfileViewController.swift
//  Boca
//
//  Created by Abdullah Ayan on 24.10.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    var profileView: ProfileView?
    var profilePresenter: ViewControllerToPresenterProfileProtocol?
    var appDelegate: AppDelegate
    
    init(profileView: ProfileView? = nil, profilePresenter: ViewControllerToPresenterProfileProtocol? = nil, appDelegate: AppDelegate) {
        self.appDelegate = appDelegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.topItem?.backButtonTitle = ""
        navigationController?.navigationBar.tintColor = .white
        title = "Profile"

        ProfileRouter.createModule(ref: self)

        view = profileView
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .red
        appearance.titleTextAttributes = [.foregroundColor : UIColor.white, .font : UIFont(name: "Pacifico-Regular", size: 18)!]
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
    }
}

extension ProfileViewController: ViewToViewControllerProfileProtocol {
    @objc func logOut() {
        profilePresenter?.logOut()
    }
}

extension ProfileViewController: PresenterToViewControllerProfileProtocol {
    func sendResponseToViewController(response: AuthResponse) {
        switch response {
        case .Success:
            let ac = UIAlertController(title: "Çıkış yapıyorsun", message: "Emin misin?", preferredStyle: .alert)
            let exitAction = UIAlertAction(title: "Çık", style: .destructive) { [self] _ in
                appDelegate.setupWindow()
            }
            let continueAction = UIAlertAction(title: "Devam", style: .default)
            ac.addAction(continueAction)
            ac.addAction(exitAction)
            present(ac, animated: true)
        case .Failure:
            return
        }
    }
}


