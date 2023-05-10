//
//  ManualReportErrorsViewController.swift
//  native-swift-ios-sample-application
//
//  Created by Sabry, Ahmad on 02.01.23.
//

import UIKit
import Dynatrace
class ManualReportErrorsViewController: UIViewController {
    @IBOutlet weak var txtInformation: UITextView!
    @IBOutlet weak var txtError: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func btnGlobalError_Touch(_ sender: Any) {
        let action = DTXAction.enter(withName: "Tap Report error")
        if let customError = txtError.text {
           
                   action?.reportError(withName: customError, errorValue: -1)
                // Another way of reporting error
                action?.reportError(withName: customError, error: NSError(domain: "Action issue", code: 007, userInfo: nil))
          
        }
        action?.leave()
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
