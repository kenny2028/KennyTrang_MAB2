//
//  SecondviewControllerViewController.swift
//  KTlab
//
//  Created by Kenny Trang on 1/17/22.
//

import UIKit

class SecondviewControllerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
 
    @IBOutlet weak var musicpicker: UIPickerView!
    
    @IBOutlet weak var musiclabel: UILabel!
    
    let genre = ["Country", "Pop", "Rock", "Classical", "Alternative", "Hiphop", "Jazz"]
    
    let decade = ["1950s","1960s","1970s","1980s","1990s","2000"]
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return genre.count
        } else {
            return decade.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return genre[row]
        } else {
            return decade[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let genrerow = pickerView.selectedRow(inComponent: 0)
        let decaderow =
        pickerView.selectedRow(inComponent: 1)
        musiclabel.text = "You like \(genre[genrerow]) from the \(decade[decaderow])"

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
