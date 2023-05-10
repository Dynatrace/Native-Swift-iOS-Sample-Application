//
//  ViewController.swift
//  native-swift-ios-sample-application
//
//  Created by Sabry, Ahmad on 28.11.22.
//

import UIKit

struct tblSection{
    let title : String
    let options: [SettingsOptionType]
}

enum SettingsOptionType{
    case staticCell(model: tblMenuOption)
    case segmentCell(model: tblSettingsControlOption)
}

struct tblSettingsControlOption{
    let title: String
    let icon: UIImage?
    let iconBackGroundColor: UIColor
    let canNavigate: Bool
    let handler:(() -> Void)
    var selectedOption: Int
}

struct tblMenuOption{
    let title: String
    let icon: UIImage?
    let iconBackGroundColor: UIColor
    let canNavigate: Bool
    let handler:(() -> Void)
}
 

class MainStartViewController: UIViewController,  UITableViewDelegate, UITableViewDataSource {
    private let tableView: UITableView = {
            let table = UITableView(frame: .zero, style: .grouped)
            table.register(CellTableViewCell.self, forCellReuseIdentifier: CellTableViewCell.identifier)
            return table
        }()
    
    // MARK: -
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
      
        title = "Dynatrace swift Demo"
        tableView.backgroundColor = .clear
        view.addSubview(tableView)
         
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame =  view.bounds//.bounds
        
        configureModels()
    }
    override func viewDidAppear(_ animated: Bool) {
     
    }
    
     
    // MARK: - variables
      
       var models = [tblSection]()
        
       func configureModels(){
           self.models.append(tblSection(title: "Configurations values", options: [
            .staticCell(model:  tblMenuOption(title: "info.plist values", icon: UIImage(systemName: "app.fill"), iconBackGroundColor: .clear, canNavigate: true, handler: {
                self.performSegue(withIdentifier: "segueCurrentConfiguration", sender: self)
               })),
              
            .staticCell(model: tblMenuOption(title: "More config info:", icon: UIImage(systemName: "doc.richtext.fill.zh"), iconBackGroundColor: .clear, canNavigate: true,handler: {
                   self.performSegue(withIdentifier: "segueConfigurationAgent", sender: self)
                  }))
           ]))
           
           self.models.append(tblSection(title: "Demo", options: [
            .staticCell(model: tblMenuOption(title: "Auto instrumentation demo", icon: UIImage(systemName: "cursor.rays"), iconBackGroundColor: .clear, canNavigate: true,handler: {
                if !dtConfigKeys.IsAutoInstrumentationOn
                {
                    self.showAlert(title: "Auto useraction detection is not turned on.", messgae: "Review config key `DTXInstrumentAutoUserAction`", link: "https://www.dynatrace.com/support/help/shortlink/ios-configuration-keys")
                    return
                }
                self.performSegue(withIdentifier: "segueAutoInstrument", sender: self)
            })),
            .staticCell(model: tblMenuOption(title: "Manual instrumentation demo", icon: UIImage(systemName: "keyboard.fill"), iconBackGroundColor: .clear, canNavigate: true,handler: {
                if dtConfigKeys.IsAutoInstrumentationOn
                {
                    self.showAlert(title: "Auto useraction detection is turned on.", messgae: "Review config key `DTXInstrumentAutoUserAction`", link: "https://www.dynatrace.com/support/help/shortlink/ios-configuration-keys")
                    return
                }
                self.performSegue(withIdentifier: "segueManualInstrument", sender: self)
            })),
            .staticCell(model: tblMenuOption(title: "SwiftUI demo", icon: UIImage(systemName: "swift"), iconBackGroundColor: .clear, canNavigate: true,handler: {
                
                self.performSegue(withIdentifier: "segueSwiftUI", sender: self)
            }))
           ]))
           
           self.models.append(tblSection(title: "Session replay", options: [
            .staticCell(model: tblMenuOption(title: "Session replay", icon: UIImage(systemName: "play.square.fill"), iconBackGroundColor: .clear, canNavigate: true,handler: {
                   self.performSegue(withIdentifier: "segueSessionReplay", sender: self)
               })),
            .staticCell(model: tblMenuOption(title: "Crash App", icon: UIImage(systemName: "ladybug.fill"), iconBackGroundColor: .clear, canNavigate: false ,handler: {
                if untities.isDebuggerAttached
                {
                    self.showAlert(title: "Debugger attached", messgae: "Crash report wont be collected by dynatrace.\nWhen xcode debugger is attached to the process, it will hold the crash report and will not pass it to dynatrace.")
                    return
                }
                fatalError("Crash app test")
            }))
           ]))
           
           self.models.append(tblSection(title: "Advanced", options: [
            .staticCell(model: tblMenuOption(title: "Advanced configuration", icon: UIImage(systemName: "wrench.adjustable.fill"), iconBackGroundColor: .clear, canNavigate: true,handler: {
                   self.performSegue(withIdentifier: "segueAdvancedConfiguration", sender: self)
               }))
           ]))
           
           self.models.append(tblSection(title: "Public documentation", options: [
            .staticCell(model: tblMenuOption(title: "Go to public documentation", icon: UIImage(systemName: "doc.fill"), iconBackGroundColor: .clear, canNavigate: true,handler: {
                   self.performSegue(withIdentifier: "segueDocumentation", sender: self)
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

