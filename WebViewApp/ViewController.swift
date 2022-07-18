//
//  ViewController.swift
//  WebViewApp
//
//  Created by Mehmet Kerim ÖZEK on 16.07.2022.
//

import UIKit
import WebKit

class ViewController: UIViewController, UITextFieldDelegate, WKNavigationDelegate {
    @IBOutlet weak var btnBack: UIBarButtonItem!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var btnGo: UIBarButtonItem!
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnBack.isEnabled = false
        btnGo.isEnabled = false
        
        textField.delegate = self
        webView.navigationDelegate = self
    
        }
    override func viewDidAppear(_ animated: Bool) {
        
        let urlString = "https://kerramihamidou.xyz"
        
        let url = URL(string: urlString)
        
        let request = URLRequest(url: url!)
        
        webView.load(request)
        
        textField.text = urlString
        
    }
    
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        btnBack.isEnabled = webView.canGoBack
        btnGo.isEnabled = webView.canGoForward
        
    }
        
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
       
        let urlString = textField.text!
        
        let url = URL(string: urlString)
        
        let google = URL(string: "https://www.google.com")
        
        let request = URLRequest(url: url ?? google!)
            
            textField.resignFirstResponder()
            
            webView.load(request)
    
        return true
    }

    @IBAction func btnBack(_ sender: Any) {
        
        if webView.canGoBack{
            webView.goBack()
            textField.text = webView.url?.absoluteString
        }
        
    }
    
    @IBAction func btnGo(_ sender: Any) {
        if webView.canGoForward {
            webView.goForward()
            textField.text = webView.url?.absoluteString
        }
        
    }
    
}

