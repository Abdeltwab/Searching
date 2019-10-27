//
//  CountryPagingCell.swift
//  StepByStep
//
//  Created by Abdeltwab Elhussin on 10/26/19.
//  Copyright © 2019 Abdeltwab Elhussin. All rights reserved.
//

import UIKit
import Parchment

class CountryPagingCell :PagingCell {
    
    
    
    //compontes
    fileprivate lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 13, weight: UIFont.Weight.semibold)
        label.textColor = UIColor.white
        label.backgroundColor = UIColor(white: 0, alpha: 0.6)
        label.numberOfLines = 0
        return label
    }()
    
    fileprivate lazy var paragraphStyle: NSParagraphStyle = {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.hyphenationFactor = 1
        paragraphStyle.alignment = .center
        return paragraphStyle
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.layer.cornerRadius = 6
        contentView.clipsToBounds = true
        contentView.addSubview(titleLabel)
        contentView.constrainToEdges(titleLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func setPagingItem(_ pagingItem: PagingItem, selected: Bool, options: PagingOptions) {
        let item = pagingItem as! CountryItem
        //imageView.image = item.headerImage
        titleLabel.attributedText = NSAttributedString(
            string: item.title,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        
    }
    
    
}
