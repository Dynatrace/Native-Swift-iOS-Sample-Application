//
//  SeassionReplayFeaturesViewController.swift
//  native-swift-ios-sample-application
//
//  Created by Sabry, Ahmad on 12.01.23.
//

import UIKit
import Dynatrace
import DynatraceSessionReplay

class SeassionReplayFeaturesViewController: UIViewController {
    @IBOutlet weak var txtInformation: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnMasking_Touch(_ sender: Any) {
        /*
         Mask sensitive data
         https://www.dynatrace.com/support/help/shortlink/enable-session-replay-on-crashes#mask-sensitive-data
         Session Replay on crashes comes with three predefined masking levels:

         Safest—all the editable texts fields, images, labels, web views, and switches are masked.
         Safe—all the editable texts fields are masked.
         Custom—by default, masks the same elements as Safest, but you can decide exactly which app components or views should be masked.
         */
        
        let maskingConfiguration = MaskingConfiguration(maskingLevelType: .safe) // .safest or .custom
        try?  AgentManager.setMaskingConfiguration(maskingConfiguration)
    }
    
    @IBAction func btnChangeMaskingLevel_Touch(_ sender: Any) {
        /*
         https://www.dynatrace.com/support/help/shortlink/enable-session-replay-on-crashes#configure-custom-masking
         If you set the data masking level to Custom, you can use additional API methods to decide exactly which app components or views should be masked.

         Enable or disable masking rules
         You can enable or disable rules globally or for the selected components, such as texts fields, images, labels, web views, and switches.
         */
       
        let maskingConfiguration = MaskingConfiguration(maskingLevelType: .custom) // .safest or .custom
        try? AgentManager.setMaskingConfiguration(maskingConfiguration)
        try? maskingConfiguration.add(rule: .maskAllImages)         // Adds one rule
        try? maskingConfiguration.remove(rule: .maskAllSwitches)    // Removes one rule
        try? maskingConfiguration.addAllRules()                     // Adds all rules
        try? maskingConfiguration.removeAllRules()                  // Removes all rules
    }
    
    @IBAction func btnCustomizeMasking_Touch(_ sender: Any) {
        /*
         https://www.dynatrace.com/support/help/shortlink/enable-session-replay-on-crashes#configure-custom-masking
         If you set the data masking level to Custom, you can use additional API methods to decide exactly which app components or views should be masked.

         Enable or disable masking rules
         You can enable or disable rules globally or for the selected components, such as texts fields, images, labels, web views, and switches.
         */
       
        let maskingConfiguration = MaskingConfiguration(maskingLevelType: .custom) // .safest or .custom
        try? AgentManager.setMaskingConfiguration(maskingConfiguration)
        try? maskingConfiguration.removeAllRules()                  // Removes all rules
        // We are going to mask all
        try? maskingConfiguration.addMaskedView(viewIds: ["AutoIdentifyUser"])
        try? maskingConfiguration.addMaskedView(viewIds: ["ManualIdentifyUser"])
        try? maskingConfiguration.removeMaskedView(viewIds: ["ManualIdentifyUser"])
    }
    
    @IBAction func btnTransmissionMode_Touch(_ sender: Any) {
        /*
         https://www.dynatrace.com/support/help/shortlink/enable-session-replay-on-crashes#transmission-mode-wi-fi
         By default, all data—information on captured events and images—is sent over any connection. However, you can opt to transfer images only when the users are connected to Wi-Fi to save their mobile data.
         */
       
        AgentManager.setTransmissionMode(.wifi) // .data by default
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
