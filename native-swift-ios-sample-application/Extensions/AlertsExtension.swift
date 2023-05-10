//
//  Alerts.swift
//  native-swift-ios-sample-application
//
//  Created by Sabry, Ahmad on 10.12.22.
//

import Foundation
import UIKit

extension UIViewController {
    
    // MARK: - Default Alert
    func showAlert(title: String, messgae: String)
       {
           let alert = UIAlertController(title: title, message: messgae, preferredStyle: .alert)
           alert.addAction(UIAlertAction(title: "Got it!", style: .default, handler: nil ))
           self.present(alert, animated: true, completion: nil)
       }

    // MARK: -   Alert With link
    func showAlert(title: String, messgae: String, link: String)
       {
           let alert = UIAlertController(title: title, message: messgae, preferredStyle: .alert)
           alert.addAction(UIAlertAction(title: "More info?", style: .default, handler: { (action) -> Void in
             
               if let url = URL(string: link), UIApplication.shared.canOpenURL(url) {
                   UIApplication.shared.open(url)
               }
           }))
         
           
           alert.addAction(UIAlertAction(title: "Got it!", style: .default, handler: nil ))
           self.present(alert, animated: true, completion: nil)
       }

       
    // MARK: - Auto closing Alert
       func showAlert(title: String, messgae: String, timeoutSeconds : Double)
       {
           let alert = UIAlertController(title: title, message: messgae, preferredStyle:  .alert)
           alert.addAction(UIAlertAction(title: "Got it!", style: .default, handler: nil ))
           self.present(alert, animated: true, completion: nil)
        
           // change to desired number of seconds (in this case 5 seconds)
           let when = DispatchTime.now() + timeoutSeconds
           DispatchQueue.main.asyncAfter(deadline: when){
               alert.dismiss(animated: true, completion: nil)
           }
       }

    // MARK: - Alert with callback
    typealias AlertCommentCompletionHandler = (_ ok:Bool) -> Void
       func showAlert(title: String,  messgae: String, alertCompletionHandler:@escaping  AlertCommentCompletionHandler)
       {
           let alertController = UIAlertController(title: title , message: messgae, preferredStyle: UIAlertController.Style.alert)
           
           let doneAction = UIAlertAction(title: "Got it!", style: UIAlertAction.Style.default, handler: { alert -> Void in
               alertCompletionHandler(true)
           })
           
 
           
           alertController.addAction(doneAction)
//           alertController.addAction(cancelAction)
           
           self.present(alertController, animated: true, completion: nil)
       }
    
    // MARK: - Default Alert with call back
  
    
    // MARK: - Auto closing Alert
    func showForcedAlert(title: String, messgae: String)  -> UIAlertController
       {
           let alert = UIAlertController(title: title, message: messgae, preferredStyle:  .alert)
        
           self.present(alert, animated: true, completion: nil)
          return alert
       }
    func forcedAlertAddButton(_ alert : UIAlertController)
    {
        alert.addAction(UIAlertAction(title: "Got it!", style: .default, handler: nil ))
    }

    
}
