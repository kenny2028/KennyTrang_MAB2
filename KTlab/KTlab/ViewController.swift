//
//  ViewController.swift
//  KTlab
//
//  Created by Kenny Trang on 1/17/22.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate,UIPickerViewDataSource {

    let genre = ["Country", "Pop", "Rock", "Classical", "Alternative", "Hiphop", "Jazz"]
        
    @IBOutlet weak var musicpicker: UIPickerView!
    
    @IBOutlet weak var musiclabel: UILabel!
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genre.count
    }
    
    
    
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genre[row]
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        musiclabel.text = "you like \(genre[row])"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

