//
//  ManualReportValuesViewController.swift
//  native-swift-ios-sample-application
//
//  Created by Sabry, Ahmad on 02.01.23.
//

import UIKit
import Dynatrace
class ManualReportValuesViewController: UIViewController {
    @IBOutlet weak var txtInformation: UITextView!
    @IBOutlet weak var txtIntValue: UITextField!
    @IBOutlet weak var txtDoubleValue: UITextField!
    @IBOutlet weak var txtStringValue: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        let action = DTXAction.enter(withName: "Manual ReportValues ViewController Loaded")
        // Do any additional setup after loading the view.
        action?.leave()
    }
    
    
    @IBAction func btnReportInt_Touch(_ sender: Any) {
        let action = DTXAction.enter(withName: "Tap Report Int Value")
        if let intValue = txtIntValue.text {
            
            action?.reportValue(withName: "My int value", intValue: Int64.init(intValue)!)
            
        }
        action?.leave()
    }
    
    @IBAction func btnReportString_Touch(_ sender: Any) {
        let action = DTXAction.enter(withName: "Tap Report String Value")
        if let stringValue = txtStringValue.text {
            
            action?.reportValue(withName: "My string value", stringValue: stringValue)
            
        }
        action?.leave()
    }
    
    @IBAction func btnReportDouble_Touch(_ sender: Any) {
        let action = DTXAction.enter(withName: "Tap Report Double Value")
        if let doubleValue = txtDoubleValue.text {
            action?.reportValue(withName: "My double value", doubleValue: Double.init(doubleValue)!)
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
