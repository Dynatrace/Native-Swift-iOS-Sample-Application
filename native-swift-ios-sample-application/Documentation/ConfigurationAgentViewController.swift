//
//  ConfigurationAgentViewController.swift
//  native-swift-ios-sample-application
//
//  Created by Sabry, Ahmad on 02.01.23.
//

import UIKit
import WebKit

class ConfigurationAgentViewController: UIViewController {
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let myURL = URL(string:"https://www.dynatrace.com/support/help/shortlink/ios-configuration-keys")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
        
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
