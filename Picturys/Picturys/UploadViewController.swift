//
//  UploadViewController.swift
//  Picturys
//
//  Created by Kenny Trang on 2/11/22.
//

import UIKit

class UploadViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var uploadIcon: UIImageView!
    
    @IBOutlet weak var tagsTextField: UITextField!
    
    
    @IBOutlet weak var addEntryBox: UIButton!
    
    @IBOutlet weak var uploadedImage: UIImageView!
    
    @IBAction func addImage(_ sender: Any) {
        let currentVC = UIImagePickerController()
        currentVC.sourceType = .photoLibrary
        currentVC.delegate = self
        currentVC.allowsEditing = true
        present(currentVC, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
      
        if let selectedImage = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")]as? UIImage {
            uploadedImage.image = selectedImage
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
  
        
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


