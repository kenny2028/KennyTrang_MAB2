//
//  FourthViewController.swift
//  Lab2
//
//  Created by Kenny Trang on 2/1/22.
//

import UIKit

class FourthViewController: UIViewController {

    @IBAction func photobutton(_ sender: Any) {
        
        if (UIApplication.shared.canOpenURL(URL(string: "Reddit://")!)) {
            
            UIApplication.shared.open(URL(string: "Reddit://")!, options:[:], completionHandler: nil)
            
            
        } else {
            if (UIApplication.shared.canOpenURL(URL(string: "Reddit://")!)) {
                
                UIApplication.shared.open(URL(string: "Reddit://")!, options:[:], completionHandler: nil)
            } else {
                UIApplication.shared.open(URL(string: "http://www.reddit.com")!, options:[:], completionHandler: nil)            }
        
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
