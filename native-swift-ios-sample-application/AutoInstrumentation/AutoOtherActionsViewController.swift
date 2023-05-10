//
//  AutoOtherActionsViewController.swift
//  native-swift-ios-sample-application
//
//  Created by Sabry, Ahmad on 12.12.22.
//

import UIKit

class AutoOtherActionsViewController: UIViewController {

    //https://www.dynatrace.com/support/help/shortlink/ios-instrumentation#limitations
    
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
        txtInformation.text =  "Guesture applied."
        txtInformation.text += "\nThis callback will not detected.\nYou can define and report custom actions. After you start them, enhance them with additional information before finally closing them.\nUse\nlet myAction = DTXAction.enter(withName: \"My action\"\n....Some Code\nmyAction?.leave()\n\nhttps://www.dynatrace.com/support/help/shortlink/ios-oneagent-sdk#create-custom-user-action"

        self.view.backgroundColor = UIColor(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            alpha: 1.0
        )
    }
    
    @objc func colorWellChanged(_ sender: Any) {
        txtInformation.text =  "Color Changed."
        txtInformation.text  += "\nThis callback will not detected.\nYou can define and report custom actions. After you start them, enhance them with additional information before finally closing them.\nUse\nlet myAction = DTXAction.enter(withName: \"My action\"\n....Some Code\nmyAction?.leave()\n\nhttps://www.dynatrace.com/support/help/shortlink/ios-oneagent-sdk#create-custom-user-action"
           self.view.backgroundColor = colorWell.selectedColor
    }
    
    @IBAction func segmantChange(_ sender: Any) {
        txtInformation.text = "Segmant Changed"
    }
    
    @IBAction func switchChanged(_ sender: Any) {
        txtInformation.text = "Switch Changed"
    }
    
    @IBAction func sliderChanged(_ sender: Any) {
        txtInformation.text = "Slider Changed"
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
