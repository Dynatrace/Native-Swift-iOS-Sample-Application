//
//  SegmantTableViewCell.swift
//  native-swift-ios-sample-application
//
//  Created by Sabry, Ahmad on 11.12.22.
//

import Foundation 
import Foundation
import UIKit
import Dynatrace
class SegmantTableViewCell: UITableViewCell {
    static let identifier = "SegmantTableViewCell"
    var onSegmentChanged : ((DTX_DataCollectionLevel) -> Void)? = nil
    private let iconContainer: UIView = {
       let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        view.backgroundColor = .clear
        return view
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .clear
        return imageView
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .red
        stackView.contentMode = .left
        stackView.axis = .vertical
        return stackView
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.light)
        return label
    }()
    
    private let segment: UISegmentedControl = {
        let segment = UISegmentedControl(items: ["Off","Performance","User behaviour"])
        segment.backgroundColor = .clear
        segment.selectedSegmentIndex =  Int(Dynatrace.userPrivacyOptions().dataCollectionLevel.rawValue)
     
        return segment
    }()
    
    @objc func segmentedValueChanged(_ sender:UISegmentedControl!)
     {
         if let onSegmentChanged = self.onSegmentChanged {
             switch sender.selectedSegmentIndex {
             case 0:
                 onSegmentChanged(.off)
             case 1:
                 onSegmentChanged(.performance)
             case 2:
                 onSegmentChanged(.userBehavior)
             default:
                 onSegmentChanged(.userBehavior)
             }
            
         }
     }
 
    
   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear 
        contentView.addSubview(segment)
        contentView.addSubview(iconContainer)
        iconContainer.addSubview(iconImageView)
      
        contentView.clipsToBounds = true
        
 
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    override func layoutSubviews(){
        super.layoutSubviews()
        
        let size: CGFloat = contentView.frame.size.height - 12
        iconContainer.frame = CGRect(x: 15, y: 6, width: size, height: size)
        
        let imageSize:CGFloat = size/1.5
        iconImageView.frame = CGRect(x: (size-imageSize)/2, y: (size-imageSize)/2, width: imageSize, height: imageSize)
 
        segment.addTarget(self, action: #selector(self.segmentedValueChanged(_:)), for: .valueChanged)
        label.frame = CGRect(x: 25 + iconContainer.frame.size.width,
                             y: 0,
                             width: contentView.frame.size.width - 20 - iconContainer.frame.size.width,
                             height: contentView.frame.size.height)
 
        segment.frame = CGRect(x: 25 + iconContainer.frame.size.width,
                           y: 0,
                                     width: contentView.frame.size.width - 20 - iconContainer.frame.size.width - 25,
                                     height: contentView.frame.size.height)
       
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.image = nil
        label.text = nil
        iconContainer.backgroundColor = nil
        segment.selectedSegmentIndex = -1
    }
 
    public func setSetting(with model: tblSettingsControlOption){
        label.text = model.title
 
        iconImageView.image = model.icon
       segment.selectedSegmentIndex = model.selectedOption
 
        
        if model.canNavigate
        {
            accessoryType = .disclosureIndicator
        }
    }
}
