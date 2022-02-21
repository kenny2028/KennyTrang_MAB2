//
//  DetailController.swift
//  Lab4
//
//  Created by Kenny Trang on 2/20/22.
//

import UIKit

class DetailController: UIViewController {
    
    var importname : String?
    @IBOutlet weak var imageShow: UIImageView!
    
    override func viewWillAppear(_ animated: Bool) {
        imageShow.image = UIImage(named: importname!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func shareButton(_ sender: UIBarButtonItem) {
        var imageArray = [UIImage]()
        imageArray.append(imageShow.image!)
        let shareScreen = UIActivityViewController(activityItems: imageArray, applicationActivities: nil)
        shareScreen.modalPresentationStyle = .popover
        shareScreen.popoverPresentationController?.barButtonItem = sender
        
        present(shareScreen, animated: true, completion: nil)
        
        
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
