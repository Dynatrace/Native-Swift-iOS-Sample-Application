//
//  ManualOtherActionsViewController.swift
//  native-swift-ios-sample-application
//
//  Created by Sabry, Ahmad on 02.01.23.
//

import UIKit
import Dynatrace

class ManualOtherActionsViewController: UIViewController {
    
    
    @IBOutlet weak var txtInformation: UITextView!
    
    @IBOutlet weak var swipableView: UIView!
    @IBOutlet weak var colorWell: UIColorWell!
    override func viewDidLoad() {
        super.viewDidLoad()
        addColorWellHandler()
        addGuesture()
        
    }
    
    func addGuesture(){
        let swipeGestureRecognizerDown = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe(_:)))
        
        swipeGestureRecognizerDown.direction = .left
        swipableView.addGestureRecognizer(swipeGestureRecognizerDown)
    }
    
    func addColorWellHandler() {
      
        colorWell.title = "Select Color"
                  colorWell.addTarget(self, action: #selector(colorWellChanged(_:)), for: .valueChanged)
        

          
      }
 
    @objc private func didSwipe(_ sender: UISwipeGestureRecognizer) { 
        let action = DTXAction.enter(withName: "Gesture performed")
        txtInformation.text = "https://www.dynatrace.com/support/help/shortlink/ios-oneagent-sdk#start-and-close-custom-action"
        self.view.backgroundColor = UIColor(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            alpha: 1.0
        )
        action?.leave()
    }
    
    @objc func colorWellChanged(_ sender: Any) {
        
       
        let action = DTXAction.enter(withName: "colorWell Changed")
        txtInformation.text = "https://www.dynatrace.com/support/help/shortlink/ios-oneagent-sdk#start-and-close-custom-action"
        self.view.backgroundColor = colorWell.selectedColor
        action?.leave()
    }
    
    @IBAction func segmantChange(_ sender: UISegmentedControl) {
        let action = DTXAction.enter(withName: "Segment Changed \(sender.description)")
        txtInformation.text = "https://www.dynatrace.com/support/help/shortlink/ios-oneagent-sdk#start-and-close-custom-action"
        action?.leave()
    }
    
    @IBAction func switchChanged(_ sender: UISwitch) {
        let action = DTXAction.enter(withName: "Switch Changed \(sender.isOn)")
        txtInformation.text = "https://www.dynatrace.com/support/help/shortlink/ios-oneagent-sdk#start-and-close-custom-action"
        action?.leave()
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        if sender.value == 1
        {
            let action = DTXAction.enter(withName: "Segment Changed \(sender.value)")
            txtInformation.text = "https://www.dynatrace.com/support/help/shortlink/ios-oneagent-sdk#start-and-close-custom-action"
            action?.leave()
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
