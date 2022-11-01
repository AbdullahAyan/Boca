//
//  ProfileInteractor.swift
//  Boca
//
//  Created by Abdullah Ayan on 24.10.2022.
//

import Foundation
import FirebaseAuth
import FirebaseCore
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

class ProfileInteractor {
    var profilePresenter: InteractorToPresenterProfileProtocol?
    
    let db = Firestore.firestore()
}

extension ProfileInteractor: PresenterToInteractorProfileProtocol {
    
    func setUserInfo() {
        let user = Auth.auth().currentUser
        profilePresenter?.sendUserInfoToViewController(email: (user?.email)!, name: user?.displayName)
    }
    
    func logOut() {
        let user = Auth.auth()
        
        do {
            try user.signOut()
            if Auth.auth().currentUser?.email == nil {
                profilePresenter?.sendResponseToViewController(response: .Success)
            }
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
        
        
    }
    
    
    func saveChanges(email: String? = nil, name: String? = nil,image: UIImage? = nil) {
        reauthenticate(email: email, name: name, image: image)
    }
    
    private func reauthenticate(email: String? = nil, name: String? = nil,image: UIImage? = nil) {
        
        let ac = UIAlertController(title: "Kimlik Doğrulama", message: "Değişiklikleri kaydetmek için lütfen email ve şifrenizi giriniz.", preferredStyle: .alert)
        ac.addTextField()
        ac.addTextField()
        
        
        let emailTextField = ac.textFields![0]
        let passwordTextField = ac.textFields![1]
        
        emailTextField.placeholder = "email"

        
        passwordTextField.placeholder = "şifre"


        passwordTextField.isSecureTextEntry = true
        
        let tamamAction = UIAlertAction(title: "Tamam", style: .default) {_ in
            let user = Auth.auth().currentUser
            var credential: AuthCredential
            credential = EmailAuthProvider.credential(withEmail: emailTextField.text!, password: passwordTextField.text!)
            
            user?.reauthenticate(with: credential) { [self] arg, error in
                if let error = error {
                    errorAlert(title: "Error", message: error.localizedDescription)
                } else {
                    
                    if let name {
                        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                        changeRequest?.displayName = name
                        changeRequest?.commitChanges { error in
                            if let error {
                                self.errorAlert(title: "Error", message: error.localizedDescription)
                            }
                        }
                    }
                    
                    if let email {
                        Auth.auth().currentUser?.updateEmail(to: email) { error in
                            if let error {
                                self.errorAlert(title: "Error", message: error.localizedDescription)
                            }
                        }
                    }
                }
            }
        }
        
        let vazgeçAction = UIAlertAction(title: "Vazgeç", style: .cancel)
        
        ac.addAction(tamamAction)
        ac.addAction(vazgeçAction)
        
        (profilePresenter?.profileViewController as! UIViewController).present(ac, animated: true)
    }
    
    func errorAlert(title: String, message: String) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Tamam", style: .default))
        (profilePresenter?.profileViewController as! UIViewController).present(ac, animated: true)
    }
    
    func getOrders() {
        var baskets = [Basket]()
        db.collection("\(User.email)").getDocuments() { [self] (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    let docRef = db.collection("\(User.email)").document(document.documentID)
                    
                    docRef.getDocument(as: Basket.self) { [self] result in

                        switch result {
                        case .success(let basket):
                            baskets.append(basket)
                            profilePresenter?.sendOrdersToViewController(baskets: baskets)
                        case .failure(let error):
                            print("Error decoding city: \(error)")
                        }
                    }
                }
            }
        }
    }
}
