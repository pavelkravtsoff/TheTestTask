//
//  HeaderSectionView.swift
//  TestTask
//
//  Created by Паша on 9/3/20.
//  Copyright © 2020 Паша. All rights reserved.
//

import UIKit

class HeaderSectionView: UIView {
    
    private let label: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 13)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        customInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        customInit()
    }
    
    func setTitle(_ title: String) {
        label.text = title
    }
    
    private func customInit() {
        backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        addSubview(label)
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        label.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
        label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12).isActive = true
        
        
    }
}
