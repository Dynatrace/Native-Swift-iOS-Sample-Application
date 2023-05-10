//
//  CellTableViewCell.swift
//  native-swift-ios-sample-application
//
//  Created by Sabry, Ahmad on 10.12.22.
//

import Foundation
import UIKit
class CellTableViewCell: UITableViewCell {
    static let identifier = "CellTableViewCell"
   
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
    
    private let label: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.numberOfLines = 2
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.light)
       
        
        return label
    }()
     
   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        contentView.addSubview(label)
      
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
        label.frame = CGRect(x: 25 + iconContainer.frame.size.width,
                             y: 0,
                             width: contentView.frame.size.width - 20 - iconContainer.frame.size.width - 25,
                             height: contentView.frame.size.height)
         
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.image = nil
        label.text = nil
        iconContainer.backgroundColor = nil
    }
 
    public func setSetting(with model: tblMenuOption){
        label.text = model.title
 
        iconImageView.image = model.icon
    
        if model.canNavigate
        {
            accessoryType = .disclosureIndicator
        }
    }
}
