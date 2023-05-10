//
//  ManualWebRequestsViewController.swift
//  native-swift-ios-sample-application
//
//  Created by Sabry, Ahmad on 02.01.23.
//

import UIKit
import Dynatrace

class ManualWebRequestsViewController: UIViewController {
   
    let apiCalls =  WebRequests()
    
    @IBOutlet weak var txtUrlRequest: UITextField!
    @IBOutlet weak var txtInformation: UITextView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        let action = DTXAction.enter(withName: "Manual WebRequests ViewController loaded")
    
        action?.leave()
      
    }
    
    @IBAction func btnAutoInstrumentWebRequest_Touch(_ sender: Any) {
        let action = DTXAction.enter(withName: "Tap Auto Instrument WebRequest")
        if dtConfigKeys.IsInstrumentWebRequestTiming
        {
            if let url = txtUrlRequest.text{
                
                self.apiCalls.getRequest_Auto(url: url)
            }
            
            
        }
        else {
            self.showAlert(title: "Cannot do Auto web instrumentation", messgae: "DTXInstrumentWebViewTiming is set \(dtConfigKeys.IsInstrumentWebRequestTiming)")
            
        }
        txtInformation.text = "OneAgent automatically instruments and tags your web requests. To track web requests, OneAgent adds the x-dynatrace HTTP header with a unique value to the web request. This is required to correlate the server-side monitoring data to the corresponding mobile web request.\nhttps://www.dynatrace.com/support/help/shortlink/ios-oneagent-sdk#measure-web-requests"
        action?.leave()
    }
    
    @IBAction func btnManualInstrumentWebRequest_Touch(_ sender: Any) {
        let action = DTXAction.enter(withName: "Tap Manual Instrument WebRequest")
        if !dtConfigKeys.IsInstrumentWebRequestTiming
        {
            if let url = txtUrlRequest.text{
              
                 self.apiCalls.getRequest_Manual(url:  url, parentAction: action)
            }
      
        }
        else {
            self.showAlert(title: "Cannot do Auto web instrumentation", messgae: "DTXInstrumentWebViewTiming is set \(dtConfigKeys.IsInstrumentWebRequestTiming)")
           
        }
            txtInformation.text = "When to use ->\nWhen the automatic instrumentation of web requests is disabled\nWhen the requests of a third-party framework aren't instrumented\nWhen you need to report non-HTTP(S) requests\n\nTo disable the automatic web request instrumentation, set the DTXInstrumentWebRequestTiming configuration key to false.\nhttps://www.dynatrace.com/support/help/shortlink/ios-oneagent-sdk#measure-web-requests"
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
