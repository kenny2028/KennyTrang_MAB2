//
//  WebViewController.swift
//  recipes
//
//  Created by Kenny Trang on 3/8/22.
//

import UIKit

import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var webSpinner: UIActivityIndicatorView!
    
    
    @IBOutlet weak var webviewer: WKWebView!
    
    
    var webpage: String?
    
    
    func loadweb(_ urlString: String) {
        
        let url = URL(string: urlString) // Covert to URL OBJ
        let request = URLRequest(url: url!) // make URL Request
        webviewer.load(request) // Load URL Request
        
        
    }

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //declare delagate
        webviewer.navigationDelegate = self
        
        if webpage == "" {
            loadweb("https://www.myrecipes.com/")
        } else {
            loadweb(webpage!)
        }
        
    }
    
    //WKNavigationDelegate method that is called when a web page begins to load
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        webSpinner.startAnimating()
    }
    
    //WKNavigationDelegate method that is called when a web page loads successfully
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        webSpinner.stopAnimating()
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
