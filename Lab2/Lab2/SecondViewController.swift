//
//  SecondViewController.swift
//  Lab2
//
//  Created by Kenny Trang on 1/31/22.
//

import UIKit

class SecondViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    @IBOutlet weak var moviePicker: UIPickerView!
    
    @IBOutlet weak var movieLabel: UILabel!
    
    
    var movieData = DataLoader()
    
    var movieGenres = [String]()
    var movies = [String]()
    

    let moviefile = "artistalbums2"
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return movieGenres.count
        } else {
            return movies.count
        }
    }
    
//    Delagate methods for acutal usage
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return movieGenres[row]
        } else {
            return movies[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            movieGenres = movieData.getMovies(index: row)
            
            moviePicker.reloadComponent(1)
            
//            reset back to first row
            moviePicker.selectRow(0, inComponent: 1, animated: true)
                
        }
        
//        get selection rows
        
        let movieGenrePick = pickerView.selectedRow(inComponent: 0)
        let moviePick =
        pickerView.selectedRow(inComponent: 1)
        movieLabel.text = "You like \(movieGenres[movieGenrePick]) movies, specifically \(movies[moviePick])"
        
        
        
    }
    
    
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
//        Load plist data
        movieData.loadData(filename: moviefile)
        movieGenres = movieData.getMovieGenres()
        movies = movieData.getMovies(index: 0)

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
