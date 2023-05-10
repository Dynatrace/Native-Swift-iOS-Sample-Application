//
//  WebRequests.swift
//  native-swift-ios-sample-application
//
//  Created by Sabry, Ahmad on 04.01.23.
//

import Foundation
import Dynatrace

class WebRequests{
    
    func getRequest_Auto(url: String){
        // Create URL
        let url = URL(string: url)
        guard let requestUrl = url else {
            
            return
        }
        // Create URL Request
        var request = URLRequest(url: requestUrl)
        // Specify HTTP Method to use
        request.httpMethod = "GET"
        
        // Send HTTP Request
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            // Check if Error took place
            if let error = error {
                // print("Error took place \(error)")
                return
            }
            
            // Read HTTP Response Status code
            if let response = response as? HTTPURLResponse {
                //   print("Response HTTP Status code: \(response.statusCode)")
            }
            
            // Convert HTTP Response Data to a simple String
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                // print("Response data string:\n \(dataString)")
            }
            
        }
        task.resume()
    }
    
      func getRequest_Manual(url: String, parentAction: DTXAction?){
        let url = URL(string: url)
        guard let requestUrl = url else {
            return
            
        }
        let childAction = DTXAction.enter(withName: #function, parentAction: parentAction)
        var webrequestTiming: DTXWebRequestTiming?
        
        // Create URL Request
        var request = URLRequest(url: requestUrl)
        
        // Specify HTTP Method to use
        request.httpMethod = "GET"
        
        if let dynatraceHeaderValue = childAction?.getTagFor(url) {  //provide parent action
            let dynatraceHeaderKey = Dynatrace.getRequestTagHeader() //this could be cached as it always is x-dynatrace
            request.addValue(dynatraceHeaderValue, forHTTPHeaderField: dynatraceHeaderKey)
            webrequestTiming = DTXWebRequestTiming.getDTXWebRequestTiming(dynatraceHeaderValue, request: url)
        }
        
        // Send HTTP Request
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            defer {
                parentAction?.leave()   //leave parent action when request finished - all child actions are automaticlly left on leaving parent
            }
            
            
            // Check if Error took place
            if let error = error {
                webrequestTiming?.stop("failed") //stop webrequest timing in error case
                return
            }
            
            // Read HTTP Response Status code
            if let response = response as? HTTPURLResponse {
                //   print("Response HTTP Status code: \(response.statusCode)")
            }
            
            // Convert HTTP Response Data to a simple String
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                // print("Response data string:\n \(dataString)")
            }
            webrequestTiming?.stop((response as! HTTPURLResponse).statusCode.description) //stop webrequest when request finished
            
        }
        task.resume()
    }
}
