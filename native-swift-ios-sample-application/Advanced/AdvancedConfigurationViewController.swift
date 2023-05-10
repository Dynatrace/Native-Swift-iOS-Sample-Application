//
//  AdvancedConfigurationViewController.swift
//  native-swift-ios-sample-application
//
//  Created by Sabry, Ahmad on 11.01.23.
//

import UIKit
import Dynatrace

class AdvancedConfigurationViewController: UIViewController {
    @IBOutlet weak var txtInformation: UITextView!
    @IBOutlet weak var txtOutput: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        listenForCommunicationProblems()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self, name:  NSNotification.Name(rawValue: Dynatrace.getCommunicationProblemNotificationName()), object: nil)

    }
    
    
    // Customize beacon headers
    //https://www.dynatrace.com/support/help/shortlink/ios-advanced-settings#use-custom-http-headers
    @IBAction func btnCustomHeader_Touch(_ sender: Any) {
        
        txtInformation.text = "Set headers onto beacon."
       
        Dynatrace.setBeaconHeaders(["Cookie" : "n1=v1; n2=v2", "MyHeader" : "MyHeader", "Authorization" : "API-Token aa11bb22cc33dd44ee55"])
    }
    
    @IBAction func btnRemoveCustomHeader_Touch(_ sender: Any) {
        txtInformation.text = "Request the headers that have been set."
        Dynatrace.setBeaconHeaders(nil)
    }
  
    
    @IBAction func btnViewCustomHeader_Touch(_ sender: Any) {
        
        txtInformation.text = "Request the headers that have been set."
       
        let headers: Dictionary<String, String>? = Dynatrace.beaconHeaders()
        txtOutput.text = ""
        if let _headers = headers
        {
            for header  in _headers {
                txtOutput.text += "\(header.key) : \(header.value)\n"
            }
        }
    }
    
    func listenForCommunicationProblems(){
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.dynatraceCommunication),
            name: NSNotification.Name(rawValue: Dynatrace.getCommunicationProblemNotificationName()),
            object: nil)
    }
    
    @objc private func dynatraceCommunication(notification: NSNotification){
        let dtxIssue = Dynatrace.getCommunicationProblemNotificationName()
        
        txtOutput.text += "####\n\(dtxIssue)  \(notification.description) - \(notification.userInfo?.description ?? "" )\n"
        txtOutput.text += "##  \(notification.object  ?? "")\n"
        txtOutput.text += "-------------------------------\n"
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
