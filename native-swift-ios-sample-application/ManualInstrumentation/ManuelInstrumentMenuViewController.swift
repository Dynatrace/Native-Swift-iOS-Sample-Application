//
//  ManuelInstrumentMenuViewController.swift
//  native-swift-ios-sample-application
//
//  Created by Sabry, Ahmad on 11.12.22.
//

import UIKit
import Dynatrace

class ManuelInstrumentMenuViewController: UIViewController ,  UITableViewDelegate, UITableViewDataSource {
    
    //https://www.dynatrace.com/support/help/shortlink/ios-oneagent-sdk
    
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(CellTableViewCell.self, forCellReuseIdentifier: CellTableViewCell.identifier)
        table.register(SegmantTableViewCell.self, forCellReuseIdentifier: SegmantTableViewCell.identifier)
        return table
    }()
    
    // MARK: -
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "Manual instrumentation Demo"
        tableView.backgroundColor = .clear
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame =  view.bounds//.bounds
        tableView.rowHeight = UITableView.automaticDimension
        configureModels()
    }
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    
    // MARK: - variables
    
    var models = [tblSection]()
    
    func configureModels(){
        if dtConfigKeys.IsUserOptIn{
            self.models.append(tblSection(title: "Privacy options (Data collection level)", options: [
                .segmentCell(model:  tblSettingsControlOption(title: "", icon: UIImage(systemName: "eye.trianglebadge.exclamationmark"), iconBackGroundColor: .clear, canNavigate: false, handler: {
                    
                }, selectedOption: Int(Dynatrace.userPrivacyOptions().dataCollectionLevel.rawValue)))
                
            ]))
        }
        
        self.models.append(tblSection(title: "Actions", options: [
            .staticCell(model: tblMenuOption(title: "Actions", icon: UIImage(systemName: "rectangle.lefthalf.inset.fill.arrow.left"), iconBackGroundColor: .clear, canNavigate: true,handler: {
                let action = DTXAction.enter(withName: "Actions")
                self.performSegue(withIdentifier: "segueManualActions", sender: self)
                action?.leave()
            })),
            .staticCell(model: tblMenuOption(title: " Custom Actions", icon: UIImage(systemName: "rectangle.lefthalf.inset.fill.arrow.left"), iconBackGroundColor: .clear, canNavigate: true,handler: {
                let action = DTXAction.enter(withName: "Custom Actions")
                self.performSegue(withIdentifier: "segueManualCustomActions", sender: self)
                action?.leave()
            })),
            .staticCell(model: tblMenuOption(title: "Web Requests", icon: UIImage(systemName: "icloud.fill"), iconBackGroundColor: .clear, canNavigate: true,handler: {
                let action = DTXAction.enter(withName: "Web Requests")
                self.performSegue(withIdentifier: "segueManualWebRequests", sender: self)
                action?.leave()
            }))
            
        ]))
        
        self.models.append(tblSection(title: "Send values", options: [
            .staticCell(model: tblMenuOption(title: "Identify User", icon: UIImage(systemName: "person.fill"), iconBackGroundColor: .clear, canNavigate: true,handler: {
                
                let action = DTXAction.enter(withName: "Identify User")
                if Dynatrace.userPrivacyOptions().dataCollectionLevel == .userBehavior
                {
                    self.performSegue(withIdentifier: "segueManualIdentifyUser", sender: self)
                }
                else
                {
                    self.showAlert(title: "Review Data Collection level", messgae: "Read more about privacy settings", link: "https://www.dynatrace.com/support/help/shortlink/configure-rum-privacy-mobile#data-collection-levels")
                }
                action?.leave()
            })),
            .staticCell(model: tblMenuOption(title: "Report Errors", icon: UIImage(systemName: "questionmark.folder.ar"), iconBackGroundColor: .clear, canNavigate: true,handler: {
                let action = DTXAction.enter(withName: "Report Errors")
                self.performSegue(withIdentifier: "segueManualReportActionErrors", sender: self)
                action?.leave()
            })),
            .staticCell(model: tblMenuOption(title: "Report Global Error", icon: UIImage(systemName: "questionmark.folder.fill.ar"), iconBackGroundColor: .clear, canNavigate: true,handler: {
                let action = DTXAction.enter(withName: "Report Global Error")
                self.performSegue(withIdentifier: "segueManualGlobalErrors", sender: self)
                action?.leave()
            })),
            .staticCell(model: tblMenuOption(title: "Report values", icon: UIImage(systemName: "chart.bar.doc.horizontal"), iconBackGroundColor: .clear, canNavigate: true,handler: {
                let action = DTXAction.enter(withName: "Report values")
                if Dynatrace.userPrivacyOptions().dataCollectionLevel == .userBehavior
                {
                    self.performSegue(withIdentifier: "segueManualReportValues", sender: self)
                }
                else
                {
                    self.showAlert(title: "Review Data Collection level", messgae: "Read more about privacy settings", link: "https://www.dynatrace.com/support/help/shortlink/configure-rum-privacy-mobile#data-collection-levels")
                }
                action?.leave()
            })),
            .staticCell(model: tblMenuOption(title: "Report BizEvents", icon: UIImage(systemName: "chart.line.uptrend.xyaxis"), iconBackGroundColor: .clear, canNavigate: true,handler: {
                let action = DTXAction.enter(withName: "Report BizEvents")
                self.performSegue(withIdentifier: "segueManualBizEvents", sender: self)
                action?.leave()
            }))
            
        ]))
        
     
    }
    
    
    // MARK: - Table delegats
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = models[section]
        return section.title
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].options[indexPath.row]
        
        switch model.self {
        case .staticCell(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CellTableViewCell.identifier, for: indexPath) as? CellTableViewCell else{
                return UITableViewCell()
            }
            
            cell.dtxCustomCellName(model.title)
            cell.setSetting(with: model)
            return cell
        case .segmentCell(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SegmantTableViewCell.identifier, for: indexPath) as? SegmantTableViewCell else{
                return UITableViewCell()
            }
            
            cell.setSetting(with: model)
            cell.onSegmentChanged = { (dataCollectionLevel) in
                tableView.isUserInteractionEnabled = false
                var message = ""
                switch dataCollectionLevel {
                case .userBehavior:
                    message = "What this means?\n- userBehavior / DTX_DataCollectionUserBehavior (Performance data and user data is captured.\nIn this mode, OneAgent recognizes and reports users who revisit in the future.\nIf you haven't configured user tagging or custom value reporting, this level works similar to the Performance level.)\nOneAgent persists the data privacy settings and automatically applies them when the app is restarted.\nEach time the user changes the data collection level, OneAgent generates a new session with new settings."
                case .performance:
                    message = "What this means?\n- performance / DTX_DataCollectionPerformance (Only performance data is captured. Monitoring data that can be used to identify individual users, such as user tags and custom values, isn't captured.).\nEach time the user changes the data collection level, OneAgent generates a new session with new settings."
                case .off:
                    message = "What this means?\n- off / DTX_DataCollectionOff (Monitoring data isn't captured.)\nOneAgent generates a new session with new settings.\nEach time the user changes the data collection level, OneAgent generates a new session with new settings."
                
                @unknown default:
                    fatalError()
                }
                let alert = self.showForcedAlert(title: "Privacy changed", messgae: message)
                // Changeing privacy options
                let privacyConfig = Dynatrace.userPrivacyOptions()
                privacyConfig.dataCollectionLevel = dataCollectionLevel
                privacyConfig.crashReportingOptedIn = true
                privacyConfig.crashReplayOptedIn = true
                Dynatrace.applyUserPrivacyOptions(privacyConfig) { (successful) in
                    let action = DTXAction.enter(withName: "Privacy changed \(Dynatrace.userPrivacyOptions().description)")
                    self.forcedAlertAddButton(alert)
                    tableView.isUserInteractionEnabled = true
                    action?.leave()
                    
                }
                
            }
            return cell
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let type = models[indexPath.section].options[indexPath.row]
        
        
        switch type.self {
        case .staticCell(let model):
            model.handler()
        case .segmentCell(let model):
            model.handler()
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

