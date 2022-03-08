//
//  AddRecipeViewController.swift
//  recipes
//
//  Created by Kenny Trang on 3/3/22.
//

import UIKit

class AddRecipeViewController: UIViewController {

    @IBOutlet weak var nameTextfield: UITextField!
    
    
    @IBOutlet weak var urlTextField: UITextField!
    
    
    var addedRecipe = String()
    var addedURL = String()
    
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "savesegue"{
                   if nameTextfield.text?.isEmpty == false {
                       addedRecipe = nameTextfield.text!
                       addedURL = urlTextField.text!
                   }
               }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
