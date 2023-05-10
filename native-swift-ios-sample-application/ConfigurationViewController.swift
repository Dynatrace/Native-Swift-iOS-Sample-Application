//
//  ConfigurationViewController.swift
//  native-swift-ios-sample-application
//
//  Created by Sabry, Ahmad on 14.02.23.
//

import UIKit

class ConfigurationViewController: UIViewController ,  UITableViewDelegate, UITableViewDataSource {
   
    
    private let tableView: UITableView = {
            let table = UITableView(frame: .zero, style: .grouped)
            table.register(CellTableViewCell.self, forCellReuseIdentifier: CellTableViewCell.identifier)
            return table
        }()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Info.plist values"
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
           self.models.append(tblSection(title: "Info.plist values", options: [
            .staticCell(model:  tblMenuOption(title: "Application ID:\n \(dtConfigKeys.ApplicationId)", icon: UIImage(systemName: "app.fill"), iconBackGroundColor: .clear, canNavigate: false, handler: {
                   
               })),
            .staticCell(model: tblMenuOption(title: "Auto Action enabled: \(dtConfigKeys.IsAutoInstrumentationOn)", icon: UIImage(systemName: "cursor.rays"), iconBackGroundColor: .clear, canNavigate: false, handler: {
               })),
                .staticCell(model: tblMenuOption(title: "Data Privacy: \(dtConfigKeys.IsUserOptIn)", icon: UIImage(systemName: "eye.trianglebadge.exclamationmark.fill"), iconBackGroundColor: .clear, canNavigate: false,handler: {
               })),
            .staticCell(model: tblMenuOption(title: "Log level: \(dtConfigKeys.LogLevel)\nBefore opening a support ticket, Collect Logs ALL", icon: UIImage(systemName: "doc.plaintext.fill"), iconBackGroundColor: .clear, canNavigate: true,handler: {
                if let url = URL(string: "https://www.dynatrace.com/support/help/shortlink/ios-logging"), UIApplication.shared.canOpenURL(url) {
                    UIApplication.shared.open(url)
                }
           })),
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
                 cell.setSetting(with: model)
                 return cell
           case .segmentCell(_):
               return UITableViewCell()
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
