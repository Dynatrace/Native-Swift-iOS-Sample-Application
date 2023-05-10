//
//  AutoBizEventViewController.swift
//  native-swift-ios-sample-application
//
//  Created by Sabry, Ahmad on 04.01.23.
//

import UIKit
import Dynatrace

class AutoBizEventViewController: UIViewController {

    @IBOutlet weak var txtInformation: UITextView!
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnAutoBizEvent_Touch(_ sender: Any) {
        let attributes: [String: Any] = [
            "event.name": "Confirmed Booking",
            "screen": "booking-confirmation",
            "product": "Danube Anna Hotel",
            "amount": 358.35,
            "currency": "USD",
            "reviewScore": 4.8,
            "arrivalDate": "2022-11-05",
            "departureDate": "2022-11-15",
            "journeyDuration": 10,
            "adultTravelers": 2,
            "childrenTravelers": 0
        ]
        Dynatrace.sendBizEvent(withType: "com.dynatrace.demo.funnel.booking_finished", attributes: attributes)
      
        txtInformation.text = "For more information\n\nhttps://www.dynatrace.com/support/help/how-to-use-dynatrace/business-analytics"
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
