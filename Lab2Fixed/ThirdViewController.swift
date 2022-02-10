//
//  ThirdViewController.swift
//  Lab2
//
//  Created by Kenny Trang on 1/31/22.
//

import UIKit

class ThirdViewController: UIViewController {
    @IBOutlet weak var bdaypicker: UIDatePicker!
    
    @IBAction func Birthday(_ sender: Any) {
        
// formatter
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        bdaylabel.text = "Birthday: \(formatter.string(from: bdaypicker.date))"
    }
    
    
    @IBOutlet weak var bdaylabel: UILabel!
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
