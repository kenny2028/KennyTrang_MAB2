//
//  AddAnimalViewController.swift
//  lab3
//
//  Created by Kenny Trang on 2/8/22.
//

import UIKit

class AddAnimalViewController: UIViewController {

    @IBOutlet weak var animalTextField: UITextField!
    
    var addAnimal = String()
    
    let doneSegue = "doneSegue"
    let cancelSegue = "cancelSegue"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    // MARK: Segue Connection
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == doneSegue {
            if animalTextField.text?.isEmpty == false {
                addAnimal = animalTextField.text!
            }
        }
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
