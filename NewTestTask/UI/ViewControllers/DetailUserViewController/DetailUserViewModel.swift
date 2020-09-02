//
//  DetailUserViewModel.swift
//  TestTask
//
//  Created by Паша on 9/2/20.
//  Copyright © 2020 Паша. All rights reserved.
//

import Foundation

class DetailUserViewModel {
    
    var userDetails: (([[Any]], [String]) -> Void)?
    
    func getDetails(_ user: User) {
        
        let details = getCells(user: user)
        let titles = getHeaders()
        userDetails?(details, titles)
    }
    
    private func getCells(user: User) -> [[Any]] {
        let lastArray: [UserCell]
        
        if let email = user.owner.email {
            lastArray = [UserCell(leftLabel: "Email", rightLabel: email, isDiclosureIndicator: true),
                         UserCell(leftLabel: "Phone", rightLabel: user.phone, isDiclosureIndicator: true)]
        } else {
            lastArray = [UserCell(leftLabel: "Phone", rightLabel: user.phone, isDiclosureIndicator: true)]
        }
        
        let cells: [[Any]] = [
            [ProgressIndicatorCell(title: "Completion Score", progress: user.progress)],
            [UserCell(leftLabel: "Price", rightLabel: "$\(user.price)", isDiclosureIndicator: true),
             UserCell(leftLabel: "Photos", rightLabel: "\(user.images.count) Photos", isDiclosureIndicator:true)
            ],
            [UserCell(leftLabel: "Trim", rightLabel: user.trim, isDiclosureIndicator: true),
             UserCell(leftLabel: "Features", rightLabel: "Add Features", isDiclosureIndicator: true),
             UserCell(leftLabel: "Transmission", rightLabel: user.transmission, isDiclosureIndicator: true),
             UserCell(leftLabel: "Mileage", rightLabel: "\(user.mileage) miles", isDiclosureIndicator: false),
             UserCell(leftLabel: "Zip Code", rightLabel: user.addresses[0].zipcode, isDiclosureIndicator: true)
            ],
            lastArray
        ]
        return cells
    }
    
    private func getHeaders() -> [String] {
        let titles = [
            "",
            "Listing Details",
            "Vehicle Details",
            "Contact Info"
        ]
        return titles
    }
    
}
