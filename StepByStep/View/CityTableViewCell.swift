//
//  CityTableViewCell.swift
//  StepByStep
//
//  Created by Abdeltwab Elhussin on 10/26/19.
//  Copyright © 2019 Abdeltwab Elhussin. All rights reserved.
//

import UIKit

class CityTableViewCell: UITableViewCell {


    
     var NameLabel : UILabel = {
     //   let lbl = UILabel()
        let lbl = UILabel(frame: CGRect(x: 20, y: 15, width: 200, height: 21))

        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
    
        lbl.textAlignment = .left
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(NameLabel)

//        NameLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: frame.size.width / 2, height: 0, enableInsets: false)



    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}
