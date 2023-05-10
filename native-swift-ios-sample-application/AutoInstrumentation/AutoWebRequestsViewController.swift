//
//  AutoWebRequestsViewController.swift
//  native-swift-ios-sample-application
//
//  Created by Sabry, Ahmad on 12.12.22.
//

import UIKit
import Dynatrace

class AutoWebRequestsViewController: UIViewController {
    
    let apiCalls =  WebRequests()
    
    @IBOutlet weak var txtUrlRequest: UITextField!
    @IBOutlet weak var txtInformation: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnAutoInstrumentWebRequest_Touch(_ sender: Any) {
        
        txtInformation.text = "OneAgent automatically instruments and tags your web requests. To track web requests, OneAgent adds the x-dynatrace HTTP header with a unique value to the web request. This is required to correlate the server-side monitoring data to the corresponding mobile web request.\n\nhttps://www.dynatrace.com/support/help/shortlink/ios-oneagent-sdk#measure-web-requests"
        
        if dtConfigKeys.IsInstrumentWebRequestTiming
        {
            if let url = txtUrlRequest.text{
                self.apiCalls.getRequest_Auto(url: url)
            }
        }
        else {
            self.showAlert(title: "Cannot do Auto web instrumentation", messgae: "DTXInstrumentWebViewTiming is set \(dtConfigKeys.IsInstrumentWebRequestTiming)", alertCompletionHandler: { _ in
                
                self.txtInformation.text = "OneAgent automatically instruments and tags your web requests. To track web requests, OneAgent adds the x-dynatrace HTTP header with a unique value to the web request. This is required to correlate the server-side monitoring data to the corresponding mobile web request.\n\nhttps://www.dynatrace.com/support/help/shortlink/ios-oneagent-sdk#measure-web-requests"
            })
            
        }
        
    }
    
    @IBAction func btnAutoInstrumentStandAloneWebRequest_Touch(_ sender: Any) {
        
        txtInformation.text = "This webrequest will be delayed,\nReview https://www.dynatrace.com/support/help/shortlink/ios-configuration-keys\nDTXAutoActionTimeoutMilliseconds\n\nSets the value for how long a particular automatic user action is active. The purpose is to detect all web requests that occur when an automatic user action is active. If the automatic user action has completed web requests, OneAgent leaves the action at the end of this time.\nPossible values: from 100ms (= 0.1 seconds) to 5000ms (= 5 seconds)"
        
        if dtConfigKeys.IsInstrumentWebRequestTiming
        {
            if let url = txtUrlRequest.text{
                
                DispatchQueue.main.asyncAfter(deadline: .now()+5, execute: {
                    self.apiCalls.getRequest_Auto(url: url)
                })
                
            }
        }
        else {
            self.showAlert(title: "Cannot do Auto web instrumentation", messgae: "DTXInstrumentWebViewTiming is set \(dtConfigKeys.IsInstrumentWebRequestTiming)", alertCompletionHandler: { _ in
                
                self.txtInformation.text = "This webrequest will be delayed,\nReview https://www.dynatrace.com/support/help/shortlink/ios-configuration-keys\nDTXAutoActionTimeoutMilliseconds\n\nSets the value for how long a particular automatic user action is active. The purpose is to detect all web requests that occur when an automatic user action is active. If the automatic user action has completed web requests, OneAgent leaves the action at the end of this time.\nPossible values: from 100ms (= 0.1 seconds) to 5000ms (= 5 seconds)"
            })
            
        }
        
    }
    
    @IBAction func btnManualInstrumentWebRequest_Touch(_ sender: Any) {
        txtInformation.text = "When to use ->\nWhen the automatic instrumentation of web requests is disabled\nWhen the requests of a third-party framework aren't instrumented\nWhen you need to report non-HTTP(S) requests\n\nTo disable the automatic web request instrumentation, set the DTXInstrumentWebRequestTiming configuration key to false.\n\nhttps://www.dynatrace.com/support/help/shortlink/ios-oneagent-sdk#measure-web-requests"
        
        if !dtConfigKeys.IsInstrumentWebRequestTiming
        {
            if let url = txtUrlRequest.text{
                let parentAction =  DTXAction.enter(withName: #function)
                self.apiCalls.getRequest_Manual(url:  url, parentAction: parentAction)
            }
            
        }
        else {
            self.showAlert(title: "Cannot do Auto web instrumentation", messgae: "DTXInstrumentWebViewTiming is set \(dtConfigKeys.IsInstrumentWebRequestTiming)", alertCompletionHandler: {_ in
                self.txtInformation.text = "When to use ->\nWhen the automatic instrumentation of web requests is disabled\nWhen the requests of a third-party framework aren't instrumented\nWhen you need to report non-HTTP(S) requests\n\nTo disable the automatic web request instrumentation, set the DTXInstrumentWebRequestTiming configuration key to false.\n\nhttps://www.dynatrace.com/support/help/shortlink/ios-oneagent-sdk#measure-web-requests"
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
