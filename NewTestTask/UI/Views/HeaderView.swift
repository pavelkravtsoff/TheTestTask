//
//  HeaderView.swift
//  TestTask
//
//  Created by Паша on 9/3/20.
//  Copyright © 2020 Паша. All rights reserved.
//

import UIKit

class HeaderView: UIView {

    @IBOutlet var mainImageView: UIImageView!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var modelLabel: UILabel!
    @IBOutlet var lastLettersModel: UILabel!
    @IBOutlet var yearLabel: UILabel!
    @IBOutlet var mileageLabel: UILabel!
    @IBOutlet var zipCodeLabel: UILabel!
    @IBOutlet var historyLabel: UILabel!
    @IBOutlet var strokeView: UIView!
    @IBOutlet var customView: UIView!
    
    var user: User? {
        didSet {
            guard let user = user else { return }
            priceLabel.text = "$\(user.price)"
            modelLabel.text = user.make
            lastLettersModel.text = user.model
            yearLabel.text = "\(user.year)"
            mileageLabel.text = "\(user.mileage) miles"
            zipCodeLabel.text = user.addresses[0].zipcode
            historyLabel.text = "History not avalable"
            mainImageView.image = UIImage(named: "dzen")
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        customInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        customInit()
    }
    
    
    private func customInit() {
        let headerView = Bundle.main.loadNibNamed("HeaderView", owner: self, options: nil)?.first as! UIView
        headerView.frame = self.bounds
        headerView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(headerView)
        strokeView.layer.borderWidth = 0.25
        strokeView.layer.borderColor = UIColor.black.cgColor
    }
    
}
