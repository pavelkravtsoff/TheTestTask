//
//  UserDetailsTableViewCell.swift
//  TestTask
//
//  Created by Паша on 9/2/20.
//  Copyright © 2020 Паша. All rights reserved.
//

import UIKit

class UserDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var rightLabel: UILabel!
    
    let identifier = String(describing: UserDetailsTableViewCell.self)
    
    var detail: UserCell? {
        didSet {
            guard let detail = detail else { return }
            leftLabel.text = detail.leftLabel
            rightLabel.text = detail.rightLabel
            if detail.isDiclosureIndicator {
                accessoryType = .disclosureIndicator
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
    }
}
