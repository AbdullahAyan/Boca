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
    var baskets = [Basket]()
    
    
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
        
        profilePresenter?.setUserInfo()
        getOrders()
        
        profileView?.ordersTableView.dataSource = self
        profileView?.ordersTableView.delegate = self
        
        
        profileView?.profileImageView.isUserInteractionEnabled = true
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(updateProfileImage))
        profileView?.profileImageView.addGestureRecognizer(tapGestureRecognizer)
        
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
    
    @objc func saveChanges() {
        profilePresenter?.saveChanges(email: profileView?.emailTextField.text, name: profileView?.nameTextField.text, image: profileView?.profileImageView.image)
    }
}

extension ProfileViewController: PresenterToViewControllerProfileProtocol {
    
    func sendOrdersToViewController(baskets: [Basket]) {
        self.baskets = baskets
        profileView?.ordersTableView.reloadData()
        print(baskets)
    }
    
    
    func sendUserInfoToViewController(email: String, name: String?) {
        profileView?.nameTextField.text = name
        profileView?.emailTextField.text = email
    }
    
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
    
    func getOrders() {
        profilePresenter?.getOrders()
    }
}

extension ProfileViewController: UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    @objc func updateProfileImage(){
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        dismiss(animated: true)
        profileView?.profileImageView.image = image
    }
    
}

extension ProfileViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        baskets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ProfileOrdersTableViewCell
        
        var totalPrice = 0.0
        
        if let yemekler = baskets[indexPath.row].sepet_yemekler {
            for food in yemekler {
                totalPrice += Double(food.yemek_fiyat!)! * Double(food.yemek_siparis_adet!)!
            }
        }
        
        
        
        cell.orderNumber.text = "\(indexPath.row + 1)"
        cell.orderTotalPrice.text = String(totalPrice) + "₺"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(DetailTableViewController(basket: baskets[indexPath.row]), animated: true)
    }
    
}


