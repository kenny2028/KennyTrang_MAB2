//
//  DetailViewController.swift
//  Picturys
//
//  Created by Kenny Trang on 2/15/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    var importingImage = pictureData()
    

    @IBOutlet weak var tagsLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var imageShow: UIImageView!
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        imageShow.image = UIImage(data: importingImage.picturedata!)
        tagsLabel.text = importingImage.imagetags
        dateLabel.text = importingImage.date
        
        //add to show favorite
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func shareButton(_ sender: UIBarButtonItem) {
        
        var imageArray = [UIImage]()
        imageArray.append(UIImage(data: importingImage.picturedata!)!)
        
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
