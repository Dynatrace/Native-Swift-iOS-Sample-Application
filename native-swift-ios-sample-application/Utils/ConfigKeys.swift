//
//  ConfigKeys.swift
//  native-swift-ios-sample-application
//
//  Created by Sabry, Ahmad on 10.12.22.
//

import Foundation

struct ConfigKeys{
    
    init()
    {
        validateInfoPlist()
    }
    public var IsAutoInstrumentationOn :Bool = true
    public var ApplicationId : String = ""
    public var BeaconURL : String = ""
    public var IsUserOptIn :Bool = false
    public var IsAutoStart :Bool = true
    public var IsHybridApplication :Bool = false
    public var LogLevel : String = ""
    public var  IsInstrumentWebRequestTiming :Bool = true
    
    // MARK: - Just for demo flow - validating configuration keys
    mutating private func validateInfoPlist(){
        // More information on iOS configuration keys can be found here https://www.dynatrace.com/support/help/shortlink/ios-configuration-keys
        
        
        /*
         <key>DTXApplicationID</key>
         Identifies your mobile app. Auto-instrumentation reports an error if the key isn't present.
         */
          ApplicationId = Bundle.main.object(forInfoDictionaryKey: "DTXApplicationID") as? String ?? "Not configured"
        
        /*
         <key>DTXBeaconURL</key>
         This key's value is used to identify your environment within Dynatrace. Auto-instrumentation reports an error if the key is not present.
         */
        BeaconURL = Bundle.main.object(forInfoDictionaryKey: "DTXBeaconURL") as? String ?? "Not configured"
         
        /*
         <key>DTXAutoStart</key>
         When set to false, OneAgent doesn't start automatically, so you should start it manually.
         */
        let DTXAutoStart = Bundle.main.object(forInfoDictionaryKey: "DTXAutoStart") as? Bool
        if (DTXAutoStart == nil || DTXAutoStart == true)
        {
            IsAutoStart = true
        }
        else
        {
            IsAutoStart = false
        }
        
        /*
         <key>DTXInstrumentAutoUserAction</key>
         Turns on the ability to automatically create user actions for user interactions with the app, such as button clicks. Set the value to false to disable automatic creation of user actions.
         */
        let DTXInstrumentAutoUserAction = Bundle.main.object(forInfoDictionaryKey: "DTXInstrumentAutoUserAction") as? Bool
        if (DTXInstrumentAutoUserAction == nil || DTXInstrumentAutoUserAction == true)
        {
            IsAutoInstrumentationOn = true
        }
        else
        {
            IsAutoInstrumentationOn = false
        }
        
        /*
         <key>DTXUserOptIn</key>
         When set to true, activates the privacy mode. The user consent needs to be queried and set. The privacy settings for data collection and crash reporting can be changed via the OneAgent SDK for Mobile like described in Configure data privacy (user opt-in mode).
         */
        let DTXUserOptIn = Bundle.main.object(forInfoDictionaryKey: "DTXUserOptIn") as? Bool
        if (DTXUserOptIn == nil || DTXUserOptIn == false)
        {
            IsUserOptIn = false
        }
        else
        {
            IsUserOptIn = true
        }
        
        /*
         <key>DTXHybridApplication</key>
         For hybrid apps, set the value to true. This is necessary to share the same visit for user actions created by the RUM JavaScript.
         */
        let DTXHybridApplication = Bundle.main.object(forInfoDictionaryKey: "DTXHybridApplication") as? Bool
        if (DTXHybridApplication == nil || DTXHybridApplication == false)
        {
            IsHybridApplication = false
        }
        else
        {
            IsHybridApplication = true
        }
        
        /*
         <key>DTXInstrumentWebRequestTiming</key>
         Turns on automatic web request timing and tagging. To disable automatic web request timing and tagging, set the value to false.
         */
        let DTXInstrumentWebRequestTiming = Bundle.main.object(forInfoDictionaryKey: "DTXInstrumentWebRequestTiming") as? Bool
        if (DTXInstrumentWebRequestTiming == nil || DTXInstrumentWebRequestTiming == true)
        {
            IsInstrumentWebRequestTiming = true
        }
        else
        {
            IsInstrumentWebRequestTiming = false
        }
        
        /*
         <key>DTXLogLevel</key>
         If this key is present with a valid value, OneAgent logging is automatically enabled with the set value. If a key isn't present or doesn't have a valid value, automatic logging is turned off and must be turned on manually in the app.
         Possible values: OFF, SEVERE, WARNING, INFO, ALL
         */
        LogLevel = Bundle.main.object(forInfoDictionaryKey: "DTXLogLevel") as? String ?? "OFF"
    }
}
