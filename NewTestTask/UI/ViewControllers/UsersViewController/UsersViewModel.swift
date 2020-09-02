//
//  UsersViewModel.swift
//  TestTask
//
//  Created by Паша on 8/28/20.
//  Copyright © 2020 Паша. All rights reserved.
//

import Foundation

class UsersViewModel {
    
    var successRequest: (([User]) -> Void)?
    var errorRequest: ((Error) -> Void)?
    
    func fetchData() {
        DataFetcher.manager.fetchUsers(success: { users in
            self.successRequest?(users)
        }) { error in
            self.errorRequest?(error)
        }
    }
}
