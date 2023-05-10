//
//  ManualButtonActionViewController.swift
//  native-swift-ios-sample-application
//
//  Created by Sabry, Ahmad on 02.01.23.
//

import UIKit
import Dynatrace

class ManualButtonActionViewController: UIViewController {
    @IBOutlet weak var txtInformation: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnSimple_Touch(_ sender: Any) {
        let action = DTXAction.enter(withName: "Tap on Simple Action")
        
        
        
        txtInformation.text = "https://www.dynatrace.com/support/help/shortlink/ios-oneagent-sdk#start-and-close-custom-action"
        action?.leave()
    }
    
    @IBAction func btnCancel_Touch(_ sender: Any) {
        let action = DTXAction.enter(withName: "Tap on Cancel Action")
        txtInformation.text = "https://www.dynatrace.com/support/help/shortlink/ios-oneagent-sdk#cancel-action"
        if Int.random(in: 0...10) !=  1
        {
            action?.cancel()
        }
        else
        {
            action?.leave()
        }
        
        
    }
    @IBAction func btnParantChild_Touch(_ sender: Any) {
        // start a parent custom action
        let searchAction = DTXAction.enter(withName: "Tap Parant-Child Aciton")
        
        // ...do some work here...
        
        // start a child action
        let parseAction = DTXAction.enter(withName: "Tap on Confirm", parentAction: searchAction)
        
        // ...do some work here...
        txtInformation.text = "https://www.dynatrace.com/support/help/shortlink/ios-oneagent-sdk#create-child-action"
        // close a child action
        parseAction?.leave()
        
        // ...do some work here...
        
        // close a parent custom action
        searchAction?.leave()
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
