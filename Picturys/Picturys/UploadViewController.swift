//
//  UploadViewController.swift
//  Picturys
//
//  Created by Kenny Trang on 2/11/22.
//

import UIKit

class UploadViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate, UITextFieldDelegate {

    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var uploadIcon: UIImageView!
    
    @IBOutlet weak var tagsTextField: UITextField!
    
    
    @IBOutlet weak var uploadedImage: UIImageView!
    
    var imageAdd: UIImage?
    
    var sendingImage = pictureData()
    
    
    //MARK: ADD ENTRY
    
    
    
    //MARK: Segue Actions
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "UploadSegue" {
            if imageAdd != nil {
                return true
            } else {
                let alert = UIAlertController(title: "No Images Found", message: "Please add an image", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert, animated: true)
                
                return false
            }
            
        } else {
            return true
        }
    }
    
    @IBAction func unwindtoImg (_ segue:UIStoryboardSegue) {
        
        if segue.identifier == "popSegue" {
            if let source = segue.source as? CameraViewController {
                
                uploadedImage.image = UIImage(data:source.imagedata!)
                
            }
            
            
        }
        
    }
    
    
    
    @IBAction func addEntryPressed(_ sender: Any) {
        
    //Check for empty cases
        if imageAdd != nil {
            sendingImage.picturedata = imageAdd?.jpegData(compressionQuality: 0)!
            sendingImage.imagetags = tagsTextField.text!
            sendingImage.favorited = favoritePressed
            sendingImage.date = dateLabel.text!
            //sendingImage.month = dateLabel.text!
            sendingImage.datetag = Date()
            
            
            print(sendingImage)
                
            
        } else {
            let alert = UIAlertController(title: "No Images Found", message: "Please add an image", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                        self.present(alert, animated: true)
            
        }


    }
    
    // MARK: Favorite Functions
    var favoritePressed = false

  
    @IBOutlet weak var favoriteImage: UIImageView!
    @IBAction func favoriteButtonSelect(_ sender: Any) {
        
        let selected = UIImage(named: "starActive.svg")
        let deselected = UIImage(named: "starInActive.svg")
        
        if favoritePressed == false {
            favoriteImage.image = selected
            favoritePressed = true
        } else {
            favoriteImage.image = deselected
            favoritePressed = false
        }
    }
    
    
    
    
    // MARK: Image Functions
    

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
            imageAdd = selectedImage
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
//
        //Update Date Label
        let formatter = DateFormatter()
        let date = Date()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
//
        dateLabel.text = "\(formatter.string(from: date))"
        
        //uploadedImage.image = UIImage(named: "mtn.jpg")
        if (imageAdd != nil) {
            uploadedImage.image = imageAdd
        }
     
        print("tEsteer")
       
        
        //Reset Screen
        //ResetUI()
        
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        
        
        tagsTextField.delegate = self
        //        If USER CLICKS OFF SCREEN, REMOVE KEYBOARD
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
        
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

    
    func ResetUI() {
        tagsTextField.text = ""
        uploadedImage.image = nil
        
        
        //reset Favorite
        
        let deselected = UIImage(named: "starInActive.svg")
        favoritePressed = false
        favoriteImage.image = deselected

    }
    
    //MARK: KEYBOARD FUNCTION
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
}


