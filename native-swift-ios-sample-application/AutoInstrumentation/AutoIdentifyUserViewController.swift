//
//  AutoIdentifyUserViewController.swift
//  native-swift-ios-sample-application
//
//  Created by Sabry, Ahmad on 12.12.22.
//

import UIKit
import Dynatrace

class AutoIdentifyUserViewController: UIViewController {

    @IBOutlet weak var txtUserName: UITextField!
    
    @IBOutlet weak var txtInformation: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
//https://www.dynatrace.com/support/help/shortlink/ios-oneagent-sdk#tag-specific-users
    @IBAction func btnIdentifyUser_Touch(_ sender: Any) {
        if let userName = txtUserName.text  {
            Dynatrace.identifyUser(userName)
            txtInformation.text = "For more info visit https://www.dynatrace.com/support/help/shortlink/ios-oneagent-sdk#tag-specific-users"
        } 
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
