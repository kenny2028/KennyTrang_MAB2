//
//  CameraViewController.swift
//  Picturys
//
//  Created by Kenny Trang on 3/14/22.
//

import UIKit
import AVFoundation


class MainCameraViewController: UIViewController, AVCapturePhotoCaptureDelegate {
    
    //Camera Functions
    var session = AVCaptureSession()
    
    var alert = false
    
    
    //Image data set for passing
    var imageOutput = AVCapturePhotoOutput()
    var imagedata : Data?
    var imageSender : UIImage?
    
    var isTaken = false
    
    // Shutton buttom
    
    @IBOutlet weak var shutterButton: UIButton!
    
    
    func CheckCameraPerms() {
        
        //check for camera perms
        
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            Camerasetup()
            return
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { (status) in
                if status {
                    self.Camerasetup()
                }
            }
        case .denied:
            self.alert.toggle()
            return
            
        default:
            return
        }
        
        
        
    }
    
    func Camerasetup() {
        
        do {
            self.session.beginConfiguration()
            
            let device = AVCaptureDevice.default(.builtInDualCamera,for: .video, position: .back)
            let input = try AVCaptureDeviceInput(device: device!)
            
            if self.session.canAddInput(input) {
                self.session.addInput(input)
            }
            
            if self.session.canAddOutput(self.imageOutput) {
                self.session.addOutput(self.imageOutput)
            }
            
            //
            
            
            
            
        } catch {
            print(error.localizedDescription)
        }
        
        
        
    }
    
    
    
    @IBAction func shutterButtonPressed(_ sender: Any) {
        
        //test
        print("Button Pressed")
        if isTaken {
            performSegue(withIdentifier: "popSegue", sender: nil)
        }
        
        
    }
    
    
    //segue action
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("called passing data")
        if segue.identifier == "popSegue" {
            let destinationVC = segue.destination as? UploadViewController
            //output.capturePhoto(with: AVCapturePhotoSettings(), delegate: self)
            
            print("Should be second")
            //imageSender = UIImage(named:"mtn.jpg")
            
            destinationVC?.imageAdd = imageSender
            
            
        }
    }
    
    
    

    
    @IBAction func unwindtoCamera (_segue:UIStoryboardSegue) {
//
        print("unwinding")
//        view.layer.addSublayer(previewLayer)
//        view.bringSubviewToFront(shutterButton)
//        checkCameraPermissions()
        
        
    }
    
    
    
    
    
    
    
//    private let cameraButton: UIButton = {
//        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 70, height: 70))
//        button.layer.cornerRadius = 30
//        button.layer.borderWidth = 5
//        button.layer.borderColor = UIColor.white.cgColor
//        return button
//
//    }()
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //view.layer.addSublayer(previewLayer)
        view.bringSubviewToFront(shutterButton)
        
        //checkCameraPermissions()
        
        // Do any additional setup after loading the view.
    }
    

    override func viewWillAppear(_ animated: Bool) {
        
        print("Appearing")
        //TEstiing
//        let imageAdd = UIImage(named: "mtn.jpg")
//        imagedata = imageAdd?.jpegData(compressionQuality: 0)!
        
        
        //view.layer.addSublayer(previewLayer)
        //view.bringSubviewToFront(shutterButton)
        
        //view.addSubview(cameraButton)
        
        //previewLayer.backgroundColor = UIColor.systemRed.cgColor
        
        
        //cameraButton.addTarget(self, action: #selector(didTapTakePhoto), for: .touchUpInside)
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        //previewLayer.frame = view.bounds
        
        //cameraButton.center = CGPoint(x:view.frame.size.width/2,y: view.frame.size.height - 70)
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

