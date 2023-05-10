//
//  AutoReportErrorsViewController.swift
//  native-swift-ios-sample-application
//
//  Created by Sabry, Ahmad on 12.12.22.
//

import UIKit
import Dynatrace

class AutoReportErrorsViewController: UIViewController {
    @IBOutlet weak var txtInformation: UITextView!
    @IBOutlet weak var txtError: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func btnGlobalError_Touch(_ sender: Any) {
        if let customError = txtError.text {
            Dynatrace.modifyUserAction( { (action) -> () in 
                   action?.reportError(withName: customError, errorValue: -1)
                // Another way of reporting error
                action?.reportError(withName: customError, error: NSError(domain: "Action issue", code: 007, userInfo: nil))
               }) 
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
