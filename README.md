Dynatrace iOS Tutorial Application
====================================
___

Table of Contents
-----------------

- [Dynatrace iOS Swift Tutorial Application](#dynatrace-ios-tutorial-application)
  - [Table of Contents](#table-of-contents)
  - [About](#about)
    - [Helpful Documentation \& Resources](#helpful-documentation--resources)
    - [Covered in this tutorial](#covered-in-this-tutorial)
  - [Pre-requisites](#pre-requisites)
  - [Download \& Setup](#download--setup)
  - [Tutorial Guidebook](#tutorial-guidebook)

___

About
-----

This Sample iOS Mobile App is a tutorial for Dynatrace Mobile Monitoring demostrating feature sets of SDK

iOS OneAgent SDK will instrument your app austomatically, additionally you extend the instrumentation by doing what SDK offers as capabilities like:
Tag user
Define custom actions
Report custom errors
Add session and user action properties
And more…

### Helpful Documentation & Resources
- Dynatrace Public Documentation for iOS Monitoring
  - [Instrument iOS Apps](https://www.dynatrace.com/support/help/shortlink/ios-hub)
- Dynatrace *IOS Configuration **Keys*** reference
  - [Only required if fine-tune auto-instrumentation](https://www.dynatrace.com/support/help/shortlink/ios-configuration-keys)
- Dynatrace *iOS **OneAgent API*** reference
  - [OneAgent SDK for iOS](https://www.dynatrace.com/support/help/shortlink/ios-oneagent-sdk)
- SwiftUI
  - [Add SwiftUI instrumentation](https://www.dynatrace.com/support/help/shortlink/swiftui-instrumentation)


### Covered in this tutorial
- **Data Privacy**
  - DataCollectionLevel and User opt-in
  - User Tagging
- **User Action Monitoring**
  - Automatic Instrumentation
  - Action Naming
  - Modifying Actions with SDK
  - Manual Instrumentation & Custom Actions
- **Web Request Monitoring**
  - Standalone web requests (requests with no linked user action)
  - Linked web requests (requests that are linked to user actions)
  - Manually tag and monitor web requests
- **Crash Analysis & Session Replay**
  - Report Crashes
  - Configure Masking for Session Replay
- **Data & Metrics**
  - Reporting Errors, Events, and Values
  - Create User Action and User Session Properties
- **Advanced Topics**
  - Adding Custom HTTP Headers to Beacon Values
- **SwiftUI**
  - SwiftUI Instrumentation


___

Pre-requisites
--------------------------------------------------

  - **macOS **
    - Xcode 
 
  - **Dynatrace Tenant with a Mobile Application created in the UI**
 
___

Download & Setup
--------------------

1. **Download the Application from this Bitbucket Repository**
   - (... > Download) and save the project to the local machine then unzip the archive

2. **Follow instrumentation wizard from dynatrace application**
   
