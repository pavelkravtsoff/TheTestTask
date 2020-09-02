//
//  UserTableViewCell.swift
//  TestTask
//
//  Created by Паша on 8/28/20.
//  Copyright © 2020 Паша. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    let identifier = String(describing: UserTableViewCell.self)
    
    var user: User? {
        didSet {
            guard let user = user else { return }
            surnameLabel.text = user.owner.lastName
            nameLabel.text = user.owner.firstName
            emailLabel.text = user.owner.email
            fetchImage(from: user.owner.photoUrl)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        parentView.layer.cornerRadius = 8
        selectionStyle = .none
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        avatarImageView.layer.cornerRadius = avatarImageView.frame.height / 2
    }
    
    private func fetchImage(from string: String) {
        
        DataFetcher.manager.fetchImage(urlString: string, success: { fetchedImage in
            DispatchQueue.main.async {
                self.avatarImageView.image = fetchedImage
            }
        }, fail: nil)
    }
    
}
