//
//  ProgressIndicatorTableViewCell.swift
//  TestTask
//
//  Created by Паша on 9/2/20.
//  Copyright © 2020 Паша. All rights reserved.
//

import UIKit

class ProgressIndicatorTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var progressViewTrailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var progressView: UIView!
    
    let identifier = String(describing: ProgressIndicatorTableViewCell.self)

    var progressIndicator: ProgressIndicatorCell? {
        didSet {
            guard let progressIndicator = progressIndicator else { return }
            let percent = CGFloat(Double(progressIndicator.progress.current) / Double(progressIndicator.progress.total))
            let width = UIScreen.main.bounds.width - 32
            let greenViewWidth = width * percent
            progressViewTrailingConstraint.constant = width - greenViewWidth
            titleLabel.text = progressIndicator.title
            progressLabel.text = "\(Int((percent * 100))) %"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        progressView.layer.borderColor = UIColor.black.cgColor
        progressView.layer.borderWidth = 0.25
        selectionStyle = .none
    }
}
