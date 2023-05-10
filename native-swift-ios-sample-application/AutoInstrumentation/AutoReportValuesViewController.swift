//
//  AutoReportValuesViewController.swift
//  native-swift-ios-sample-application
//
//  Created by Sabry, Ahmad on 12.12.22.
//

import UIKit
import Dynatrace

class AutoReportValuesViewController: UIViewController {
    
    //https://www.dynatrace.com/support/help/shortlink/ios-oneagent-sdk#report-value
    
    //https://www.dynatrace.com/support/help/shortlink/define-mobile-action-and-session-properties
    
    @IBOutlet weak var txtInformation: UITextView!
    @IBOutlet weak var txtIntValue: UITextField!
    @IBOutlet weak var txtDoubleValue: UITextField!
    @IBOutlet weak var txtStringValue: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func btnReportInt_Touch(_ sender: Any) {
        if let intValue = txtIntValue.text {
            Dynatrace.modifyUserAction( { (action) -> () in
                action?.reportValue(withName: "My int value", intValue: Int64.init(intValue)!)
               })
        }
    }
    
    @IBAction func btnReportString_Touch(_ sender: Any) {
        if let stringValue = txtStringValue.text {
            Dynatrace.modifyUserAction( { (action) -> () in
                action?.reportValue(withName: "My string value", stringValue: stringValue)
               })
        }
    }
    
    @IBAction func btnReportDouble_Touch(_ sender: Any) {
        if let doubleValue = txtDoubleValue.text {
            Dynatrace.modifyUserAction( { (action) -> () in
                action?.reportValue(withName: "My double value", doubleValue: Double.init(doubleValue)!)
               })
        }    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
