//
//  FoodViewController.swift
//  Boca
//
//  Created by Abdullah Ayan on 24.10.2022.
//

import UIKit

class FoodViewController: UIViewController {

//    Delegate objects
    var foodView: FoodView?
    var foodPresenter: ViewControllerToPresenterFoodProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        FoodRouter.createModule(ref: self)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension FoodViewController: ViewToViewControllerFoodProtocol {

    
    
}
