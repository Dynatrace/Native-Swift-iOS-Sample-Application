//
//  AutoButtonActionViewController.swift
//  native-swift-ios-sample-application
//
//  Created by Sabry, Ahmad on 12.12.22.
//

import UIKit
import Dynatrace

class AutoButtonActionViewController: UIViewController {

    @IBOutlet weak var txtInformation: UITextView!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
   //https://www.dynatrace.com/support/help/shortlink/ios-oneagent-sdk#user-action-naming
    //https://www.dynatrace.com/support/help/shortlink/ios-oneagent-sdk#mask-user-actions
    

    @IBAction func btnTitle_Touch(_ sender: Any) {
        txtInformation.text = "Action name picked from button Title\nhttps://www.dynatrace.com/support/help/shortlink/ios-oneagent-sdk#user-action-naming"
    }
    
    @IBAction func btnAccessibilityLabel_Touch(_ sender: Any) {
        txtInformation.text = "Action name picked from Accessibility\nhttps://www.dynatrace.com/support/help/shortlink/ios-oneagent-sdk#user-action-naming"
    }
    
    
    
    @IBAction func btnNothing_Touch(_ sender: Any) {
        txtInformation.text = "Default button name will be picked\nhttps://www.dynatrace.com/support/help/shortlink/ios-oneagent-sdk#user-action-naming"
    }
     
    @IBAction func btnModifyAction_Touch(_ sender: Any) {
        Dynatrace.modifyUserAction( { (action) -> () in
                let oldName = action?.getName()
            action?.setName("This is a renamed auto user action (was '\(String(describing: oldName))')")
            self.txtInformation.text = "This is a renamed auto user action (was '\(String(describing: oldName))')\nhttps://www.dynatrace.com/support/help/shortlink/ios-oneagent-sdk#modify-auto-actions"
            })
    }
    
    @IBAction func btnMaskAction_Touch(_ sender: Any) {
        txtInformation.text = "To enable user action masking, set the DTXUIActionNamePrivacy configuration key to true in your app's Info.plist file check\n\nhttps://www.dynatrace.com/support/help/shortlink/ios-oneagent-sdk#mask-user-actions\n\nhttps://www.dynatrace.com/support/help/shortlink/configure-rum-privacy-mobile#user-action-masking\n<key>DTXUIActionNamePrivacy</key>\n<true/>"
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
