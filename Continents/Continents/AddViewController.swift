//
//  AddViewController.swift
//  Continents
//
//  Created by Kenny Trang on 2/3/22.
//

import UIKit

class AddViewController: UIViewController {
    
    var addedCountry = String()
    
    @IBOutlet weak var countryTextField: UITextField!
    
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if countryTextField.text?.isEmpty == false{
            addedCountry=countryTextField.text!
        }
    }

}
