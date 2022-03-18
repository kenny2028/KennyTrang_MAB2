//
//  CameraViewController.swift
//  Picturys
//
//  Created by Kenny Trang on 3/14/22.
//

import UIKit
import AVFoundation


class CameraViewController: UIViewController, AVCapturePhotoCaptureDelegate {
    
    var cameraOn = false
    
    
    
    //Capture Session
    
    var currentsession: AVCaptureSession?
    
    
    
    //Photo Output
    
    var output = AVCapturePhotoOutput()
    
    
    //View Preview Layer (Source of Showing user Actual Image )
    
    let previewLayer = AVCaptureVideoPreviewLayer()
    
    
    //Image data set for passing
    
    var imagedata : Data?
    var imageSender : UIImage?
    
    
    // Shutton buttom
    
    @IBOutlet weak var shutterButton: UIButton!
    
    @IBAction func shutterButtonPressed(_ sender: Any) {
        
        //test
        print("Button Pressed")
        
        
    
        output.capturePhoto(with: AVCapturePhotoSettings(), delegate: self)
        
        
        
        
    }
    
    
    //segue action
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("called passing data")
        if segue.identifier == "popSegue" {
            let destinationVC = segue.destination as? UploadViewController
            output.capturePhoto(with: AVCapturePhotoSettings(), delegate: self)
            
            print("Should be second")
            //imageSender = UIImage(named:"mtn.jpg")
            
            destinationVC?.imageAdd = imageSender
            
            
        }
    }
    
    
    

    
    @IBAction func unwindtoCamera (_segue:UIStoryboardSegue) {
//
        print("unwinding")
        checkCameraPermissions()
 
        
        
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
        //view.bringSubviewToFront(shutterButton)
        
        //checkCameraPermissions()
        
        // Do any additional setup after loading the view.
    }
    

    override func viewWillAppear(_ animated: Bool) {
        
        print("Appearing")
        //TEstiing
//        let imageAdd = UIImage(named: "mtn.jpg")
//        imagedata = imageAdd?.jpegData(compressionQuality: 0)!
        
        
        view.layer.addSublayer(previewLayer)
        view.bringSubviewToFront(shutterButton)
        
        //view.addSubview(cameraButton)
        
        //previewLayer.backgroundColor = UIColor.systemRed.cgColor
        
         checkCameraPermissions()
        
        //cameraButton.addTarget(self, action: #selector(didTapTakePhoto), for: .touchUpInside)
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        previewLayer.frame = view.bounds
        
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
    
    
    func checkCameraPermissions() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
            
        case .notDetermined:
            //Request Permission
            AVCaptureDevice.requestAccess(for: .video) {
                granted in
                guard granted else {
                    return
                }
                DispatchQueue.main.async {
                    self.initCamera()
                }
            }
            
            
        case .restricted:
            break
        case .denied:
            break
        case .authorized:
            DispatchQueue.main.async {
                self.initCamera()
            }
        @unknown default:
            break
        }
        
    }
    
    
    
    func initCamera() {
        
        print("Initializing")
        let session = AVCaptureSession()
        print("check1")
        if let device = AVCaptureDevice.default(for: .video) {
            do {
                let input = try AVCaptureDeviceInput(device: device)
                if session.canAddInput(input) {
                    session.addInput(input)
                    print("check2")
                }
                
                //output should go into AVCaptureOutput
                output = AVCapturePhotoOutput()
                if session.canAddOutput(output) {
                    session.addOutput(output)
                    print("check3")
                }
                
                
                previewLayer.videoGravity = .resizeAspectFill
                previewLayer.session = session
                
                print("checkFinal")
//                if (!cameraOn) {
//                    print("CheckFinal2")
//                    session.startRunning()
//                    cameraOn.toggle()
//                }
                self.currentsession = session
                
                
                session.startRunning()
                
            
            
                
            }
            catch {
                print(error)
            }
        }
    }
    
    
    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        guard let data = photo.fileDataRepresentation() else {
            return
        }
        
    
        imageSender = UIImage(data: data)
        
        
//        let image = UIImage(data: data)
//
//        let imageView = UIImageView(image: image)
        
        //imagedata = data
        //prepare for sender
        print("image taken")
        print("Should be first")
        
        //currentsession?.removeOutput(output)
        currentsession?.stopRunning()
        //output = AVCapturePhotoOutput

        
        performSegue(withIdentifier: "popSegue", sender: nil)
    
//
//        imageView.contentMode = .scaleAspectFill
//        imageView.frame = view.bounds
//
//        view.addSubview(imageView)
    }

    

}
